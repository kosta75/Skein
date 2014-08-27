<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
<script src="//code.jquery.com/jquery-latest.min.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common-all.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}<tiles:getAsString name="css"/>" />

<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common-logged.css" />
<script src="${pageContext.request.contextPath}/resources/js/common-logged.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common-owner.js"></script>
</se:authorize>
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
		<tiles:insertAttribute name="menu-logged" />
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
