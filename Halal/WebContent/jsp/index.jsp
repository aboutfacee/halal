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
    <div id="full-slider-wrapper">
    <div id="layerslider" style="width:100%;height:600px;">
        <!-- first slide -->
        <div class="ls-slide" data-ls="slidedelay: 5000; transition2d:5;">
            <img src="/common/img/slides/food-320863_1280.jpg" class="ls-bg" alt="Slide background">
        	<h3 class="ls-l slide_typo" style="top: 44%; left: 50%;" data-ls="offsetxin:0;durationin:2000;delayin:1000;easingin:easeOutElastic;rotatexin:90;transformoriginin:50% bottom 0;offsetxout:0;rotatexout:90;transformoriginout:50% bottom 0;" ><strong>Enjoy</strong> a quick friends dinner</h3>
            <p class="ls-l slide_typo_2" style="top:52%; left:50%;" data-ls="durationin:2000;delayin:1000;easingin:easeOutElastic;" >Order Quality Takeaway or Delivery Food online</p>
       </div>
       
        <!-- second slide -->
    <div class="ls-slide" data-ls="slidedelay: 5000; transition2d:5;">
            <img  src="/common/img/slides/noodles-516635_1280.jpg" class="ls-bg" alt="Slide background">
        	<h3 class="ls-l slide_typo" style="top: 44%; left: 50%;" data-ls="offsetxin:0;durationin:2000;delayin:1000;easingin:easeOutElastic;rotatexin:90;transformoriginin:50% bottom 0;offsetxout:0;rotatexout:90;transformoriginout:50% bottom 0;" >Quick &amp; <strong>affordable</strong> quick food</h3>
            <p class="ls-l slide_typo_2" style="top:52%; left:50%;" data-ls="durationin:2000;delayin:1000;easingin:easeOutElastic;" >Order Quality Takeaway or Delivery Food online</p>
    </div>
    
     <!-- third slide -->
     <div class="ls-slide" data-ls="slidedelay:5000; transition2d:5;" >
             <img src="/common/img/slides/salad-374173_1280.jpg" class="ls-bg" alt="Slide background">
        	<h3 class="ls-l slide_typo" style="top: 44%; left: 50%;" data-ls="offsetxin:0;durationin:2000;delayin:1000;easingin:easeOutElastic;rotatexin:90;transformoriginin:50% bottom 0;offsetxout:0;rotatexout:90;transformoriginout:50% bottom 0;" ><strong>Great</strong> Food Quality &amp; Variety</h3>
            <p class="ls-l slide_typo_2" style="top:52%; left:50%;" data-ls="durationin:2000;delayin:1000;easingin:easeOutElastic;" >Order Quality Takeaway or Delivery Food online</p>
    </div>
      
    <!-- fourth slide -->
    <div class="ls-slide" data-ls="slidedelay: 5000; transition2d:5;">
        <img src="/common/img/slides/salmon-518032_1280.jpg" class="ls-bg" alt="Slide background">
        	<h3 class="ls-l slide_typo" style="top: 44%; left: 50%;" data-ls="offsetxin:0;durationin:2000;delayin:1000;easingin:easeOutElastic;rotatexin:90;transformoriginin:50% bottom 0;offsetxout:0;rotatexout:90;transformoriginout:50% bottom 0;" >Stop your <strong>hunger</strong> quickly</h3>
            <p class="ls-l slide_typo_2" style="top:52%; left:50%;" data-ls="durationin:2000;delayin:1000;easingin:easeOutElastic;" >Order Quality Takeaway or Delivery Food online</p>
    </div>
    </div>
    </div><!-- End layerslider -->
    <!-- End SubHeader ============================================ -->
    
    <!-- Content ================================================== -->
         <div class="high_light">
      	<div class="container">
      		<h3>Choose from over 30 Restaurants</h3>
            <p>We deliver your food in 30 Restaurantes.</p>
            <a data-toggle="modal" data-target="#notice">Order Now</a>
        </div><!-- End container -->
      </div><!-- End hight_light -->
      
      
         <div class="container margin_60">
        
        
        
         <div class="main_title">
            <h2 class="nomargin_top" style="padding-top:0">How it works</h2>
            <p>
                Cum doctus civibus efficiantur in imperdiet deterruisset.
            </p>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="box_home" id="one">
                    <span>1</span>
                    <h3>Search by address</h3>
                    <p>
                        Find all restaurants available in your zone.
                    </p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="box_home" id="two">
                    <span>2</span>
                    <h3>Choose a restaurant</h3>
                    <p>
                        We have more than 1000s of menus online.
                    </p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="box_home" id="three">
                    <span>3</span>
                    <h3>Pay by card or cash</h3>
                    <p>
                        It's quick, easy and totally secure.
                    </p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="box_home" id="four">
                    <span>4</span>
                    <h3>Delivery or takeaway</h3>
                    <p>
                        You are lazy? Are you backing home?
                    </p>
                </div>
            </div>
        </div><!-- End row -->
        </div><!-- End container -->
            
    <div class="white_bg">
    <div class="container margin_60">
        
        <div class="main_title">
           <h2 class="nomargin_top">Our Delivery Service</h2>
            <p>
                We deliver your order with this delivery service.
            </p>
        </div>
        
        <div class="row">
            <div class="col-md-6">
                <a class="strip_list">
                    <div class="desc">
                        <h3>Ordinary Service</h3>
                    </div><!-- End desc-->
                </a><!-- End strip_list-->
            </div><!-- End col-md-6-->
            <div class="col-md-6">
                <a class="strip_list">
                    <div class="desc">
                        <h3>Express Service</h3>
                    </div><!-- End desc-->
                </a><!-- End strip_list-->
            </div>
        </div><!-- End row -->   
        
        </div><!-- End container -->
        </div><!-- End white_bg -->
        
            
        <div class="high_light">
	      	<div class="container">
	      		<div class="sub_content">
	            <h3>We deliver your order in this area</h3>
	            <p>
	                You should check your accommodation address.
	            </p>
	        </div>
        </div><!-- End container -->
      </div><!-- End hight_light -->
      
      
    <section class="parallax-window" data-parallax="scroll" data-image-src="/common/img/slides/food-320863_1280.jpg" data-natural-width="1200" data-natural-height="600">
    </section><!-- End section -->
    <!-- End Content =============================================== -->

<!-- Footer ================================================== -->
    <jsp:include page="/jsp/com/footer.jsp" />
<!-- End Footer =============================================== -->

<!-- Notice modal -->   
<div class="modal fade" id="notice" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content modal-popup">
			<h2>Notice</h2>
			<a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
			공지사항			
			<form method="get" action="/halal/RestaurantList">
			    <button type="submit" class="btn btn-submit">Confirm</button>
			</form>
		</div>
	</div>
</div><!-- End Notice modal -->

<!-- SPECIFIC SCRIPTS -->
<script src="/common/layerslider/js/greensock.js"></script>
<script src="/common/layerslider/js/layerslider.transitions.js"></script>
<script src="/common/layerslider/js/layerslider.kreaturamedia.jquery.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
		'use strict';
        $('#layerslider').layerSlider({
            autoStart: true,
			responsive: true,
			responsiveUnder: 1280,
			layersContainer: 1170,
			navButtons:false,
			showCircleTimer:false,
			navStartStop:false,
            skinsPath: '/common/layerslider/skins/'
            // Please make sure that you didn't forget to add a comma to the line endings
            // except the last line!
        });
    });
</script>

</body>
</html>