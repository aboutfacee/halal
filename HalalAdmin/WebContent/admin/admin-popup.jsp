<%@page import="my.util.adminFAQDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*, my.util.*"%>


<%
	adminPOPUPDao dao = new adminPOPUPDao();
	ArrayList<adminVo> list = new ArrayList<adminVo>();		
	list = dao.popupInfo();			//�˾� �������� ����� ����Ʈ ���� ��������
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript">

//Radio �ڽ��� üũ�Ǿ� �ִ��� Ȯ���ϴ� �Լ�


//Popup ����
function remove() 
{ 
	
 num_temp = document.all.chk_pop.length; 						//�˾� ���� üũ => null�̸� ���� �׸��� �ϳ��� ����
 if(num_temp==null){
		  alert("���� ��� �ϼ���");

 }else{
	 var num = $('input[name=chk_pop]:checked').val();			// ���� �ڽ� üũ Ȯ��  name���� radio name
	  if(num==null){
	  	alert("���� �� �׸��� �����ϼ���"); 
	 } else{
		 
		 document.form.action="popup-rm.jsp";					
			document.form.submit();
	 }
 }
 
} 

//Popup ���� ���
function enroll(){
	
			 <%
				int res=dao.popupChk();							//�˾� ���� üũ(popupChk() method�� �˾� ���� ����)
				if(res>=2){
				%>
					alert("�˾� ������ 2���� �ʰ��߽��ϴ�. ���� �� �� ������ּ���"); 
				<%
				}else{
					%>
					document.form.action="popup-enroll.jsp"
					document.form.submit();
					<%
					
				}
				%>

}

// �˾� ���� ����
function modify(){
	
	 num_temp = document.all.chk_pop.length; 							//�˾� ���� üũ => null�̸� ���� �׸��� �ϳ��� ����
	 if(num_temp==null){
			  alert("���� ��� �ϼ���");

	 }else{
		 var num = $('input[name=chk_pop]:checked').val();				// ���� �ڽ� üũ Ȯ��  name���� radio name
		  if(num==null){
		  alert("���� �� �׸��� �����ϼ���"); 
		 } else{
			
					document.form.action="popup-modify.jsp"
					document.form.submit();
			}
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
							�˾� ���� 
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
								<i class="order_manage"></i> �˾� ����
							</h3>
						</div>

						<form name="form">
							<!-- Modify for order information with DB -->
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-bordered table-hover table-striped">
										<thead>
											<tr>
												<th align ="center">����</th>
												<th >Popup Title</th>
											</tr>
										</thead>
										<tbody>
											<%	
											int i=0;						//Popup List�� �ΰ������� ���� ����
											for(adminVo vo : list){ 
											if(i>1)
												break;
											%>
											<tr>
												<td width=50 align ="center"><input type="radio" name="chk_pop"
													value="<%=vo.getPopupTitle()%>" /></td>
												<td align ="center"><%=vo.getPopupTitle()%></td>
											</tr>
											<%
											i++;
											} %>
											<tr>
												<td width=50 align ="center"><input type="radio" name="chk_pop"
													value="" /></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
								<h4>2�� ���� ��� �����մϴ�.</h4>
								<div class="text-right">
									<input type="button" value="���� ���" onclick="enroll();">
									<input type="button" value="����" onclick="modify();">
									<input type="button" value="���� " onclick="remove()">

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
