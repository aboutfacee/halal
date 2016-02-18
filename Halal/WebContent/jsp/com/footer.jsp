<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/jsp/com/headerF.jsp" %>

<c:set var="userInfo" value="${sessionScope.USERINFO}" />


<!-- Footer ================================================== -->
<footer>
<div class="container">
    <div class="row">
        <div class="col-md-5 col-sm-3">
            <h3>About us</h3>
            <ul>
             홈페이지 소개
            </ul>
        </div>
        <div class="col-md-3 col-sm-3">
            <h3>About</h3>
            <ul>
                <li><a href="/jsp/com/faq.jsp">Faq</a></li>
                <c:if test="${empty userInfo.email}">
                <li><a href="#0" data-toggle="modal" data-target="#register">Register</a></li>
                </c:if>
                <li><a href="#0" data-toggle="modal" data-target="#tos">Terms and conditions</a></li>
                <li><a href="#0" data-toggle="modal" data-target="#privacy">Privacy policy</a></li>
            </ul>
        </div>
        <div class="col-md-3 col-sm-3">
            <h3>Secure payments with</h3>
            <p>
                <img src="/common/img/cards.png" alt="" class="img-responsive">
            </p>
        </div>
    </div><!-- End row -->
    <div class="row">
        <div class="col-md-12">
            <div id="social_footer">
                <ul>
                    <li><a href="#0"><i class="icon-facebook"></i></a></li>
                    <li><a href="#0"><i class="icon-instagram"></i></a></li>
                </ul>
                <p>
                    Copyright@ 2016. Halal in Seoul All Rights Reserved
                </p>
            </div>
        </div>
    </div><!-- End row -->
</div><!-- End container -->
</footer>
<!-- End Footer =============================================== -->

<!-- Register modal -->   
<div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="myRegister" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content modal-popup">
			<a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
			<form action="/halal/MemberJoin" class="popup-form" id="myRegister" method="post">
               	<div class="login_icon"><i class="icon_lock_alt"></i></div>
                <div class="col-md-12 col-sm-12">
				<input type="email" class="form-control form-white" id="email" name="email" placeholder="Email" value="">
				<input type="text" class="form-control form-white" id="mem_name" name="mem_name" placeholder="Name" value="">
				<input type="password" class="form-control form-white" id="pwd" name="pwd" placeholder="Password" value="">
				</div>
				<div class="col-md-4 col-sm-4">
						<select class="form-control form-white" name="country_code" id="country_code">
							<option value="" selected>Country</option>
							<option value="Korea">+082</option>
							<option value="Korea">+082</option>
						</select>
				</div>
				<div class="col-md-8 col-sm-8">
					<input type="text" class="form-control form-white" id="phone" name="phone" placeholder="Telephone" value="">
				</div>
			
				<div class="col-md-4 col-sm-4">
					<select class="form-control form-white" name="social_name" id="social_name">
						<option value="" selected>SNS</option>
						<option value="Line">Line</option>
						<option value="Facebook">Facebook</option>
					</select>
				</div>
				<div class="col-md-8 col-sm-8">
						<input type="text" class="form-control form-white" id="social_id" name="social_id" placeholder="SNS ID" value="">
				</div>
				
		        <div id="pass-info" class="clearfix"></div>
				
				<div class="checkbox-holder text-left">
					<div class="checkbox">
						<input type="checkbox" value="accept_2" id="check_2" name="check_2" />
						<label for="check_2"><span>I Agree to the <strong>Terms &amp; Conditions</strong></span></label>
					</div>
				</div>
				<button type="submit" class="btn btn-submit">Register</button>
				
				<%
					String returnUrl = (String)request.getRequestURL().toString();	
				%>
				<input type="hidden" name="returnUrl" value="<%=returnUrl %>" >
					
			</form>
		</div>
	</div>
</div><!-- End Register modal -->


<!-- Terms and conditions modal -->   
<div class="modal fade" id="tos" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content modal-popup">
			<h2>Terms and conditions</h2>
			<a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
			이용약관			
			<button type="button" class="btn btn-submit close-link">Confirm</button>
		</div>
	</div>
</div><!-- End Terms and conditions modal -->

<!-- Privacy Policy modal -->   
<div class="modal fade" id="privacy" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content modal-popup">
		<h2>Privacy Policy</h2>
			<a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
			개인정보취급방침 내용			
			<button type="button" class="btn btn-submit close-link">Confirm</button>
		</div>
	</div>
</div><!-- End Privacy Policy modal -->
    
<div class="layer"></div><!-- Mobile menu overlay mask -->
    
<!-- COMMON SCRIPTS -->
<script src="/common/assets/js/jquery-1.11.2.min.js"></script>
<script src="/common/assets/js/common_scripts_min.js"></script>
<script src="/common/assets/js/functions.js"></script>
<script src="/common/assets/validate.js"></script>
