<%@page import="my.util.adminMENUDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*, my.util.*"%>


<%
	adminMENUDao dao = new adminMENUDao();
	String restaurant=null;
	String rest_name=null;	
	restaurant=(String)session.getAttribute("restaurant");		//특정 업체 정보 유지
	
	if(restaurant==null){				//처음 메뉴 화면으로 접속 했을 때
		rest_name=request.getParameter("rest_name");				//업체 명
		session.setAttribute("restaurant", rest_name);				//메뉴 가져올 때 특정 업체 정보 유지
		String rest_no=dao.findRestNo(rest_name);
		session.setAttribute("restaurantNo", rest_no);				//메뉴 등록시 특정 업체 정보 등록 윟새ㅓ
	 	
	}else{								//우선 순위 변경을 한 후 메뉴 화면으로 접속 했을 때
		rest_name=restaurant;
	} 
	
	ArrayList<adminVo> list = new ArrayList<adminVo>();
	list = dao.MenuInfo(rest_name);									//FAQ정보 가져옴
	
	String s=null;
	s=(String)session.getAttribute("priority");				//Menu 우선순위 변경 후 돌아 왔다면 s값이 null이 아님
	session.removeAttribute("priority");					//session 해제
%>



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript">


//특정 페이지에서 뒤로가기 눌렀을 때도 restaurant session값 해제
$(window).bind("pageshow", function(event) {  
    //back 이벤트 일 경우
    if ( event.originalEvent && event.originalEvent.persisted) {
    	<%session.removeAttribute("restaurant");%>
    }    
});

//Menu 삭제
function remove() 
{ 
	
 num_temp = document.all.chk_pop.length; 
 if(num_temp==null){
		  alert("새로 등록 하세요");

 }else{
	 var num = $('input[name=chk_pop]:checked').val();			// 라디오 박스 체크 확인  name값이 radio name
	  if(num==null){
	  	alert("삭제 할 항목을 선택하세요"); 
	 } else{
		 
		 document.form.action="menu-rm.jsp";
			document.form.submit();
	 }
 }
 
} 

//Menu 새로 등록
function enroll(){
		document.form.action="menu-enroll.jsp"
		document.form.submit();

}

	

// Menu 내용 수정

function modify(){
	
	 num_temp = document.all.chk_pop.length; 
	 if(num_temp==null){
			  alert("새로 등록 하세요");

	 }else{
		 var num = $('input[name=chk_pop]:checked').val();				// 라디오 박스 체크 확인  name값이 radio name
		  if(num==null){
		  alert("수정 할 항목을 선택하세요"); 
		 } else{
			
					document.form.action="menu-modify.jsp"
					document.form.submit();
			}
	 }
	 
	 

}
//Menu 우선순위 상향 조정
function up(){
	var num = $('input[name=chk_pop]:checked').val();			// 라디오 박스 체크 확인  name값이 radio name
	  if(num==null){
	  	alert("항목을 선택하세요"); 
	 } else{
		 
		 document.form.action="menu-Upproc.jsp";
		 document.form.submit();
	 }
	
	
}
//Menu 우선순위 하향 조정
function down(){
	var num = $('input[name=chk_pop]:checked').val();			// 라디오 박스 체크 확인  name값이 radio name
	  if(num==null){
	  	alert("항목을 선택하세요"); 
	 } else{
		 
		 document.form.action="menu-Downproc.jsp";
			document.form.submit();
	 }
	
}




</script>


<title>Halal Admin</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="css/plugins/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">


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

				<li><a href="admin-order.jsp"><i class="admin-order"></i>
						주문 관리</a></li>
				<li><a href="admin-popup.jsp"><i class="admin-popup"></i>
						팝업 관리</a></li>
				<li><a href="admin-restaurant.jsp"><i class="admin-restaurant"></i>
						업체 관리</a></li>
				<li><a href="admin-menu.jsp"><i class="admin-menu"></i> 업체
						별 메뉴 관리</a></li>
				<li><a href="admin-hotel.jsp"><i class="admin-hotel"></i> 숙박업소
						관리</a></li>
				<li><a href="admin-faq.jsp"><i class="admin-faq"></i> FAQ </a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse --> </nav>

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							 업체 별 메뉴 관리
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
								<i class="order_manage"></i> 메뉴 관리
							</h3>
						</div>

						<form name="form">
							<!-- Modify for order information with DB -->
							<div class="panel-body">
							<h3><%=rest_name%></h3>
								<div style="width:100%; overflow:auto">
									<table class="table table-bordered table-hover table-striped">
										<thead>
											<tr>
												<th align ="center">선택</th>
												<th align ="center">순서</th>
												<th>메뉴 명</th>
												<th>메뉴 소개</th>
												<th>메뉴 가격</th>
											</tr>
										</thead>
										<tbody>
											<%
												if(restaurant==null){
												for(adminVo vo : list){ 
													
											%>
											<tr>
												<td width=50 align ="center"><input type="radio" name="chk_pop"
													value="<%=vo.getMenuPriority()%>" /></td>
												<td width=60 align ="center"><%=vo.getMenuPriority()%></td>
												<td><%=vo.getMenuName()%></td>
												<td><%=vo.getMenuSumm()%></td>
												<td><%=vo.getMenuPrice()%></td>
											</tr>
											<% 
												} 
											}else{
												for(adminVo vo : list){ 
													if(vo.getMenuPriority().equals(s))	//우선 순위 변경 후 Radio Box 계속 체크 되어 있게 하기 위함
													{
														
													%>
													<tr>
												<td width=50 align ="center"><input type="radio" name="chk_pop"
													value="<%=vo.getMenuPriority()%>" checked /></td>
												<td width=60 align ="center"><%=vo.getMenuPriority()%></td>
												<td><%=vo.getMenuName()%></td>
												<td><%=vo.getMenuSumm()%></td>
												<td><%=vo.getMenuPrice()%></td>
											</tr>
													<%
													}else{
													%>
												<tr>
												<td width=50 align ="center"><input type="radio" name="chk_pop"
													value="<%=vo.getMenuPriority()%>" /></td>
												<td width=60 align ="center"><%=vo.getMenuPriority()%></td>
												<td><%=vo.getMenuName()%></td>
												<td><%=vo.getMenuSumm()%></td>
												<td><%=vo.getMenuPrice()%></td>
											</tr>
											<%
													}
											}
											}%>
											<tr>
												<td width=50 align ="center"><input type="radio" name="chk_pop"
													value="" /></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
								<img src="image/upButton.png" width="30" height="30" align="middle" onclick="up()" style="cursor:pointer"/>
								<img src="image/downButton.png" width="30" height="30" align="middle" onclick="down()" style="cursor:pointer"/>
								<div class="text-right">
									<input type="button" value="새로 등록" onclick="enroll()">
									<input type="button" value="수정" onclick="modify()">
									<input type="button" value="삭제 " onclick="remove()">

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
