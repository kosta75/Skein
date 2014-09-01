<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title><tiles:getAsString name="title"/></title>

	<!-- Script -->
	<!-- 공통 -->
	<script src="${pageContext.request.contextPath}/resources/js/common/jquery-2.1.1.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common/common.js"></script>
	
	<!-- 로그인 공통 -->
	<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
	<script src="${pageContext.request.contextPath}/resources/js/common/logged/common-logged.js"></script>
	<!-- 로그인 메뉴바, 상태사이드 메뉴 -->
	<script src="${pageContext.request.contextPath}/resources/js/common/logged/aside-logged.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common/logged/menu-logged.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common/logged/map.js"></script>
	</se:authorize>
	
	<!-- CSS -->
	<!-- 공통 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/reset.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/common.css" />
	
	<!-- 로그인 공통 -->
	<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/logged/common-logged.css" />
	<!-- 로그인 메뉴바, 상태사이드 메뉴 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/logged/aside-logged.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/logged/menu-logged.css" />
	</se:authorize>
	
	<!-- 현재페이지 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}<tiles:getAsString name="css"/>" />

</head>

<body>
<div class="header-container ${sessionScope.BASE_MEMBER_INFO.colorTheme}">
	<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
	<div id="changeBackgroundColor">
		<ul>
			<li class="green"></li>
			<li class="skyblue"></li>
			<li class="red"></li>
			<li class="orange"></li>
			<li class="blue"></li>
			<li class="yellowgreen"></li>
		</ul>
	</div>
	</se:authorize>
	<div class="wrapper">
		<tiles:insertAttribute name="header" />
	</div>
</div>
<div class="main-section-container">
	<div class="wrapper">
		<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
		<tiles:insertAttribute name="menu-logged" />
		<tiles:insertAttribute name="aside-logged" />
		</se:authorize>
		<tiles:insertAttribute name="content" />
	</div>
</div>
<div class="footer-container">
	<div class="wrapper">
		<tiles:insertAttribute name="footer" />
	</div>
</div>
</body>
</html>
