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
				<div class="box_style_2" id="order_process">
					<h2 class="inner">Your order details</h2>
					
					<c:if test="${empty userInfo.email}">
					
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
								<input type="text" class="form-control" id="name" name="name" placeholder="Your Name">
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
								<select class="form-control" name="contryCode" id="contryCode">
									<option value="" selected>Code</option>
									<option value="Korea">+082</option>
									<option value="Korea">+082</option>
								</select>
							</div>
						</div>
						<div class="col-md-4 col-sm-4">
							<div class="form-group">
								<label>Your Telephone</label>
								<input type="text" class="form-control" id="telephone" name="telephone" placeholder="Your Telephone">
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-2 col-sm-2">
							<div class="form-group">
								<label>SNS Name</label>
								<select class="form-control" name="snsName" id="snsName">
									<option value="" selected>SNS</option>
									<option value="Line">Line</option>
									<option value="Facebook">Facebook</option>
								</select>
							</div>
						</div>
						<div class="col-md-4 col-sm-4">
							<div class="form-group">
								<label>Your ID</label>
								<input type="text" class="form-control" id="snsID" name="snsID" placeholder="Your ID">
							
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-sm-6">
							<div class="form-group">
								<div>
									<a href="detail_page.html" class="btn_3">Sign in</a>
								</div>
							</div>
						</div>
					</div>
					
					</c:if>
	                
					<div class="row">
						<div class="col-md-3 col-sm-3">
							<div class="form-group">
								<label>Stay</label>
								<select class="form-control" name="stay" id="stay">
									<option value="" selected>Stay</option>
									<option value="zaza">zaza</option>
									<option value="yaya">yaya</option>
									<option value="direct">Direct Input</option>
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
				
						</div>
					</div>
					
					
					
				</div><!-- End box_style_1 -->
			</div><!-- End col-md-8 -->
            
			<div class="col-md-4">
				<div id="cart_box">
					<h3>Your order <i class="icon_cart_alt pull-right"></i></h3>
					<table class="table table_summary">
					<tbody>
					<tr>
						<td>
							<a href="#0" class="remove_item"><i class="icon_minus_alt"></i></a> <strong>1x</strong> Enchiladas
						</td>
						<td>
							<strong class="pull-right">$11</strong>
						</td>
					</tr>
					<tr>
						<td>
							<a href="#0" class="remove_item"><i class="icon_minus_alt"></i></a> <strong>2x</strong> Burrito
						</td>
						<td>
							<strong class="pull-right">$14</strong>
						</td>
					</tr>
					<tr>
						<td>
							<a href="#0" class="remove_item"><i class="icon_minus_alt"></i></a> <strong>1x</strong> Chicken
						</td>
						<td>
							<strong class="pull-right">$20</strong>
						</td>
					</tr>
					<tr>
						<td>
							<a href="#0" class="remove_item"><i class="icon_minus_alt"></i></a> <strong>2x</strong> Corona Beer
						</td>
						<td>
							<strong class="pull-right">$9</strong>
						</td>
					</tr>
					<tr>
						<td>
							<a href="#0" class="remove_item"><i class="icon_minus_alt"></i></a> <strong>2x</strong> Cheese Cake
						</td>
						<td>
							<strong class="pull-right">$12</strong>
						</td>
					</tr>
					</tbody>
					</table>
					<hr>
					<table class="table table_summary">
					<tbody>
					<tr>
						<td>
							 Subtotal <span class="pull-right">$56</span>
						</td>
					</tr>
					<tr>
						<td>
							 Delivery fee <span class="pull-right">$10</span>
						</td>
					</tr>
					<tr>
						<td class="total">
							 TOTAL <span class="pull-right">$66</span>
						</td>
					</tr>
					</tbody>
					</table>
					<hr>
					<a class="btn_full" href="/jsp/order/cart_2.jsp">Go to checkout</a>
					<a class="btn_full_outline" href="/jsp/restaurant/detail_page.jsp"><i class="icon-right"></i> Add other items</a>
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
<script src="/common/js/jquery.pin.min.js"></script><script>$("#cart_box").pin({padding: {top: 80, bottom: 25},minWidth: 1100, containerSelector: "#container_pin"})</script>

</body>
</html>