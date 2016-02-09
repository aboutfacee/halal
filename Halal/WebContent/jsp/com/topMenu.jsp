<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/jsp/com/headerF.jsp"%>

<c:set var="userInfo" value="${sessionScope.USERINFO}" />


<header>
<div class="container-fluid">
    <div class="row">
        <div class="col--md-4 col-sm-4 col-xs-4">
            <a href="/halal/Index" id="logo">
            <img src="/common/img/logo.png" width="190" height="23" alt="" data-retina="true" class="hidden-xs">
            <img src="/common/img/logo_mobile.png" width="59" height="23" alt="" data-retina="true" class="hidden-lg hidden-md hidden-sm">
            </a>
        </div>
        <nav class="col--md-8 col-sm-8 col-xs-8">
        <a class="cmn-toggle-switch cmn-toggle-switch__htx open_close" href="javascript:void(0);"><span>Menu mobile</span></a>
        <div class="main-menu">
            <div id="header_menu">
                <img src="/common/img/logo.png" width="190" height="23" alt="" data-retina="true">
            </div>
            <a href="#" class="open_close" id="close_in"><i class="icon_close"></i></a>
            <ul>
                <c:choose>
					<c:when test="${empty userInfo.email}">
                	<li><a href="#0" data-toggle="modal" data-target="#login_2">Login</a></li>
                	</c:when>
	                <c:otherwise>
	                <li class="submenu">
                    <a href="javascript:void(0);" class="show-submenu">${userInfo.email}<i class="icon-down-open-mini"></i></a>
                    <ul>
                        <li><a href="/halal/Logout">Log out</a></li>
                        <li><a href="/jsp/member/mypage.jsp">My Page</a></li>
                    </ul>
                    </li>
                    
	                </c:otherwise>
				</c:choose>
                
            </ul>
        </div><!-- End main-menu -->
        </nav>
    </div><!-- End row -->
</div><!-- End container -->
</header>
    
<!-- Login modal -->   
<div class="modal fade" id="login_2" tabindex="-1" role="dialog" aria-labelledby="myLogin" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content modal-popup">
			<a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
			<form action="/halal/MemberLogin" class="popup-form" id="myLogin" method="post">
               	<div class="login_icon"><i class="icon_lock_alt"></i></div>
				<input type="text" class="form-control form-white" name="email" placeholder="Email" value="">
				<input type="password" class="form-control form-white" name="pwd" placeholder="Password" value="">
				<div class="text-left">
					<a href="#">Forgot Password?</a>
				</div>
				<button type="submit" class="btn btn-submit">Submit</button>
			</form>
		</div>
	</div>
</div><!-- End modal -->
