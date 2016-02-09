<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/jsp/com/headerF.jsp" %>
<c:set var="pageNaviMap" value="${resultMap.pageNaviMap}"/>
<c:set var="blogList" value="${resultMap.blogList}"/>
<!-- paging -->
<div class="row">
<div>
<div class="dataTables_paginate paging_bootstrap pagination fm1" id="tableWithExportOptions_paginate">
	<ul class="ii4">
	<c:if test="${pageNaviMap['startPage'] > 1}">
		    <%-- 첫페이지 --%>
			<c:choose>
				<c:when test="${pageNaviMap['currentPage'] > 1}">
					<li class="prev disabled"><a href="#none" onclick="goPage('1');"><i class="pg-arrow_left"></i></a></li>
				</c:when>
				<c:otherwise>
					<li class="prev disabled"><a href="#first"><i class="pg-arrow_left"></i></a></li>
				</c:otherwise>
			</c:choose>
			<%-- 이전페이지 --%>
			<c:choose>
				<c:when test="${pageNaviMap['startPage'] > 1}">
					<li class="prev disabled"><a href="#none" onclick="goPage(${ pageNaviMap.startPage - 1 });"><i class="pg-arrow_left"></i></a></li>
				</c:when>
				<c:otherwise>
					<li class="prev disabled"><a href="#pre"><i class="pg-arrow_left"></i></a></li>
				</c:otherwise>
			</c:choose>
	</c:if>
    <c:set var="iPage" value="${pageNaviMap['startPage']}" scope="request"/>
	<c:if test="${pageNaviMap['endPage'] != 1}">
		<c:forEach begin="${pageNaviMap['startPage']}" end="${pageNaviMap['endPage']}" varStatus="status">
			<c:choose>
				<c:when test="${iPage == pageNaviMap['currentPage']}">
					<li><strong>${ iPage }</strong></li>
				</c:when>
				<c:otherwise>
					<li><a href="#none" onclick="goPage(${iPage});">${ iPage }</a></li>
				</c:otherwise>
			</c:choose>
			<c:set var="iPage" value="${pageNaviMap['startPage'] + status.count}" scope="request"/>
		</c:forEach>
	</c:if>
	<c:if test="${pageNaviMap['endPage'] < pageNaviMap['totalPage']}">
			<%-- 다음페이지 --%>
			<c:choose>
				<c:when test="${pageNaviMap['endPage'] < pageNaviMap['totalPage']}">
					<li class="next"><a href="#none" onclick="goPage(${ pageNaviMap.endPage + 1 });"><i class="pg-arrow_right"></i></a></li>
				</c:when>
				<c:otherwise>
					<li class="next"><a href="#next"><i class="pg-arrow_right"></i></a></li>
				</c:otherwise>
			</c:choose>
			<%-- 마지막페이지 --%>
			<c:choose>
				<c:when test="${pageNaviMap['currentPage'] < pageNaviMap['totalPage']}">
					<li class="next"><a href="#none" onclick="goPage(${ pageNaviMap.totalPage});"><i class="pg-arrow_right"></i></a></li>
				</c:when>
				<c:otherwise>
					<li class="next"><a href="#end"><i class="pg-arrow_right"></i></a></li>
				</c:otherwise>
			</c:choose>
	</c:if>
	</ul>
	</div>
	</div>
</div>
<!-- //paging -->