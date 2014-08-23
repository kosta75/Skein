<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<se:authentication property="name" var="LoginUser" />
<section class="content-container">
	<div id="subNavigationContainer">
		<div id="menu" class="sub-menu">
			<div class="menu-username">
				<a  href="${pageContext.request.contextPath}/${sessionScope.PersonalURI}">${sessionScope.PersonalURI}</a>
			</div>
			<nav class="sub-navigation">
				<ul class="arrowunderline">
					<li><a href="${pageContext.request.contextPath}/timeline/viewlist">타임라인</a></li>
					<li><a href="#">정보</a></li>
					<li><a href="${pageContext.request.contextPath}/photo/viewlist">사진</a></li>	
					<li><a href="${pageContext.request.contextPath}/friendship/viewlist">친구</a></li>
				</ul>
			</nav>
		</div>
			
		<div id="menu2" class="sub-menu2 ${colorTheme}">
			<div class="menu-username">
				<a  href="${sessionScope.PersonalURI}">${sessionScope.PersonalURI}</a>
			</div>

			<nav class="sub-navigation">
				<ul class="arrowunderline">
					<li><a href="${pageContext.request.contextPath}/timeline/viewlist">타임라인</a></li>
					<li><a href="#">정보</a></li>
					<li><a href="${pageContext.request.contextPath}/photo/viewlist">사진</a></li>
					<li><a href="${pageContext.request.contextPath}/friendship/viewlist">친구</a></li>
					<li><a href="#">고객센터</a></li>
					<li><a href="${pageContext.request.contextPath}/security/logout">Log Out</a></li>
				</ul>
			</nav>
		</div>
	</div>
	
	
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