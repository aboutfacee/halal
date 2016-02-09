package com.util;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

public class PageNavi {

static Logger logger = Logger.getLogger(StringUtil.class);
	private int ROW_RANGE  = 10; // 결과목록에 보여지는 레코드수
	static final public int PAGE_RANGE = 10; // 페이지출력 범위
	private int totalCnt = 0;					 // 전체 레코드 
	
	public PageNavi(){
	}
	
	public PageNavi(int row_range){
		ROW_RANGE = row_range;
	}
	
	public int pageNum(String cur_page, HashMap<String, Object> paramMap) {
		int currPage = 1; 
		String isMobile = StringUtil.trim((String)paramMap.get("isMobile"),"");
		
		if(cur_page == null || cur_page.equals("")) {
			currPage = 1;
		} else { 
			currPage = Integer.parseInt(cur_page); // 현재페이지
		} 
		int startNum = (currPage - 1 ) * ROW_RANGE;
		int endNum = (currPage - 1) * ROW_RANGE + ROW_RANGE;
		
		if(startNum > 0){
			startNum = startNum + 1;
		}
		if(isMobile.equals("Y")) startNum= 0;
		
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		paramMap.put("startNum", startNum);
		paramMap.put("endNum", endNum);
		
		return currPage;
	}
	
	public HashMap<String, Object> pageNavi(int currPage, int rowRange, int pageRange, int totalCnt) {
		
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
	
	public HashMap<String, Object> pageNavi(int currPage, List<HashMap<String,Object>> resultList) {
		if(resultList != null && resultList.size() > 0) {
			totalCnt = Integer.parseInt(resultList.get(0).get("TOTAL_CNT").toString());
		}
		
		int totalPage = totalCnt % ROW_RANGE;
		if(totalPage == 0) {
			totalPage = totalCnt / ROW_RANGE;
		} else {
			totalPage = totalCnt / ROW_RANGE + 1;
		}
		
		int numPageGroup =  (int) Math.ceil ((double)currPage/PAGE_RANGE);
		int startPage =  (numPageGroup - 1) * PAGE_RANGE + 1; 
		int endPage = startPage + PAGE_RANGE -1;
				
		if(totalPage < endPage) endPage = totalPage;
		
		HashMap<String, Object> pageNaviMap = new HashMap<String, Object>();
		pageNaviMap.put("startPage", startPage);
		pageNaviMap.put("endPage", endPage);
		pageNaviMap.put("totalPage", totalPage);
		pageNaviMap.put("currentPage", currPage);
		
		return pageNaviMap;
	}
	
	public HashMap<String, Object> pageNavi(String cur_page) {
		int currPage = this.getCurrPage(cur_page);
		int totalPage = totalCnt % ROW_RANGE;
		if(totalPage == 0) {
			totalPage = totalCnt / ROW_RANGE;
		} else {
			totalPage = totalCnt / ROW_RANGE + 1;
		}
		
		int numPageGroup =  (int) Math.ceil ((double)currPage/PAGE_RANGE);
		int startPage =  (numPageGroup - 1) * PAGE_RANGE + 1; 
		int endPage = startPage + PAGE_RANGE -1;
		
		if(totalPage < endPage) endPage = totalPage;
		
		HashMap<String, Object> pageNaviMap = new HashMap<String, Object>();
		pageNaviMap.put("startPage", startPage);
		pageNaviMap.put("endPage", endPage);
		pageNaviMap.put("totalPage", totalPage);
		pageNaviMap.put("currentPage", currPage);
		
		return pageNaviMap;
	}
	
	public int getStartNum(String cur_page){
		int startNum = 0;
		int currPage = this.getCurrPage(cur_page);
		
		startNum = (currPage - 1 ) * ROW_RANGE;
		
		if(startNum > 0){
			startNum = startNum + 1;
		}
		return startNum;
	}
	
	public int getEndNum(String cur_page){
		int endNum = 0;
		int currPage = this.getCurrPage(cur_page);
	
		endNum = (currPage - 1) * ROW_RANGE + ROW_RANGE;
		
		return endNum;
	}
	
	//현재 페이지 가져오기
	public int getCurrPage(String cur_page){
		int currPage = 1;
		if(cur_page == null || cur_page.equals("")) {
			currPage = 1;
		} else {
			currPage = Integer.parseInt(cur_page); // 현재페이지
		}
		
		return currPage;
	}
	
	//전체 레코드수 세팅.
	public void setTotalCnt(List<HashMap<String,Object>> resultList){
		if(resultList != null && resultList.size() > 0) {
			this.totalCnt = Integer.parseInt(resultList.get(0).get("TOTAL_CNT").toString());
		}
	}
}
