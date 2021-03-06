<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%> 
<%@page import="java.util.Enumeration"%> 
<%@page import="com.oreilly.servlet.*"%> 
<%@page import="com.oreilly.servlet.multipart.*"%> 
<jsp:useBean id="dao" class="my.util.adminMENUDao"/>
<jsp:useBean id="vo" class="my.util.adminVo"/>
 <jsp:setProperty property="*" name="vo"/>

<% 

	
 request.setCharacterEncoding("utf-8");
String Sysdir = request.getRealPath("/"); //실제 시스템 상의 경로를 얻어온다.
String dir = "admin/image/MenuImage";			//저장될 경로 지정

dir = Sysdir+dir;


int max =10*1024*1024; // 업로드 파일의 최대 크기 지정 
String filename=""; 
 
try{ 
    /* 실제 파일 업로드 담당. 
    인수 1) 폼에서 가져온 인자 값을 얻어오기 위해 request객체를 전달 
    인수 2) 업로드될 파일의 위치를 의미 
    인수 3) 최대 크기 
    인수 4) 파일 이름의 한글일 경우 문제가 되므로 처리할수 있도록 인코딩 타입지정. 
    인수 5) 인자는 똑같은 파일을 업로드할 경우 중복되지 않도록 자동으로 파일이름을 변환해주는 기능을 한다.(DefaultFileRenamePolicy)        */ 
   MultipartRequest m = new MultipartRequest(request, dir, max, "utf-8", new DefaultFileRenamePolicy()); 
     
    String title = m.getParameter("title");
    String priority = m.getParameter("priority");
    String price	= m.getParameter("price");
    String summary	= m.getParameter("summary");
    String content	= m.getParameter("content");
    
    
    //업로드한 파일들을 Enumeration타입으로 반환한다. 
    Enumeration files=m.getFileNames();         
    String file1 =(String)files.nextElement(); 
    filename=m.getFilesystemName(file1); //저장될 이름이다.
   
    String storedFile=dir+"\\"+filename;	//저장 경로 + 파일 명(DB에 이대로 저장 됨)
    
        
        int rst;
        String pre_priority=(String)session.getAttribute("pre_priority"); 
        String menuNo=(String)session.getAttribute("menuNo"); 
        String rest_no	= (String)session.getAttribute("restaurantNo");		//Menu 등록시 어느 업체 인지 등록하기 위해서
        String res=(String)session.getAttribute("en_mo");			
    	session.removeAttribute("pre_priority");
    	session.removeAttribute("pre_menuNo");
    	session.removeAttribute("en_mo");
    	
        if(res.equals("en")){			//등록 과정인지 수정 과정인지 구분
        	rst = dao.insertMenu(rest_no, title, priority, price, summary, content, storedFile);
        }else{
        	
	    	rst = dao.updateMenu(rest_no, pre_priority, menuNo, title, priority, price, summary, content, storedFile);
        }
        
       if(rst>0){
       %>
       <script type="text/javascript">
       location.href="admin-specifyMenu.jsp"
       </script>
       <%}else{ %>
       <script type="text/javascript">
       alert("업로드에 실패 하였습니다.");
       history.go(-1);
       </script>
       <%
       }
      
    }catch(Exception e){ 
        e.printStackTrace(new PrintWriter(out)); 
    } 
%> 
