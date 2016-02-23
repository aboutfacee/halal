<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*, my.util.*" %>
    <%@page import="java.io.PrintWriter"%> 
<%@page import="java.util.Enumeration"%> 
<%@page import="com.oreilly.servlet.*"%> 
<%@page import="com.oreilly.servlet.multipart.*"%> 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%

	session.removeAttribute("restaurant");			//메뉴 등록 페이지 갈 때
	adminRESTAURANTDao dao = new adminRESTAURANTDao();
	String priority=(String)request.getParameter("chk_pop");
	adminVo vo=dao.findRestaurantInfo(priority);				//특정 priority의 해당 정보를 가져옴
	String RestaurantNo = vo.getRestNo();
	session.setAttribute("pre_priority",priority);		//원래의 priority 값을 저장
	session.setAttribute("RestaurantNo",RestaurantNo);		//원래의 질문 값을 저장
	session.setAttribute("en_mo", "mo");				//upload시 등록인지 수정인지 확인하기 위함
	if(RestaurantNo==null){
	       %>
	       <script type="text/javascript">
	       alert("잘못 선택 하셨습니다. 정보 수정에 실패하였습니다.");
	       history.go(-1);
	       </script>
	       <%}
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Halal Admin</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="css/plugins/morris.css" rel="stylesheet">

<link href="css/textarea.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>

<script type="text/javascript">


$(function() {
    $('#str1').keyup(function (e){
        var content = $(this).val();
        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        $('#counter1').html(content.length + '/10');
    });
    $('#str1').keyup();
});


function goToEnrollMenu(){
	location.href='admin-specifyMenu.jsp?rest_name=<%=vo.getRestaurantName()%>';
}
</script>
</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="admin-order.jsp">Halal Admin</a>
			</div>
			<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav side-nav">
				
					<li><a href="admin-order.jsp"><i
							class="admin-order"></i> 주문 관리</a></li>
					<li><a href="admin-popup.jsp"><i
							class="admin-popup"></i> 팝업 관리</a></li>
					<li><a href="admin-restaurant.jsp"><i
							class="admin-restaurant"></i> 업체 관리</a></li>
					<li><a href="admin-menu.jsp"><i 
							class="admin-menu"></i>	업체 별 메뉴 관리</a></li>
					<li><a href="admin-hotel.jsp"><i
							class="admin-hotel"></i> 숙박업소 관리</a></li>
					<li><a href="admin-faq.jsp"><i 
							class="admin-faq"></i>
							FAQ </a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							 업체 관리<small>업체 수정</small>
						</h1>
						
					</div>
				</div>
				<!-- Adien
				bootstrap.min.css col-lg-4
				 -->
					<div class="col-lg-4">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="order_manage"></i> 업체 정보 수정
								</h3>
							</div>
							
							<form action = "restaurant-upload.jsp" method="post" enctype="multipart/form-data">
							<!-- Modify for order information with DB -->
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-bordered table-hover table-striped">
										
										<tbody>
										<tr>
												<td width=5>업체 명</td>
												<td><input type="text" name="title" value=<%=vo.getRestaurantName()%>></td>
											</tr>
											<tr>
												<td width=5>우선 순위</td>
												<td><input type="text" name="priority" value=<%=priority%>></td>
											</tr>
											<tr>
												<td width=100>배달 가능 시간@@@</td>
												<td><input type="text" name="deliStartTime" value=<%=vo.getRestaurantDeliStartTime() %>></td> ~ 
												<td><input type="text" name="deliEndTime" value=<%=vo.getRestaurantDeliEndTime() %>></td>
											</tr>
											<tr>
												<td width=100>주소</td>
												<td width=500 >
												<textarea name="address" maxlength="100"><%=vo.getRestaurantAddress() %></textarea>
												</td>
											</tr>
											<tr>
												<td width=100 >소개 글</td>
												<td width=500>
												<div class="wrap">
												<textarea id="str1" name="content" maxlength="100" ><%=vo.getRestaurantContent()%></textarea>
												<span id="counter1">###</span>
												</div>
												</td>
											<tr>
												<td width=5>업체 Image</td>
												<td><input type="file" name="file1" value=<%=vo.getRestaurantImg() %>></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="text-right">
									<input type="submit" value="저장 "> 								
									<input type="button" value="메뉴 등록" onclick="goToEnrollMenu()">
											
								</div>
							</div>
							</form>
						</div>
					</div>
				</div>
				<!-- /.row -->

			</div>
			<!-- /.container-fluid -->

		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="js/plugins/morris/raphael.min.js"></script>
	<script src="js/plugins/morris/morris.min.js"></script>
	<script src="js/plugins/morris/morris-data.js"></script>

</body>

</html>
