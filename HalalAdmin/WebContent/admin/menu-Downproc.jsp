<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*, my.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	adminMENUDao dao = new adminMENUDao();
	String priority = (String)request.getParameter("chk_pop");		//Check�� �׸��� �켱 ���� �ľ�
	String max = dao.findMenuMax();									//�켱 ���� ���� ���� ���� ã�� �� ���Ϸδ� ���̻� �������� �ʵ��� ��

	if(max.equals(priority))
	{
		%>
	       <script type="text/javascript">
	       alert("���̻� �켱������ ������ �� �����ϴ�.");
	       history.go(-1);
	       </script>
	     <%
	}else{
		int res= dao.MenuDown(priority);								//�켱���� ����
		int session_priority=Integer.parseInt(priority);
		session_priority+=1;										//admin-faq.jsp�� ���ư� �� Radio Box�� Check�Ǿ� �ְ� �ϱ� ���ؼ� session�� ������ 
 
		session.setAttribute("priority",Integer.toString(session_priority));
	}
%>
		   

      

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <script type="text/javascript">  
 location.href="admin-specifyMenu.jsp"; 
 </script>
<title>Insert title here</title>
</head>
<body>

</body>
</html>