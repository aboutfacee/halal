package front.controller.restaurant;

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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.session.AdminLoginProc;
import com.util.CookieUtil;
import com.util.PageNavigation;
import com.util.StringUtil;

import front.vo.HotelVO;
import front.vo.MemberVO;
import front.vo.RestaurantVO;
import net.sf.json.JSONObject;


@Controller
public class OrderController {
	@Autowired
	private SqlSession sqlSession;
	AdminLoginProc loginProc = new AdminLoginProc();
	CookieUtil cookie = new CookieUtil();
	
	// 장바구니 넣기
	@RequestMapping("/AddCart")
	public ModelAndView AddCart(HttpServletRequest request, HttpServletResponse response, RestaurantVO paramVO) {
		
		String dataPack = request.getParameter("paramPack");
		JSONObject dataObj = JSONObject.fromObject(dataPack);
		HashMap jasonMap = (HashMap)JSONObject.toBean(dataObj, HashMap.class);
		
		paramVO.setMenu_no(jasonMap.get("menu_no").toString());
		paramVO.setCart_no(jasonMap.get("cart_no").toString());
		List<RestaurantVO> restaurantVo = sqlSession.selectList("order.checkMenu", paramVO);
		
		
		
		if(restaurantVo.get(0).getMenu_no().toString().equals("0"))//카트에 맨 처음 넣을 때
		{
			paramVO.setCount(String.valueOf(Integer.parseInt(restaurantVo.get(0).getCount()) + 1 ));
			sqlSession.update("order.addFirstCart", paramVO);
			sqlSession.update("order.updCartMenu", paramVO);

		}else {
			
			List<RestaurantVO> restaurant = sqlSession.selectList("order.checkMenuCount", paramVO);
			
			if(restaurant.size()>0){
				paramVO.setCount(String.valueOf(Integer.parseInt(restaurant.get(0).getCount()) + 1 ));
				sqlSession.update("order.updCartMenu", paramVO);
			}else {
				sqlSession.insert("order.addCartMenu", paramVO);
			}
		}
		List<RestaurantVO> result = sqlSession.selectList("order.selCart", paramVO);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("resultVO", result);
		
		ModelAndView mav = new ModelAndView("jsonView", resultMap);
		return mav;
	}
	
	// 장바구니 빼기
	@RequestMapping("/DeleteCart")
	public ModelAndView DeleteCart(HttpServletRequest request, HttpServletResponse response, RestaurantVO paramVO) {
		
		String dataPack = request.getParameter("paramPack");
		JSONObject dataObj = JSONObject.fromObject(dataPack);
		HashMap jasonMap = (HashMap)JSONObject.toBean(dataObj, HashMap.class);
		
		paramVO.setMenu_no(jasonMap.get("menu_no").toString());
		paramVO.setCart_no(jasonMap.get("cart_no").toString());
		
		sqlSession.update("order.deleteMenu", paramVO);
		
		List<RestaurantVO> result = sqlSession.selectList("order.selCart", paramVO);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("resultVO", result);
		
		ModelAndView mav = new ModelAndView("jsonView", resultMap);
		return mav;
	}
	
	// 주문하기
	@RequestMapping("/CheckOut")
	public ModelAndView CheckOut(HttpServletRequest request, HttpServletResponse response, RestaurantVO paramVO) {
		
		List<RestaurantVO> cartVO = sqlSession.selectList("order.selCart", paramVO);
		List<HotelVO> hotelVO = sqlSession.selectList("hotel.selHotel", paramVO);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("cartVO", cartVO);
		resultMap.put("hotelVO", hotelVO);
		ModelAndView mav = new ModelAndView("/order/cart", "resultMap", resultMap);
		return mav;
	}
	
	// 주문하기
	@RequestMapping("/CheckOutTotal")
	public ModelAndView CheckOutTotal(HttpServletRequest request, HttpServletResponse response, RestaurantVO paramVO) {

		String dataPack = request.getParameter("paramPack");
		JSONObject dataObj = JSONObject.fromObject(dataPack);
		HashMap jasonMap = (HashMap)JSONObject.toBean(dataObj, HashMap.class);
		
		paramVO.setCart_no(jasonMap.get("cart_no").toString());
		List<RestaurantVO> result = sqlSession.selectList("order.selCart", paramVO);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("resultVO", result);
		
		ModelAndView mav = new ModelAndView("jsonView", resultMap);
		return mav;
	}
	
	// 회원 가입
	@RequestMapping("/OrderMemberJoin")
	public String OrderMemberJoin(HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttr, MemberVO paramVO) throws DataAccessException, SQLException, IOException{
		response.setCharacterEncoding("utf-8");
		paramVO.setPwd(StringUtil.encrypt(paramVO.getPwd()));
		
		sqlSession.insert("member.insMember", paramVO);
		
		loginProc.setSession(request, paramVO.getEmail(), paramVO.getPwd(), sqlSession);

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("paramVO", paramVO);
		
		redirectAttr.addFlashAttribute("resultMap", resultMap);
		
		return "redirect:/halal/CheckOut";		

	}
	
	// 지불 방법
	@RequestMapping("/SelPayment")
	public ModelAndView SelPayment(HttpServletRequest request, HttpServletResponse response, RestaurantVO paramVO, ModelMap model) {
		
		
		List<RestaurantVO> cartVO = sqlSession.selectList("order.selCart", paramVO);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("cartVO", cartVO);
		ModelAndView mav = new ModelAndView("/order/cart_2", "resultMap", resultMap);
		return mav;
	}
}
