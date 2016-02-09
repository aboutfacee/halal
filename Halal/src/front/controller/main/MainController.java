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

import com.session.AdminLoginProc;
import com.util.CookieUtil;
import com.util.PageNavigation;
import com.util.StringUtil;

import front.vo.MemberVO;


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
	public ModelAndView memberJoin(HttpServletRequest request, HttpServletResponse response, MemberVO paramVO) {
		response.setCharacterEncoding("utf-8");
		
		List<MemberVO> check = sqlSession.selectList("member.selMember", paramVO);
		if(check.isEmpty())
		{
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("paramVO", paramVO);
			ModelAndView mav = new ModelAndView("/halal/InsertMember", "resultMap", resultMap);
			return mav;
		}
		else
		{
			ModelAndView mav = new ModelAndView("/index");
			return mav;
		}
		
	}
	
	// 회원 가입
		@RequestMapping("/InsertMember")
		public ModelAndView insertMember(HttpServletRequest request, HttpServletResponse response, MemberVO paramVO) {
			response.setCharacterEncoding("utf-8");
			paramVO.setPwd(StringUtil.encrypt(paramVO.getPwd()));
			
			sqlSession.insert("member.insMember", paramVO);
			
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("paramVO", paramVO);
			ModelAndView mav = new ModelAndView("/index", "resultMap", resultMap);
			return mav;
		}
	
	//로그인 
	@RequestMapping("/MemberLogin")
	public ModelAndView MemberLogin(HttpServletRequest request, HttpServletResponse response, MemberVO paramVO) throws IOException{
		ModelAndView mav = null;
		//paramVO.setPwd(StringUtil.encrypt(paramVO.getPwd()));
		//String inputId = paramVO.getUserId();
		//paramVO.setAuth("002");
		paramVO.setPwd(StringUtil.encrypt(paramVO.getPwd()));
		MemberVO memberIdVO = sqlSession.selectOne("member.memberLogin", paramVO);
		String id = ""; 
		String pass = "";
		String auth = "";
		if(memberIdVO != null){
			id = memberIdVO.getEmail();
			pass = memberIdVO.getPwd();
			
			if(id.equals("admin"))
				auth = "1";
			else
				auth = "0";
		}

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		if(id != null && !id.equals("")){
		/*	if("on".equals(paramVO.getId_save())){
			cookie.setCookie(response, "managerId", id); //쿠키에 아이디 저장
			}else{
			cookie.delCookie(request, response); //쿠키 삭제
			}*/
			loginProc.setSession(request, id, pass, auth, sqlSession);
			//resultMap.put("loginChk", "Y");// 로그인 성공

			mav = new ModelAndView("/index", "resultMap",resultMap);
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

			mav = new ModelAndView("/index", "resultMap", resultMap);
		}
	
		return mav;
	}
	
	//로그아웃
	@RequestMapping("/Logout")
	public ModelAndView logOut(HttpServletRequest request, HttpServletResponse response) throws DataAccessException, SQLException, IOException {
	HttpSession	session = request.getSession(true);
	//session.invalidate();
	session.removeAttribute("USERINFO");
	return new ModelAndView("/index");
	 
	}
}
