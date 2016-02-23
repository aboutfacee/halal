<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/jsp/com/headerF.jsp" %>

<c:set var="userInfo" value="${sessionScope.USERINFO}" />


<!DOCTYPE html>
<!--[if IE 9]><html class="ie ie9"> <![endif]-->
<html>
<head>
    <meta charset="utf-8">
    <title>Halal Oppa</title>
	<jsp:include page="/jsp/com/topDeclare.jsp" />
	<script src="/common/assets/js/jquery-ajaxHelper.js"></script> <!-- ajax 선언 -->
	
	<c:set var="cart" value="${resultMap.cartVO}" />
</head>

<body>

<!--[if lte IE 8]>
    <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a>.</p>
<![endif]-->

	<div id="preloader">
        <div class="sk-spinner sk-spinner-wave" id="status">
            <div class="sk-rect1"></div>
            <div class="sk-rect2"></div>
            <div class="sk-rect3"></div>
            <div class="sk-rect4"></div>
            <div class="sk-rect5"></div>
        </div>
    </div><!-- End Preload -->

    <!-- Header ================================================== -->
    <jsp:include page="/jsp/com/topMenu.jsp" />
    <!-- End Header =============================================== -->
    
<!-- SubHeader =============================================== -->
<section class="parallax-window" id="short" data-parallax="scroll" data-image-src="img/sub_header_cart.jpg" data-natural-width="1400" data-natural-height="350">
    <div id="subheader">
    	<div id="sub_content">
    	 <h1>Place your order</h1>
            <div class="bs-wizard">
                <div class="col-xs-4 bs-wizard-step active">
                  <div class="text-center bs-wizard-stepnum"><strong>1.</strong> Your details</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#0" class="bs-wizard-dot"></a>
                </div>
                               
                <div class="col-xs-4 bs-wizard-step disabled">
                  <div class="text-center bs-wizard-stepnum"><strong>2.</strong> Payment</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="/jsp/order/cart_2.jsp" class="bs-wizard-dot"></a>
                </div>
            
              <div class="col-xs-4 bs-wizard-step disabled">
                  <div class="text-center bs-wizard-stepnum"><strong>3.</strong> Finish!</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="/jsp/order/cart_3.jsp" class="bs-wizard-dot"></a>
                </div>  
		</div><!-- End bs-wizard --> 
        </div><!-- End sub_content -->
	</div><!-- End subheader -->
</section><!-- End section -->
<!-- End SubHeader ============================================ -->

    <div id="position">
        <div class="container">
            <ul>
                <li><a href="#0">Home</a></li>
                <li><a href="#0">Category</a></li>
                <li>Page active</li>
            </ul>
        </div>
    </div><!-- Position -->

<!-- Content ================================================== -->
<div class="container margin_60_35">
	<div id="container_pin">
		<div class="row">
			<div class="col-md-8">
				<c:if test="${empty userInfo.email}">
				<div class="box_style_2" id="order_process">
					<h2 class="inner">Sign in</h2>
						<form id="myRegister" method="post">
							<div class="row">
								<div class="col-md-6 col-sm-6">
									<div class="form-group">
										<label>Email</label>
										<input type="text" class="form-control" id="email" name="email" placeholder="Your Email">
									</div>
								</div>
							</div>
		
							<div class="row">
								<div class="col-md-6 col-sm-6">
									<div class="form-group">
										<label>Name</label>
										<input type="text" class="form-control" id="mem_name" name="mem_name" placeholder="Your Name">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-6 col-sm-6">
									<div class="form-group">
										<label>Password</label>
										<input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-2 col-sm-2">
									<div class="form-group">
										<label>Country Code</label>
										<select class="form-control" name="country_code" id="country_code">
											<option value="" selected>Code</option>
											<option value="Korea">+082</option>
											<option value="Korea">+082</option>
										</select>
									</div>
								</div>
								<div class="col-md-4 col-sm-4">
									<div class="form-group">
										<label>Your Telephone</label>
										<input type="text" class="form-control" id="phone" name="phone" placeholder="Your Telephone">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-2 col-sm-2">
									<div class="form-group">
										<label>SNS Name</label>
										<select class="form-control" name="social_name" id="social_name">
											<option value="" selected>SNS</option>
											<option value="Line">Line</option>
											<option value="Facebook">Facebook</option>
										</select>
									</div>
								</div>
								<div class="col-md-4 col-sm-4">
									<div class="form-group">
										<label>Your ID</label>
										<input type="text" class="form-control" id="social_id" name="social_id" placeholder="Your ID">
									
									</div>
								</div>
							</div>
							</form>
							<div class="row">
								<div class="col-md-6 col-sm-6">
									<div class="form-group">
										<div>
											<button type="button" class="btn_3" onclick="SignInBtn()">Sign in</button>
										</div>
									</div>
								</div>
							</div>
	                </div><!-- End box_style_1 -->
	                </c:if>
	                
      				<div class="box_style_2" >
                        <h2 class="inner">Your stay</h2>
      	                <form id="setCart" method="post">
						<div class="row">
							<div class="col-md-3 col-sm-3">
								<div class="form-group">
									<label>Stay</label>
									<select class="form-control" name="stay" id="stay">
										<option value="" selected>Stay</option>
										<c:forEach var="hotelVO" items="${resultMap.hotelVO}" varStatus="status">
										<option value="${hotelVO.hotel_address }">${hotelVO.hotel_name }</option>
										</c:forEach>
										<option value="manual">Direct input</option>
									</select>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-8 col-sm-8">
								<div class="form-group">
									<label>Address</label>
									<input type="text" class="form-control" id="address" name="address" disabled>
								</div>
							</div>
							<div class="col-md-2 col-sm-2">
								<div class="form-group">
									<label>Room Number</label>
									<input type="text" class="form-control" id="roomNum" name="roomNum" placeholder="Room">							
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-3 col-sm-3">
								<div class="form-group">
									<label>Delivery Day</label>
									<input type="text" class="form-control" id="deliveryDay" name="deliveryDay" disabled>							
								</div>
							</div>
							<div class="col-md-3 col-sm-3">
								<div class="form-group">
									<label>Delivery time</label>
									<input type="text" class="form-control" id="deliveryTime" name="deliveryTime" disabled>		
								</div>
							</div>
						</div>
						
						<hr>
						<div class="row">
							<div class="col-md-12">
									<label>Notes</label>
									<textarea class="form-control" style="height:150px" placeholder="Ex. Allergies, cash change..." name="notes" id="notes"></textarea>
									<br>
							</div>
						</div>
						</form>
					</div><!-- End box_style_1 -->
					
				<div class="box_style_2" >
					<h2 class="inner">Payment methods</h2>
					<div class="payment_select">
						<label><input type="radio" value="" checked name="payment_method" class="icheck">Credit card</label>
						<i class="icon_creditcard"></i>
					</div>
					<div class="payment_select nomargin">
						<label><input type="radio" value="" name="payment_method" class="icheck">Pay with cash</label>
						<i class="icon_wallet"></i>
					</div>
				</div><!-- End box_style_1 -->
			</div><!-- End col-md-8 -->
			
            
			<div class="col-md-4">
				<div id="cart_box">
					<h3>Your order <i class="icon_cart_alt pull-right"></i></h3>
					<table class="table table_summary">
					<tbody>
					<tr>
						<td id="addCart">
						</td>
					</tr>
					</tbody>
					</table>
					<hr>
					<table class="table table_summary">
					<tbody>
					<tr>
						<td id="subTotal">
						</td>
					</tr>
					<tr>
						<td>
							 Delivery fee <span class="pull-right">20000 KRW</span>
						</td>
					</tr>
					<tr>
						<td class="total">
							 TOTAL <span class="pull-right" id="total"> 20000 KRW</span>
						</td>
					</tr>
					</tbody>
					</table>
					<hr>
					<button type="button" id="goToCheckOut" class="btn_full" onclick="CheckOutBtn()">Go to checkout</button>
					<a class="btn_full_outline" href="/jsp/restaurant/detail_page.jsp"><i class="icon-right"></i> Add other items</a>
					
					<!-- 장소 날짜 시간 -->
					
				</div><!-- End cart_box -->
			</div><!-- End col-md-4 -->
            
		</div><!-- End row -->
	</div><!-- End container pin -->
