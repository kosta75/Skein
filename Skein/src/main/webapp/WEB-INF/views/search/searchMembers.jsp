<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<section class="content-container">
서치 멤버스 <br />
<ul>
<c:forEach var="list" items="${list}">
	<li>
		<div>
			<p><a href="${pageContext.request.contextPath}/${list.personalURI}">${list.fullName}</a>(${list.personalURI})</p>
			<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
			<c:choose>
				<c:when test="${list.isFriend != 1}">
					<span class="addFriends" data-uri="${list.personalURI}">친구신청</span>
				</c:when>
				<c:otherwise>
					<span>Text</span>
				</c:otherwise>
			</c:choose>
			</se:authorize>
		</div>
	</li>
</c:forEach>
</ul>



</section>
<script src="${pageContext.request.contextPath}/resources/js/search.js"></script>