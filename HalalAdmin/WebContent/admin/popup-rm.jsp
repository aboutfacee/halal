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
	String title=(String)request.getParameter("chk_pop");		//Check�� �˾��� title�� ������
	int res=dao.removePopup(title);								//Popup�� ������(�����δ� DB�� del_yn ���� 0���� 1�� �ٲ���)
	 if(res>0){													//���������� ó���Ǿ����� Ȯ��
	       %>
	       <script type="text/javascript">
	       location.href="admin-popup.jsp";
	       </script>
	       <%}else{ %>
	       <script type="text/javascript">
	       alert("���� ������ �����Ͽ����ϴ�.");
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
