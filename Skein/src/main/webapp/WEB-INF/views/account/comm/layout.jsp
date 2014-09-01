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
	
	<!-- CSS -->
	<!-- 공통 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/reset.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/jquery-ui.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/common.css" />
	<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/logged/common-logged.css" />
	</se:authorize>
		
	<!-- 현재페이지 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}<tiles:getAsString name="css"/>" />

</head>
<body>

<div class="header-container ${sessionScope.BASE_MEMBER_INFO.colorTheme}">
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
