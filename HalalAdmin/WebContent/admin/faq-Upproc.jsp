<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	adminFAQDao dao = new adminFAQDao();
	String priority = (String)request.getParameter("chk_pop");		//Check된 항목의 우선순위 가져옴
		if(priority.equals("1")){									//1보다 높은 우선순위를 만들지 않음
			%>
		       <script type="text/javascript">
		       alert("더이상 우선순위를 변경할 수 없습니다.");
		       history.go(-1);
		       </script>
		     <%
			
		}else{
			int res= dao.faqUp(priority);	
			int session_priority=Integer.parseInt(priority);
			session_priority-=1;
			session.setAttribute("priority",Integer.toString(session_priority));	//admin-faq.jsp로 돌아갈 때 Radio Box를 Check되어 있게 하기 위해서 session을 설정함 
		}
%>




<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">  
 location.href="admin-faq.jsp"; 
 </script>
<title>Insert title here</title>
</head>
<body>

</body>
</html>