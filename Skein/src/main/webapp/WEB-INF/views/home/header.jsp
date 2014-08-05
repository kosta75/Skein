<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<div>헤더</div>
		
<se:authentication property="name" var="LoginUser"/>
<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
	<li><a href="${pageContext.request.contextPath}/j_spring_security_logout">(${LoginUser})로그아웃</a></li>	
</se:authorize>