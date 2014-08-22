<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<head>
	<meta charset="UTF-8">
	<title><tiles:getAsString name="title"/></title>
	<script src="//code.jquery.com/jquery-latest.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/friendship.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/friendship/viewlist.css" />
	
	
</head>
<body>
	<div class="header-container ${colorTheme}">  <!-- Bar -->
		<div class="wrapper">
			<tiles:insertAttribute name="header" />
		</div>
	</div>
	<div class="main-section-container">
		<div class="wrapper">
			<tiles:insertAttribute name="viewlist" />
		</div>
	</div>
	<div class="footer-container">
		<div class="wrapper">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>