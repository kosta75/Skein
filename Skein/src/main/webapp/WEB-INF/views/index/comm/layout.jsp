<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">

<!-- 1. 로그인 안된 인덱스 페이지구성 -->
<se:authorize ifNotGranted="ROLE_USER">
<head>
	<meta charset="UTF-8">
	<title><tiles:getAsString name="title"/></title>
	<tiles:insertAttribute name="custom-index-not-logged-resources" />
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
	<tiles:insertAttribute name="common-resources" />
	<tiles:insertAttribute name="custom-index-logged-resources" />
</head>
<body>
	<div class="header-container ${colorTheme}">  <!-- Bar -->
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
</body>
</se:authorize>

</html>