<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	adminORDERDao dao = new adminORDERDao();
	String orderFilter = (String)request.getParameter("order_base");		//Check된 항목의 우선순위 가져옴
	session.setAttribute("orderFilter", orderFilter);
	out.println(orderFilter);
%>
	




<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">  
location.href="admin-order.jsp"; 
 </script>
<title>Insert title here</title>
</head>
<body>

</body>
</html>