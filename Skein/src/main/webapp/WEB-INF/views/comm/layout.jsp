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

<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
<tiles:insertAttribute name="custom-index-logged-resources" />
</se:authorize>


<!-- 각 페이지에 추가하려는 요소 Load -->
<tiles:insertAttribute name="custom-page-resources" />

</head>
<body>

<div class="header-container" >
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