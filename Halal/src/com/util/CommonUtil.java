package com.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


public class CommonUtil {
	
	public static String fileName="D:/devPG/Workspace/SSMF/src/common.properties";
	
	/**
     * Constructor
     */
    public CommonUtil() {
    }
	/**
	 * @name isSession
	 * @param request
	 * @return boolean
	 * @desc 세션 체크
	 * @author SSEM
	 * @since 2012.11.06
	 */
	public boolean isSession(HttpServletRequest request){
		
		boolean flag =  false;
		
		HashMap aib = (HashMap)request.getSession().getAttribute("EMPINFO");
		
		if(aib==null)return flag;
		
		if(!StringUtil.nvl(aib.get("ss_EMP_NO").toString()).equals("")){
			flag = true;
		}
		
		return flag;
	}
	
	/**
	 * @name propertyReader
	 * @return String
	 * @desc 프로퍼티 파일에서 키로 값을 리턴
	 * @author cranky
	 * @since 2013.01.07
	 */
	public static String propertyReader(String keyName){
		Properties pro = null;
	    FileInputStream fis= null;
		
        try{
        	pro = new Properties();
        	fis = new FileInputStream(fileName);
            pro.load(fis);

        }
        catch(IOException ioe){
           ioe.printStackTrace();
            
        }finally{
            if(fis != null){
                try{
                    fis.close();
                }catch (IOException ioe){
                    ioe.printStackTrace();
                }
            }
        }
		return pro.getProperty(keyName);
	}
	
	public static HashMap jasonToMap(String jsonDataStr) {
		
		JSONObject dataObj = JSONObject.fromObject( jsonDataStr );
		HashMap jasonMap = (HashMap)JSONObject.toBean( dataObj, HashMap.class);
		
		return jasonMap;
	}
	
	public static List<HashMap> jasonToList(String jsonDataStr) {
		
		JSONArray dataArrObj = JSONArray.fromObject( jsonDataStr );
		List<HashMap> jasonList = new ArrayList();
		
		for(int i = 0; i < dataArrObj.size(); i++){
			JSONObject dataSet = (JSONObject) dataArrObj.get(i);
			HashMap jasonMap = (HashMap)JSONObject.toBean(dataSet, HashMap.class);		
			jasonList.add(jasonMap);
		}
		
		return jasonList;
	}
}
