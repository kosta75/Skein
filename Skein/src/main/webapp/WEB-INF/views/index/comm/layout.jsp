<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>

<!-- 공통으로 적용되는 요소 Load -->
<tiles:insertAttribute name="common-resources" />

<!-- 인덱스 페이지에 추가하려는 요소 Load -->
<tiles:insertAttribute name="custom-index-resources" />

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
</se:authorize>
</body>
</html>