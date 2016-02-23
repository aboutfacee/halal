<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*, my.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	adminRESTAURANTDao dao = new adminRESTAURANTDao();
	String priority = (String)request.getParameter("chk_pop");		//Check된 항목의 우선 순위 파악
	String max = dao.findRestaurantMax();									//우선 순위 가장 낮은 것을 찾아 그 이하로는 더이상 수정되지 않도록 함

	if(max.equals(priority))
	{
		%>
	       <script type="text/javascript">
	       alert("더이상 우선순위를 변경할 수 없습니다.");
	       history.go(-1);
	       </script>
	     <%
	}else{
		int res= dao.RestaurantDown(priority);								//우선순위 변경
		int session_priority=Integer.parseInt(priority);
		session_priority+=1;										//admin-faq.jsp로 돌아갈 때 Radio Box를 Check되어 있게 하기 위해서 session을 설정함 
 
		session.setAttribute("priority",Integer.toString(session_priority));
	}
%>
		   

      

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <script type="text/javascript">  
 location.href="admin-restaurant.jsp"; 
 </script>
<title>Insert title here</title>
</head>
<body>

</body>
</html>