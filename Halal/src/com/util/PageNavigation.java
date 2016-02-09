package com.util;
 
import java.util.HashMap;

import org.apache.log4j.Logger;

/**
 *
 * @author 
 * @version
 * @since 
 *
 * @see
 */
public class PageNavigation {
	public int rowRange  = 12; // 결과목록에 보여지는 레코드수
	public int pageRange = 10; // 페이지출력 범위
	static Logger logger = Logger.getLogger(StringUtil.class);
	
	public PageNavigation(){
	}
	
	public PageNavigation(int row_range){
		rowRange = row_range;
	}
	
	public int getStartNum(String currPageStr){
		int currPage = 1;
		if(currPageStr == null || currPageStr.equals("") || currPageStr.equals("0")) {
			currPage = 1;
		} else {
			currPage = Integer.parseInt(currPageStr); // 현재페이지
		}
		int startnum = (currPage - 1 ) * rowRange;
		
		return startnum;
	}
	
	public int getStartNum(String currPageStr, int rowRange){
		this.rowRange = rowRange;
		
		int currPage = 1;
		if(currPageStr == null || currPageStr.equals("")) {
			currPage = 1;
		} else {
			currPage = Integer.parseInt(currPageStr); // 현재페이지
		}
		int startnum = (currPage - 1 ) * rowRange;
		
		return startnum;
	}
	
	public HashMap pageNavi(int currPage, int rowRange, int pageRange, int totalCnt) {
//		int totalCnt  = 0; // 전체 레코드수
//		int rowRange  = 10; // 결과목록에 보여지는 레코드수
//		int pageRange = 10; // 페이지출력 범위
//		int currPage = 1;
//		if(cur_page == null || cur_page.equals("")) {
//			currPage = 1;
//		} else {
//			currPage = Integer.parseInt(cur_page); // 현재페이지
//		}
		
		int totalPage = totalCnt % rowRange;
		if(totalPage == 0) {
			totalPage = totalCnt / rowRange;
		} else {
			totalPage = totalCnt / rowRange + 1;
		}
		
		int numPageGroup =  (int) Math.ceil ((double)currPage/pageRange);
		int startPage =  (numPageGroup - 1) * pageRange + 1; 
		int endPage = startPage + pageRange -1;
				
		if(totalPage < endPage) endPage = totalPage;
		
		HashMap<String, Object> pageNaviMap = new HashMap<String, Object>();
		pageNaviMap.put("startPage", startPage);
		pageNaviMap.put("endPage", endPage);
		pageNaviMap.put("totalPage", totalPage);
		pageNaviMap.put("currentPage", currPage);
		
		return pageNaviMap;
	}
	
	public HashMap pageNavi(String cur_page, int totalCnt) {
		int currPage = 1;
		if(cur_page != null && !cur_page.equals("")) {
			currPage = Integer.parseInt(cur_page); // 현재페이지
		} 
		
		int totalPage = totalCnt % rowRange;
		if(totalPage == 0) {
			totalPage = totalCnt / rowRange;
		} else {
			totalPage = totalCnt / rowRange + 1;
		}
		
		int numPageGroup =  (int) Math.ceil ((double)currPage/pageRange);
		int startPage =  (numPageGroup - 1) * pageRange + 1; 
		int endPage = startPage + pageRange -1;
				
		if(totalPage < endPage) endPage = totalPage;
		
		HashMap<String, Object> pageNaviMap = new HashMap<String, Object>();
		pageNaviMap.put("startPage", startPage);
		pageNaviMap.put("endPage", endPage);
		pageNaviMap.put("totalPage", totalPage);
		pageNaviMap.put("currentPage", currPage);
		
		return pageNaviMap;
	}
}