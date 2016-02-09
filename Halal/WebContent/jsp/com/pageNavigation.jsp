<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/jsp/com/headerF.jsp" %>
<c:set var="pageNaviMap" value="${resultMap.pageNaviMap}" />

<div class="textcenter margtop20">
	<nav>
		<ul class="pagination pagination-sm">
			<%-- 이전페이지 --%>
			<c:if test="${pageNaviMap['startPage'] > 1}">
				<li><a href="#none" aria-label="Previous" onclick="goPage('1', '${ blogList.category}' );"><span aria-hidden="true">&laquo;</span></a></li>
				<li><a href="#none" aria-label="Previous" onclick="goPage(${ pageNaviMap.startPage - 1 }, '${ blogList.category}' );"><span aria-hidden="true">&lsaquo;</span></a></li>
			</c:if>

			<c:set var="iPage" value="${pageNaviMap['startPage']}" scope="request"/>
			<c:if test="${pageNaviMap['endPage'] > 1}">
				<c:forEach begin="${pageNaviMap['startPage']}" end="${pageNaviMap['endPage']}" varStatus="status">
					<c:choose>
						<c:when test="${iPage == pageNaviMap['currentPage']}">
							<li class="active"><a href="#">${ iPage }</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="#none" onclick="goPage(${iPage}, '${ blogList.category}' );">${ iPage }</a></li>
						</c:otherwise>
					</c:choose>
					<c:set var="iPage" value="${pageNaviMap['startPage'] + status.count}" scope="request"/>
				</c:forEach>
			</c:if>

			<%-- 다음페이지 --%>
			<c:if test="${pageNaviMap['endPage'] < pageNaviMap['totalPage']}">
				<li><a href="#none" aria-label="Next" onclick="goPage(${ pageNaviMap.endPage + 1 }, '${ blogList.category}' );"><span aria-hidden="true">&rsaquo;</span></a></li>
				<li><a href="#none" aria-label="Next" onclick="goPage(${ pageNaviMap.totalPage}, '${ blogList.category}' );"><span aria-hidden="true">&raquo;</span></a></li>
			</c:if>
		</ul>
	</nav>
</div>
