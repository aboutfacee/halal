package front.controller.main;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.tools.JavaFileManager.Location;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UrlPathHelper;

import com.session.AdminLoginProc;
import com.util.CookieUtil;
import com.util.MailSend;
import com.util.PageNavigation;
import com.util.StringUtil;

import front.vo.MemberVO;
import net.sf.json.JSONObject;


@Controller
public class MainController {
	@Autowired
	private SqlSession sqlSession;
	AdminLoginProc loginProc = new AdminLoginProc();
	CookieUtil cookie = new CookieUtil();
	
	// 메인으로 이동
	@RequestMapping("/Index")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("/index");
		return mav;
	}
	
	// 회원 가입
	@RequestMapping("/MemberJoin")
	public String memberJoin(HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttr, MemberVO paramVO) {
		response.setCharacterEncoding("utf-8");
		paramVO.setPwd(StringUtil.encrypt(paramVO.getPwd()));
		
		sqlSession.insert("member.insMember", paramVO);
		
		String url = paramVO.getReturnUrl();
		int a = url.lastIndexOf("jsp/");
		String returnUrl = url.substring(a+3, url.length()-4);
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("paramVO", paramVO);
		
		redirectAttr.addFlashAttribute("resultMap", resultMap);
		
		switch(returnUrl)
		{
		case "/restaurant/list_page" :
			return "redirect:/halal/RestaurantList";
		case "/index" :
			return "redirect:/halal/Index";
		case "/restaurant/detail_page" :
			return "redirect:/halal/RestaurantList";
		case "/order/cart" :
			return "redirect:/halal/Index";
		default :
			return "redirect:/halal/RestaurantList";
		}
	}
	
	//로그인 
	@RequestMapping("/MemberLogin")
	public String MemberLogin(HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttr, MemberVO paramVO) throws IOException{
		//paramVO.setPwd(StringUtil.encrypt(paramVO.getPwd()));
		//String inputId = paramVO.getUserId();
		//paramVO.setAuth("002");
		paramVO.setPwd(StringUtil.encrypt(paramVO.getPwd()));
		MemberVO memberIdVO = sqlSession.selectOne("member.memberLogin", paramVO);
		String id = ""; 
		String pass = "";
		if(memberIdVO != null){
			id = memberIdVO.getEmail();
			pass = memberIdVO.getPwd();
		}

		
		
		String url = paramVO.getReturnUrl();
		int a = url.lastIndexOf("jsp/");
		String returnUrl = url.substring(a+3, url.length()-4);
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		if(id != null && !id.equals("")){
		/*	if("on".equals(paramVO.getId_save())){
			cookie.setCookie(response, "managerId", id); //쿠키에 아이디 저장
			}else{
			cookie.delCookie(request, response); //쿠키 삭제
			}*/
			loginProc.setSession(request, id, pass, sqlSession);
			//resultMap.put("loginChk", "Y");// 로그인 성공

			redirectAttr.addFlashAttribute("resultMap", resultMap);
			
			switch(returnUrl)
			{
			case "/restaurant/list_page" :
				return "redirect:/halal/RestaurantList";
			case "/index" :
				return "redirect:/halal/Index";
			case "/restaurant/detail_page" :
				return "redirect:/halal/RestaurantList";
			case "/order/cart" :
				return "redirect:/halal/CheckOut";
			default :
				return "redirect:/halal/RestaurantList";
			}
			
		} else {
		/*	MemberVO chkVo = new MemberVO();
			chkVo.setUserId(inputId);
		//	chkVo.setAuth("002");
			MemberVO chkIdVO = sqlSession.selectOne("member.selId", chkVo);
			if(chkIdVO.getId_cnt() == 0){
			resultMap.put("loginChk", "N");// 일치하는 아이디가 없음
			} else {
			resultMap.put("loginChk", "I");// 비밀번호가 틀림
			}*/

			redirectAttr.addFlashAttribute("resultMap", resultMap);
			
			switch(returnUrl)
			{
			case "/restaurant/list_page" :
				return "redirect:/halal/RestaurantList";
			case "/index" :
				return "redirect:/halal/Index";
			case "/restaurant/detail_page" :
				return "redirect:/halal/RestaurantList";
			case "/order/cart" :
				return "redirect:/halal/Index";
			default :
				return "redirect:/halal/RestaurantList";
			}			
		}
	}
	
	//로그아웃
	@RequestMapping("/Logout")
	public ModelAndView Logout(HttpServletRequest request, HttpServletResponse response) throws DataAccessException, SQLException, IOException {
	HttpSession	session = request.getSession(true);
	//session.invalidate();
	session.removeAttribute("USERINFO");
	return new ModelAndView("/index");
	}
	
	
	//새로운 비밀번호 부여받기
	@RequestMapping("/SendPassword")
	public ModelAndView SendPassword(HttpServletRequest request, HttpServletResponse response, MemberVO paramVO) throws IOException{
		
		String email = paramVO.getEmail();
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		if(email != null && !email.equals("")){
			resultMap.put("memberEmail", email);
			
			System.out.println("Asdfasdfasd");
			String randomPw = StringUtil.randomPw(8)+StringUtil.random(3);

			String sendName = "HALAL OPPA";
			String fromMail = "halaloppa@halaloppa.com";
			String title = "[HALAL OPPA] 임시 비밀번호 발송메일 입니다.";
			String targetMail = email;
			
			MailSend send = new MailSend();
	    	send.mailSend(sendName, fromMail, targetMail, title, "임시 비밀번호는 " + randomPw + "입니다.");
	    	paramVO.setPwd(StringUtil.encrypt(randomPw));
	    	sqlSession.update("member.updPwd", paramVO);
			ModelAndView mav = new ModelAndView("jsonView",resultMap);
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("jsonView",resultMap);
			return mav;
		}

	}
}
