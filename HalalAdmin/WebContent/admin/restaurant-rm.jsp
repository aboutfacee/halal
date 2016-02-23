<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*, my.util.*" %>
    <%@page import="java.io.PrintWriter"%> 
<%@page import="java.util.Enumeration"%> 
<%@page import="com.oreilly.servlet.*"%> 
<%@page import="com.oreilly.servlet.multipart.*"%> 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	adminRESTAURANTDao dao = new adminRESTAURANTDao();
	String priority=(String)request.getParameter("chk_pop");
	int res=dao.removeRestaurant(priority);					//우선 순위 삭제
%>
	       <script type="text/javascript">
	       location.href="admin-restaurant.jsp";
	       </script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
</body>
</html>
