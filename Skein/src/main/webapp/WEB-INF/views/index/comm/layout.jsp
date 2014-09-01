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
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index-not-logged.css" />
	
	<script src="//code.jquery.com/jquery-latest.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/index-not-logged.js"></script>
</head>
<body>
<div class="main-section-container">
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common-all.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common-logged.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index-logged.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css">
	
	<script src="//code.jquery.com/jquery-latest.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
	<script src="http://path/to/your/copy/of/jquery.blockUI.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common-logged.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common-owner.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/index-logged.js"></script>
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
