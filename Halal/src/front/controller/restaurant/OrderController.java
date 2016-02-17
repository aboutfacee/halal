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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.session.AdminLoginProc;
import com.util.CookieUtil;
import com.util.PageNavigation;
import com.util.StringUtil;

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
}
