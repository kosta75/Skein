<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">

<!-- 1. 로그인 안된 인덱스 페이지구성 -->
<se:authorize ifNotGranted="ROLE_USER">
<head>
	<meta charset="UTF-8">
	<title><tiles:getAsString name="title"/></title>
	
	<!-- Script -->
	<!-- 공통 -->
	<script src="${pageContext.request.contextPath}/resources/js/common/jquery-2.1.1.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common/common.js"></script>
	
	<!-- 현재 페이지 -->
	<script src="${pageContext.request.contextPath}/resources/js/index/index-not-logged.js"></script>
	
	<!-- CSS -->
	<!-- 공통 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/reset.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/common.css" />
	
	<!-- 현재페이지 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index/index-not-logged.css" />
	
</head>
<body>
<div class="not-logged-main-section-container">
	<div class="wrapper">
		<tiles:insertAttribute name="index-not-logged" />
	</div>
</div>
</body>
</se:authorize>


<!-- 2. 로그인 된 인덱스 페이지 구성 -->
<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
<head>
	<meta charset="UTF-8">
	<title><tiles:getAsString name="title"/></title>
	
	<!-- Script -->
	<!-- 공통 -->
	<script src="${pageContext.request.contextPath}/resources/js/common/jquery-2.1.1.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common/common.js"></script>
	
	<!-- 로그인 공통 -->
	<script src="${pageContext.request.contextPath}/resources/js/common/logged/common-logged.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common/logged/aside-logged.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common/logged/menu-logged.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common/logged/map.js"></script>
	
	<!-- 현재 페이지 -->
	<script src="${pageContext.request.contextPath}/resources/js/index/index-logged.js"></script>
	
	<!-- CSS -->
	<!-- 공통 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/jquery-ui.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/common.css" />
	
	<!-- 로그인 공통 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css//common/logged/common-logged.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css//common/logged/aside-logged.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css//common/logged/menu-logged.css" />
	
	<!-- 현재 페이지 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index/index-logged.css" />
	
</head>
<body>

	<div class="header-container ${sessionScope.BASE_MEMBER_INFO.colorTheme}">  <!-- Bar -->
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
		<div class="wrapper">
			<tiles:insertAttribute name="header" />
		</div>
	</div>
	<div class="main-section-container">
		<div class="wrapper">
			<tiles:insertAttribute name="menu-logged" />
			<tiles:insertAttribute name="aside-logged" />
			<tiles:insertAttribute name="index-logged" />
		</div>
	</div>
	<div class="footer-container">
		<div class="wrapper">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</se:authorize>

</html>