</div><!-- End container -->
<!-- End Content =============================================== -->

<!-- Footer ================================================== -->
<jsp:include page="/jsp/com/footer.jsp" />
<!-- End Footer =============================================== -->

<!-- SPECIFIC SCRIPTS -->
<script src="/common/assets/js/jquery.pin.min.js"></script><script>$("#cart_box").pin({padding: {top: 80, bottom: 25},minWidth: 1100, containerSelector: "#container_pin"})</script>
</body>
<script>


(function()
{
	var dataPack = new Object();
	dataPack.cart_no = getCookie('cart');
	var ajaxResult = ajaxHelper("/halal/CheckOutTotal", {"paramPack" : JSON.stringify(dataPack)});

	ajaxResult.success(function(data){
	var resultVO = data.resultVO;
	
	$("#addCart").empty();
	
	var cart = "";
	var sum = 0;

	for (var i in resultVO){
		if(resultVO[i].count == 0) 
			continue;
		cart += "<strong>"+ resultVO[i].count+"x &nbsp</strong>";
		cart += "<span>" + resultVO[i].menu_name + "</span>"
		cart += "<strong class='pull-right'>" + resultVO[i].count*resultVO[i].menu_price + " KRW</strong><br>";
		sum += resultVO[i].count*resultVO[i].menu_price;
	}
	$("#addCart").append(cart);
		
	$("#subTotal").empty();
	var subTotal = "";
	subTotal += "Subtotal <span class='pull-right'>" + sum + " KRW</span>"
	$("#subTotal").append(subTotal);
	
	$("#total").empty();
	$("#total").append(sum + 20000 + " KRW");
		
	})
})();

function getCookie(cName) {
    cName = cName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cName);
    var cValue = '';
    if(start != -1){
        start += cName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cValue = cookieData.substring(start, end);
    }
    return unescape(cValue);
} 

function CheckOutBtn(){
	var varForm = document.getElementById("setCart");
	varForm.hotel_address = document.getElementById("address").value;
	varForm.action = "<c:url value='/halal/SelPayment'/>";
	varForm.submit();

}

function SignInBtn(){
	
	var varForm = document.getElementById("myRegister");
	varForm.action = "<c:url value='/halal/OrderMemberJoin'/>";
	varForm.submit();
}



$(function(){
	/* 검색 구분항목에 따른 정보노출 */
	$("#stay").change(function(){
		var selVal = $("#stay").val();
		if(selVal == "manual"){
			$("#address").removeAttr('disabled');
			$("#address").val("");
		}
		else{
			$("#address").attr({
                'disabled': 'disabled'
            });
			$("#address").empty();
			$("#address").val(selVal);
		}
		
		$("#deliveryDay").val("2016/11/11");
		$("#deliveryTime").val("11:11:11");
	});
	
	
});
</script>
</html>