<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}<tiles:getAsString name="default-css"/>" />
<script src="//code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/filereader.js"></script>
</head>
<body>
<se:authorize ifNotGranted="ROLE_USER">
<div class="main-section-container">
	<div class="wrapper">
		<tiles:insertAttribute name="index-not-logged" />
	</div>
</div>
</se:authorize>

<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
<div class="header-container">
	<div class="wrapper">
		<tiles:insertAttribute name="header" />
	</div>
</div>
<div class="main-section-container">
	<div class="wrapper">
		<tiles:insertAttribute name="index-logged" />
	</div>
</div>
<div class="footer-container">
	<div class="wrapper">
		<tiles:insertAttribute name="footer" />
	</div>
</div>	
</se:authorize>
</body>
</html>