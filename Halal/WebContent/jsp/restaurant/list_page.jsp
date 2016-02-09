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
<section class="parallax-window" id="short" data-parallax="scroll" data-image-src="/common/img/slides/food-320863_1280.jpg" data-natural-width="1400" data-natural-height="350">
    <div id="subheader">
	<div id="sub_content">
    	<h1>24 results in your zone</h1>
        <div><i class="icon_pin"></i> 135 Newtownards Road, Belfast, BT4 1AB</div>
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
	<div class="row">
		<div class="col-md-3">
			<div id="filters_col">
				<h4>My Food Delivered at</h4>
				<hr>
				<div class="form-group">
					<label>Delivery Day</label>
					<select class="form-control" name="delivery_schedule_day" id="delivery_schedule_day">
						<option value="" selected>Select day</option>
						<option value="Today">Today</option>
						<option value="Tomorrow">Tomorrow</option>
						<option value="AfterTomorrow">After Tomorrow</option>
					</select>
				</div>
				<div class="form-group">
					<label>Delivery time</label>
					<select class="form-control" name="delivery_schedule_time" id="delivery_schedule_time">
						<option value="" selected>Select time</option>
						<option value="08.00am">08.00am</option>
						<option value="11.00am">11.00am</option>
						<option value="03.00pm">03.00pm</option>
						<option value="06.00pm">06.00pm</option>
						<option value="09.00pm">09.00pm</option>
					</select>
					<hr>
					<a href="list_page.jsp" class="btn_3">Search</a>
				</div>
					
			</div><!--End filters col-->
		</div><!--End col-md -->
		
		<div class="col-md-9">
			
			
			<c:forEach var="restaurantList" items="${resultMap.restaurantList}" varStatus="status">
			
			<div class="strip_list wow fadeIn" data-wow-delay="0.1s">
				<div class="row">
					<div class="col-md-9 col-sm-9">
						<div class="desc">
							<div class="thumb_strip">
								<a href="/jsp/restaurant/detail_page.jsp"><img src="/common/img/${restaurantList.rest_img}" alt=""></a>
							</div>
							<h3>${restaurantList.rest_nm}</h3>
							<div class="type">
								${restaurantList.rest_content} <span class="opening">Opens at ${restaurantList.deli_start_time }.</span> <span class="opening">Closes at ${restaurantList.deli_end_time }.</span>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-3">
						<div class="go_to">
							<div>
								<form id="restList" name="restList" method="post" action="/halal/RestaurantDetail">
									<input type="hidden" id="rest_no" name="rest_no" value="${restaurantList.rest_no }" />
									<button type="submit" class="btn_3">View Menu</button>
								</form>
							</div>
						</div>
					</div>
				</div><!-- End row-->
			</div><!-- End strip_list-->
			</c:forEach>
			
            <a href="#0" class="load_more_bt wow fadeIn" data-wow-delay="0.2s">Load more...</a>  
		</div><!-- End col-md-9-->
        
	</div><!-- End row -->
</div><!-- End container -->
<!-- End Content =============================================== -->

<!-- Footer ================================================== -->
    <jsp:include page="/jsp/com/footer.jsp" />
<!-- End Footer =============================================== -->


<!-- SPECIFIC SCRIPTS -->
<script  src="js/cat_nav_mobile.js"></script>
<script>$('#cat_nav').mobileMenu();</script>
<script src="http://maps.googleapis.com/maps/api/js"></script>
<script src="/common/js/map.js"></script>
<script src="/common/js/infobox.js"></script>
<script src="/common/js/ion.rangeSlider.js"></script>
<script>
    $(function () {
		 'use strict';
        $("#range").ionRangeSlider({
            hide_min_max: true,
            keyboard: true,
            min: 0,
            max: 15,
            from: 0,
            to:5,
            type: 'double',
            step: 1,
            prefix: "Km ",
            grid: true
        });
    });
</script>
</body>
</html>