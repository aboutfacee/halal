<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*, my.util.*" %>
    <%@page import="java.io.PrintWriter"%> 
<%@page import="java.util.Enumeration"%> 
<%@page import="com.oreilly.servlet.*"%> 
<%@page import="com.oreilly.servlet.multipart.*"%> 

<%
	session.setAttribute("en_mo", "en");			//upload�� ������� �������� Ȯ���ϱ� ����
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script type="text/javascript">

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
				
					<li><a href="admin-order.jsp"><i
							class="admin-order"></i> �ֹ� ����</a></li>
					<li><a href="admin-popup.jsp"><i
							class="admin-popup"></i> �˾� ����</a></li>
					<li><a href="admin-restaurant.jsp"><i
							class="admin-restaurant"></i> ��ü ����</a></li>
					<li><a href="admin-menu.jsp"><i 
							class="admin-menu"></i>	��ü �� �޴� ����</a></li>
					<li><a href="admin-hotel.jsp"><i
							class="admin-hotel"></i> ���ھ��� ����</a></li>
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
							FAQ ����<small>���� ���</small>
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
									<i class="order_manage"></i> FAQ ���� ���
								</h3>
							</div>
							
							<form action = "faq-upload.jsp" method="post">
							<!-- Modify for order information with DB -->
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-bordered table-hover table-striped">
										
										<tbody>
											<tr>
												<td width=5>FAQ Question</td>
												<td><input type="text" name="question" ></td>
											</tr>
											<tr>
												<td width=5>�켱 ����</td>
												<td><input type="text" name="priority" ></td>
											</tr>
											<tr>
												<td width=5>FAQ Answer</td>
												<td><input type="text" name="answer" ></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="text-right">
									<input type="submit" value="���� "> 
											
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
