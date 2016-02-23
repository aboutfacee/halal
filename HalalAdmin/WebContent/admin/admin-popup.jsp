<%@page import="my.util.adminFAQDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*, my.util.*"%>


<%
	adminPOPUPDao dao = new adminPOPUPDao();
	ArrayList<adminVo> list = new ArrayList<adminVo>();		
	list = dao.popupInfo();			//팝업 페이지에 띄워줄 리스트 정보 가져오기
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript">

//Radio 박스가 체크되어 있는지 확인하는 함수


//Popup 삭제
function remove() 
{ 
	
 num_temp = document.all.chk_pop.length; 						//팝업 개수 체크 => null이면 현재 항목이 하나도 없음
 if(num_temp==null){
		  alert("새로 등록 하세요");

 }else{
	 var num = $('input[name=chk_pop]:checked').val();			// 라디오 박스 체크 확인  name값이 radio name
	  if(num==null){
	  	alert("삭제 할 항목을 선택하세요"); 
	 } else{
		 
		 document.form.action="popup-rm.jsp";					
			document.form.submit();
	 }
 }
 
} 

//Popup 새로 등록
function enroll(){
	
			 <%
				int res=dao.popupChk();							//팝업 개수 체크(popupChk() method는 팝업 개수 리턴)
				if(res>=2){
				%>
					alert("팝업 개수가 2개를 초과했습니다. 삭제 후 재 등록해주세요"); 
				<%
				}else{
					%>
					document.form.action="popup-enroll.jsp"
					document.form.submit();
					<%
					
				}
				%>

}

// 팝업 내용 수정
function modify(){
	
	 num_temp = document.all.chk_pop.length; 							//팝업 개수 체크 => null이면 현재 항목이 하나도 없음
	 if(num_temp==null){
			  alert("새로 등록 하세요");

	 }else{
		 var num = $('input[name=chk_pop]:checked').val();				// 라디오 박스 체크 확인  name값이 radio name
		  if(num==null){
		  alert("수정 할 항목을 선택하세요"); 
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
							팝업 관리 
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
								<i class="order_manage"></i> 팝업 정보
							</h3>
						</div>

						<form name="form">
							<!-- Modify for order information with DB -->
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-bordered table-hover table-striped">
										<thead>
											<tr>
												<th align ="center">선택</th>
												<th >Popup Title</th>
											</tr>
										</thead>
										<tbody>
											<%	
											int i=0;						//Popup List를 두개까지만 띄우기 위함
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
								<h4>2개 까지 등록 가능합니다.</h4>
								<div class="text-right">
									<input type="button" value="새로 등록" onclick="enroll();">
									<input type="button" value="수정" onclick="modify();">
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
