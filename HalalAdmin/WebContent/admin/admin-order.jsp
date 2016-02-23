<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*, my.util.*"%>


<%
	adminORDERDao dao = new adminORDERDao();
	ArrayList<adminVo> list = new ArrayList<adminVo>();

	
	String order=null;
	order=(String)session.getAttribute("orderFilter");				//FAQ 우선순위 변경 후 돌아 왔다면 s값이 null이 아님
	session.removeAttribute("orderFilter");					//session 해제
	
	 if(order==null||order.equals("basic")){
		 	list = dao.BasicOrderInfo();
		}else if(order.equals("rest_name")){
			list = dao.RestNameOrderInfo();
		}else if(order.equals("order_time")){
			list = dao.OrderTimeOrderInfo();
		}else if(order.equals("deli_time")){
			list = dao.DeliOrderInfo();
		}else if(order.equals("order_state")){
		 	list = dao.StateOrderInfo();
		}else if(order.equals("search_order")){
		 	list = dao.SearchOrder("order");
		}else if(order.equals("search_opened")){
		 	list = dao.SearchOrder("opened");
		}else if(order.equals("search_complete")){
		 	list = dao.SearchOrder("complete");
		}else{
			list = dao.SearchByRestaurant(order);
		}
	
	  
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
							주문 관리
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
								<i class="order_manage"></i> 주문 내역 정보
							</h3>
						</div>
						<br> <br>
						<div class="col-lg-4">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										<i class="fa fa-clock-o fa-fw"></i> 정보
									</h3>
								</div>
								
								<div class="panel-body">
								<form action=orderFilter.jsp>
									정렬 기준 <select name="order_base" class="order_base">
										<option value="basic">주문 번호</option>
										<option value="rest_name">업체 명</option>
										<option value="order_time">주문 날짜</option>
										<option value="deli_time">배달 날짜</option>
										<option value="order_state">주문 상태</option>
									</select> <input type="submit" value="정렬"> 
								</form>
								<form action=orderFilter.jsp>
									<select
										name="order_base" >
										<option value="basic">선택하세요</option>
										<option value="search_order">주문</option>
										<option value="search_opened">확인</option>
										<option value="search_complete">완료</option>
									</select> <input type="submit" value="검색">	
								</form>
								
								<form action=orderFilter.jsp>
								업체명 :
								<input type="text" name="order_base">
								<input type="submit" value="검색">	
								</form>
								</div>
							</div>
						</div>

						<!-- Modify for order information with DB -->
						<div class="panel-body">
							<div style="width:100%; overflow:auto">
								<table class="table table-bordered table-hover table-striped">
									<thead>
										<tr>
											<th>주문 번호</th>
											<th>이메일</th>
											<th>성명</th>
											<th>배달 주소</th>
											<th>주문 날짜</th>
											<th>배달 날짜</th>
											<th>업체명</th>
											<th>총 금액</th>
											<th>결제 수단</th>
											<th>주문 상태</th>
										</tr>
									</thead>
									<tbody>
										<%
												for(adminVo vo : list){ 
											%>
											<tr>
												<td width=60 align ="center" name="orderNo">
												<a href='admin-order-specify.jsp?order_no=<%=vo.getOrderNo()%>'><%=vo.getOrderNo()%></a>
												</td>
												<td width=60 align ="center" name="email" ><%=vo.getOrderEmail()%></td>
												<td width=60 align ="center" name="memberName"><%=vo.getMemberName()%></td>
												<td width=60 align ="center" name="deliAddress"><%=vo.getOrderAddress()%></td>
												<td width=60 align ="center" name="orderTime"><%=vo.getOrderTime()%></td>
												<td width=60 align ="center" name="deliTime"><%=vo.getOrderDeliTime()%></td>
												<td width=60 align ="center" name="restaurantName"><%=vo.getRestaurantName()%></td>
												<td width=60 align ="center" name="totalCost"><%=vo.getOrderTotalCost()%></td>
												<td width=60 align ="center" name="payMethod"><%=vo.getOrderPayMethod()%></td>
												<td width=60 align ="center" name="orderState">
												<form action="orderState.jsp">
												<%if(vo.getOrderState().equals("order")){
													%>
													<select name="select_order_state">
													<option value="order" selected>주문</option>
													<option value="opened">확인</option>
													<option value="complete">완료</option>
													</select> 
												<%
												}else if(vo.getOrderState().equals("opened")){
													%>
													<select name="select_order_state">
													<option value="order" >주문</option>
													<option value="opened" selected>확인</option>
													<option value="complete">완료</option>
													</select> 
												<%
												}else if(vo.getOrderState().equals("complete")){
													%>
													<select name="select_order_state">
													<option value="order" >주문</option>
													<option value="opened">확인</option>
													<option value="complete" selected>완료</option>
													</select>
													<%
												}
												
												%>
												<input type="hidden" name="OderStateNo" value=<%=vo.getOrderNo()%>> 
												<input type="submit" value="확인">
												</form>
												</td>
											</tr>
											<% 
												} 
											%>
									</tbody>
								</table>
							</div>
							<div class="text-right">
								<a href="admin-order-specify.jsp">주문 상세 <i
									class="fa fa-arrow-circle-right"></i></a>

							</div>
						</div>
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
