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


@Controller
public class RestaurantController {
	@Autowired
	private SqlSession sqlSession;
	AdminLoginProc loginProc = new AdminLoginProc();
	CookieUtil cookie = new CookieUtil();
	
	// 식당 리스트
	@RequestMapping("/RestaurantList")
	public ModelAndView RestaurantList(HttpServletRequest request, HttpServletResponse response, RestaurantVO paramVO) {
		
		List<RestaurantVO> restaurantVo = sqlSession.selectList("restaurant.selRestaurant", paramVO);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("restaurantList", restaurantVo);
		resultMap.put("paramVO", paramVO);
		
		ModelAndView mav = new ModelAndView("/restaurant/list_page", "resultMap", resultMap);
		return mav;
	}
	
	// 식당 상세
	@RequestMapping("/RestaurantDetail")
	public ModelAndView RestaurantDetail(HttpServletRequest request, HttpServletResponse response, RestaurantVO paramVO) {
		
		List<RestaurantVO> menuVo = sqlSession.selectList("restaurant.selMenu", paramVO);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("menuList", menuVo);
		resultMap.put("paramVO", paramVO);
		
		ModelAndView mav = new ModelAndView("/restaurant/detail_page", "resultMap", resultMap);
		return mav;
	}
}
