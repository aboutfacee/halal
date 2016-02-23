<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*, my.util.*"%>

<%
	adminORDERDao dao = new adminORDERDao();
	String orderNo = (String)request.getParameter("order_no");
	ArrayList<adminVo> list = new ArrayList<adminVo>();
	list = dao.SpecifyOrderInfo(orderNo);
	ArrayList<adminVo> list2 = new ArrayList<adminVo>();
	list2 = dao.OrderedMenu(orderNo);
	int total = dao.OrderTotalCost(orderNo);
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
						�ֹ� ����</a></li>
				<li><a href="admin-popup.jsp"><i class="admin-popup"></i>
						�˾� ����</a></li>
				<li><a href="admin-restaurant.jsp"><i class="admin-restaurant"></i>
						��ü ����</a></li>
				<li><a href="admin-menu.jsp"><i class="admin-menu"></i> ��ü
						�� �޴� ����</a></li>
				<li><a href="admin-hotel.jsp"><i class="admin-hotel"></i> ���ھ���
						����</a></li>
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
							�ֹ� ���� <small>�ֹ� �� ����</small>
						</h1>

					</div>
				</div>
				<!-- Adien
				bootstrap.min.css col-lg-4
				 -->
				<div class="row">
                    <div class="col-lg-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-long-arrow-right"></i> �ֹ� �� ����</h3>
                            </div>
                          <div style="width:100%; overflow:auto">
								<table class="table table-bordered table-hover table-striped">
									<tbody>
									<%
                                	for(adminVo vo : list){ 
									%>
											<tr>
												<td width=60 align ="center" >�ֹ� ��ȣ</td>
												<td width=60 align ="center" name="order_no" ><%=vo.getOrderNo()%></td>
											</tr>
											<tr>
												<td width=60 align ="center" >�̸���</td>
												<td width=60 align ="center" name="email"><%=vo.getOrderEmail()%></td>
											</tr>
											<tr>
												<td width=60 align ="center"  >����</td>
												<td width=60 align ="center" name="mem_name"><%=vo.getMemberName()%></td>
											</tr>
											<tr>
												<td width=60 align ="center" name="phone" >��ȭ��ȣ</td>
												<td width=60 align ="center" name="memberName"><%=vo.getMemberPhone()%></td>
											</tr>
											<tr>
												<td width=60 align ="center" name="deli_address" >��� ���</td>
												<td width=60 align ="center" name="memberName"><%=vo.getOrderAddress()%></td>
											</tr>
											<tr>
												<td width=60 align ="center" name="room" >�� ��ȣ</td>
												<td width=60 align ="center" name="memberName"><%=vo.getOrderRoom()%></td>
											</tr>
											<tr>
												<td width=60 align ="center" name="deli_time" >��� �ð�</td>
												<td width=60 align ="center" name="memberName"><%=vo.getOrderDeliTime()%></td>
											</tr>
											<tr>
												<td width=60 align ="center" name="pay_method" >���� ����</td>
												<td width=60 align ="center" name="memberName"><%=vo.getOrderPayMethod()%></td>
											</tr>
											<tr>
												<td width=60 align ="center" name="SNS" >SNS</td>
													<td width=60 align ="center" name="memberName"><%=vo.getMemberSNS()%></td>
											</tr>
											<tr>
												<td width=60 align ="center" name="SNS_id" >SNS ID</td>
												<td width=60 align ="center" name="memberName"><%=vo.getMemberSNSID()%></td>
											</tr>
											
										<% 
										} 
									    %>
									</tbody>
								</table>
							</div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-long-arrow-right"></i> �޴� ����</h3>
                            </div>
                            <div class="panel-body">
                            	<label name="rest_name"></label>
                                
                                <%
                                	for(adminVo vo : list2){ 
									%>
									<br>
									<label><%=vo.getMenuName() %></label>
									x
									<label><%=vo.getOrderCount() %></label>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
									<label><%=Integer.parseInt(vo.getOrderCount())*Integer.parseInt(vo.getOrderPrice())%></label>
									<% 
										} 
									
                                
                                %>
									<br>
									<label>Delivery Fee            2000</label>
									<br>
									<label><%=total+2000 %></label>
									
                                <label name="rest_name"></label>
                                <br>
                                <label name="rest_name"></label>
                                <br>
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
