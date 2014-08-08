<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css" />
<script src="//code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<se:authorize ifNotGranted="ROLE_USER">
	<tiles:insertAttribute name="notLoggedContent" />
</se:authorize>
		
<se:authentication property="name" var="LoginUser"/>
<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="loggedContent" />
	<tiles:insertAttribute name="footer" />	
</se:authorize>
</body>
</html>