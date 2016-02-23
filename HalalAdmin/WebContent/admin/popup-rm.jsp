<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*, my.util.*" %>
    <%@page import="java.io.PrintWriter"%> 
<%@page import="java.util.Enumeration"%> 
<%@page import="com.oreilly.servlet.*"%> 
<%@page import="com.oreilly.servlet.multipart.*"%> 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	adminPOPUPDao dao = new adminPOPUPDao();
	String title=(String)request.getParameter("chk_pop");		//Check된 팝업의 title을 가져옴
	int res=dao.removePopup(title);								//Popup을 삭제함(실제로는 DB으 del_yn 값만 0에서 1로 바꿔줌)
	 if(res>0){													//정상적으로 처리되었는지 확인
	       %>
	       <script type="text/javascript">
	       location.href="admin-popup.jsp";
	       </script>
	       <%}else{ %>
	       <script type="text/javascript">
	       alert("정보 수정에 실패하였습니다.");
	       history.go(-1);
	       </script>
	       <%}

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
</body>
</html>
