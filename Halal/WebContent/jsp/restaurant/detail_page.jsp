<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/jsp/com/headerF.jsp" %>

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
<section class="parallax-window" data-parallax="scroll" data-image-src="/common/img/sub_header_2.jpg" data-natural-width="1400" data-natural-height="470">
    <div id="subheader">
	<div id="sub_content">
    	<div id="thumb"><img src="/common/img/thumb_restaurant.jpg" alt=""></div>
                    <h1>Mexican TacoMex</h1>
                    <div><em>Mexican / American</em></div>
                    <div><i class="icon_pin"></i> 135 Newtownards Road, Belfast, BT4 1AB - <strong>Delivery charge:</strong> $10, free over $15.</div>
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
				<div class="box_style_2" id="main_menu">
					<h2 class="inner">Menu</h2>
					<table class="table table-striped cart-list">
					<thead>
					<tr>
						<th>
							 Item
						</th>
						<th>
							 Price
						</th>
						<th>
							 Order
						</th>
					</tr>
					</thead>
					<tbody>
						<c:forEach var="menuList" items="${resultMap.menuList}" varStatus="status">
						<tr>
							<td data-toggle="modal" data-target="#menuDetail">
								<div id="menuThumb">
									<h4>${menuList.menu_nm }</h4>
									<img src="/common/img/thumb_restaurant.jpg" alt="">
									${menuList.menu_summ }
								</div>
							</td>
							<td>
								<strong>${menuList.menu_price } won</strong>
							</td>
							<td class="options">
								<a href="#0"><i class="icon_plus_alt2"></i></a>
							</td>
						</tr>
						</c:forEach>
					</tbody>
					</table>
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
					<a class="btn_full" href="/jsp/order/cart.jsp">Order now</a>
				</div><!-- End cart_box -->
			</div><!-- End col-md-4 -->
            
		</div><!-- End row -->
	</div><!-- End container pin -->
</div><!-- End container -->
<!-- End Content =============================================== -->

<!-- Footer ================================================== -->
<jsp:include page="/jsp/com/footer.jsp" />
<!-- End Footer =============================================== -->

   
<!-- Menu Detail modal -->   
<div class="modal fade" id="menuDetail" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content modal-popup">
		<h2>Menu Detail</h2>
			<a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
			${menuList.menu_content}
		</div>
	</div>
</div><!-- End Privacy Policy modal -->
  
  

<!-- SPECIFIC SCRIPTS -->
<script  src="/common/js/cat_nav_mobile.js"></script>
<script>$('#cat_nav').mobileMenu();</script>
<script src="/common/js/jquery.pin.min.js"></script>
<script>$("#cart_box").pin({padding: {top: 80, bottom: 25},minWidth: 1100, containerSelector: "#container_pin"})</script>
<script>
 $(function() {
	 'use strict';
	  $('a[href*=#]:not([href=#])').click(function() {
	    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
	      var target = $(this.hash);
	      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
	      if (target.length) {
	        $('html,body').animate({
	          scrollTop: target.offset().top - 70
	        }, 1000);
	        return false;
	      }
	    }
	  });
	});
</script>

</body>
</html>