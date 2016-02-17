<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/jsp/com/headerF.jsp" %>

<!DOCTYPE html>
<!--[if IE 9]><html class="ie ie9"> <![endif]-->
<html>
<head>
    <meta charset="utf-8">
    <title>Halal Oppa</title>
	<jsp:include page="/jsp/com/topDeclare.jsp" />
	<script src="/common/assets/js/jquery-ajaxHelper.js"></script> <!-- ajax 선언 -->
	<script type="text/javascript" charset="utf-8" src="/common/assets/js/modernizr.js"></script>
	<script src="/common/assets/plugins/codrops-dialogFx/dialogFx.js" type="text/javascript"></script>
	
	
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
					
					
						<c:set var="menuList" value="${resultMap.menuList}" />
						<c:forEach var="menuList" items="${resultMap.menuList}" varStatus="status">
						<tr>
							<td onclick="goMenuDetail(${menuList.menu_no })">
								<div id="menuThumb" data-toggle="modal" >
									<h4>${menuList.menu_name }</h4>
									<img src="/common/img/thumb_restaurant.jpg" alt="">
									${menuList.menu_summ }
								</div>
							</td>
							<td>
								<strong>${menuList.menu_price } won</strong>
							</td>
							<td class="options">
								<i class="icon_plus_alt2" onclick="addCart(${menuList.menu_no }, getCookie('cart'))"></i></a>
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
							 TOTAL <span class="pull-right" id="total">20000 KRW</span>
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
<div class="modal fade" id="menuDetail" role="dialog" aria-hidden="true" style="display:none;">
	<div class="modal-dialog">
		<div class="modal-content modal-popup">
		<h2>Menu Detail</h2>
			<a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
			<div id="menuContent"></div>
		</div>
	</div>
</div><!-- End Privacy Policy modal -->
  
  

<!-- SPECIFIC SCRIPTS -->
<script  src="/common/assets/js/cat_nav_mobile.js"></script>
<script>$('#cat_nav').mobileMenu();</script>
<script src="/common/assets/js/jquery.pin.min.js"></script>
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

function addCart(menu_no, cart_no)
{

	var dataPack = new Object();
	dataPack.menu_no = menu_no;
	dataPack.cart_no = cart_no;
	var ajaxResult = ajaxHelper("/halal/AddCart", {"paramPack" : JSON.stringify(dataPack)});
	
	ajaxResult.success(function(data){
		var resultVO = data.resultVO;
		
		$("#addCart").empty();
	
		var cart = "";
		var sum = 0;

		for (var i in resultVO){
			if(resultVO[i].count == 0) 
				continue;
		cart += "<a href='#0' class='remove_item pull-left' onclick='deleteMenu(" + resultVO[i].menu_no + ", " + cart_no + ")'><i class='icon_minus_alt pull-left'></i></a>&nbsp<strong>"+ resultVO[i].count+"x &nbsp</strong>";
		
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
}

function deleteMenu(menu_no, cart_no)
{
	var dataPack = new Object();
	dataPack.menu_no = menu_no;
	dataPack.cart_no = cart_no;
	var ajaxResult = ajaxHelper("/halal/DeleteCart", {"paramPack" : JSON.stringify(dataPack)});
	
	ajaxResult.success(function(data){
		var resultVO = data.resultVO;
		
		$("#addCart").empty();
	
		var cart = "";
		var sum = 0;

		for (var i in resultVO){
			if(resultVO[i].count == 0) 
				continue;
			cart += "<a href='#0' class='remove_item pull-left' onclick='deleteMenu(" + resultVO[i].menu_no + ", " + cart_no + ")'><i class='icon_minus_alt pull-left'></i></a>&nbsp<strong>"+ resultVO[i].count+"x &nbsp</strong>";
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
}


function goMenuDetail(menu_no){
	
    $("body").css({ "overflow": "auto" });
    
    var dataPack = new Object();
	dataPack.menu_no = menu_no;
	var ajaxResult = ajaxHelper("/halal/MenuDetail", {"paramPack" : JSON.stringify(dataPack)});

	ajaxResult.success(function(data){
		var restaurantVo = data.restaurantVo;
		if(!restaurantVo == null || !restaurantVo == ""){
			
			$("#menuContent").empty();
			$("#menuContent").append(restaurantVo.menu_img);
			$("#menuContent").append(restaurantVo.menu_content);
			$("#menuDetail").modal('toggle');

		} else{
			alert("못가져옴");
		}
	});

	alert(getCookie());
}

/* 
function addCart(menu_no)
{
	var dataPack = new Object();
	dataPack.menu_no = menu_no;
	var ajaxResult = ajaxHelper("/halal/AddCart", {"paramPack" : JSON.stringify(dataPack)});

	ajaxResult.success(function(data){
		var restaurantVo = data.restaurantVo;
		if(!getCookie(restaurantVo.menu_name) == null || getCookie(restaurantVo.menu_name) == "" )
		{
			alert("1111");
			var deleteMenu=$("<a href='#0' class='remove_item pull-left' onclick='deleteMenu(" + restaurantVo.menu_no + ")'><i class='icon_minus_alt pull-left'></i></a><br>");
			var addMenuCount=$("<strong>1x</strong><br>");
			var addMenuName=$("<span>" + restaurantVo.menu_name + "</span><br>");
			var addMenuPrice=$("<strong class='pull-right'>" + restaurantVo.menu_price + " KRW</strong><br>");
			
			$("#deleteMenu").append(deleteMenu)
			$("#addMenuCount").append(addMenuCount)
			$("#addMenuName").append(addMenuName)
			$("#addMenuPrice").append(addMenuPrice)
			setCookie(restaurantVo.menu_name, restaurantVo.menu_no, 1);

			alert(getCookie(restaurantVo.menu_name));

		} else {
			alert("2222");
			
			alert(getCookie(restaurantVo.menu_name));

		setCookie(restaurantVo.menu_name, restaurantVo.menu_no, 1);
       	$("#addMenu").append(restaurantVo.menu_name);
		
		}

	})
}

function deleteMenu(menu_no)
{
	alert("Asdfasdf");

	var dataPack = new Object();
	dataPack.menu_no = menu_no;
	var ajaxResult = ajaxHelper("/halal/AddCart", {"paramPack" : JSON.stringify(dataPack)});

	ajaxResult.success(function(data){
		var restaurantVo = data.restaurantVo;
		
		setCookie(restaurantVo.menu_name, '', -1);


	})
}


function goMenuDetail(menu_no){
	
    $("body").css({ "overflow": "auto" });
    
    var dataPack = new Object();
	dataPack.menu_no = menu_no;
	var ajaxResult = ajaxHelper("/halal/MenuDetail", {"paramPack" : JSON.stringify(dataPack)});

	ajaxResult.success(function(data){
		var restaurantVo = data.restaurantVo;
		if(!restaurantVo == null || !restaurantVo == ""){
			
			$("#menuContent").empty();
			$("#menuContent").append(restaurantVo.menu_img);
			$("#menuContent").append(restaurantVo.menu_content);
			$("#menuDetail").modal('toggle');

		} else{
			alert("못가져옴");
		}
	});

	alert(getCookie());
}
*/

//쿠키 생성
function setCookie(cName, cValue, cDay){
    var expire = new Date();
    expire.setDate(expire.getDate() + cDay);
    cookies = cName + '=' + escape(cValue) + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
    if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
    document.cookie = cookies;
}

// 쿠키 가져오기
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
 	
(function(){
 	var cart = ${cart.cart_no};
	setCookie('cart', cart, 1);
})();
</script>

</body>
</html>