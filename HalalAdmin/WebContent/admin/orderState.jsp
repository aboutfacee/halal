<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*, my.util.*" %>
    <%@page import="java.io.PrintWriter"%> 
<%@page import="java.util.Enumeration"%> 
<%@page import="com.oreilly.servlet.*"%> 
<%@page import="com.oreilly.servlet.multipart.*"%> 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	adminORDERDao dao = new adminORDERDao();
	String orderNo=(String)request.getParameter("OderStateNo");
	String orderState=(String)request.getParameter("select_order_state");
	int rst=dao.modifyOrderState(orderNo, orderState);
%>
	       
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
       <script type="text/javascript">
	       location.href="admin-order.jsp";
	     </script>
</head>
<body>
</body>
</html>
