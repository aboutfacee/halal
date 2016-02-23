<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    	String passwd = (String)request.getParameter("passwd");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01
 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">
	var pass = "<%=passwd%>";
	if(pass == "1234"){
		location.href="admin-order.jsp";
	}
	else{
		alert("Wrong Password");
		location.href="admin.jsp";
	}
</script>



<title>loginPro.jsp</title>
</head>
<body>
</body>
</html>

