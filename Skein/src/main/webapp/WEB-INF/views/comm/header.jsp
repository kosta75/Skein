<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<div>헤더</div>
<p><a href="${pageContext.request.contextPath}">Main</a></p>
<se:authorize ifNotGranted="ROLE_USER">
<div>
	<form action="${pageContext.request.contextPath}/j_spring_security_check" method="post">
		<fieldset>
			<legend>로그인 정보</legend>
			이메일(name="email")<input type="email" name="j_username" value="abc@abc.com" /><br />
			비밀번호(name="password")<input type="password" name="j_password" value="1004" /><br />
		</fieldset>
		<input type="submit" value="Login" />
	</form>
</div>
</se:authorize>
		
<se:authentication property="name" var="LoginUser"/>
<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
	<p><a href="${pageContext.request.contextPath}/${sessionScope.PersonalURI}">(${sessionScope.PersonalURI})</a></p>
	<p><a href="${pageContext.request.contextPath}/j_spring_security_logout">로그아웃</a></p>	
</se:authorize>