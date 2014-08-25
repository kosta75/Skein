<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="subNavigationContainer">
	<div id="menu2" class="sub-menu2 ${sessionScope.BASE_MEMBER_INFO.colorTheme}">
		<div class="menu-username">
			<a href="${pageContext.request.contextPath}/${sessionScope.BASE_MEMBER_INFO.personalURI}">${sessionScope.BASE_MEMBER_INFO.personalURI}</a>
		</div>

		<nav class="sub-navigation">
			<ul class="arrowunderline">
				<li><a href="${pageContext.request.contextPath}">타임라인</a></li>
				<li><a href="${pageContext.request.contextPath}/photo/">사진</a></li>
				<li><a href="${pageContext.request.contextPath}/friendship/">친구</a></li>
				<li><a href="${pageContext.request.contextPath}/notification/">알림</a></li>
				<li><a href="#">고객센터</a></li>
				<li><a href="${pageContext.request.contextPath}/security/logout">Log Out</a></li>
				<li><a href="#changeBackgroundColor" class="scroll">▲TOP</a></li>
			</ul>
		</nav>
	</div>

	<div id="menu" class="sub-menu">
		<div class="menu-username">
			<a href="${pageContext.request.contextPath}/${sessionScope.BASE_MEMBER_INFO.personalURI}">${sessionScope.BASE_MEMBER_INFO.personalURI}</a>
		</div>
		<nav class="sub-navigation">
			<ul class="arrowunderline">
				<li><a href="${pageContext.request.contextPath}">타임라인</a></li>
				<li><a href="${pageContext.request.contextPath}/photo/">사진</a></li>
				<li><a href="${pageContext.request.contextPath}/friendship/">친구</a></li>
				<li><a href="${pageContext.request.contextPath}/notification/">알림</a></li>
			</ul>
		</nav>
	</div>
</div>