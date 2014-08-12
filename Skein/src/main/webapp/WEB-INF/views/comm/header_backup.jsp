<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<header id="globalTop">
	<div class="logo">
		<a href="${pageContext.request.contextPath}">Main Logo</a>
	</div>
	
	<se:authorize ifNotGranted="ROLE_USER">
	<div>
		<form action="${pageContext.request.contextPath}/j_spring_security_check" method="post">
			<fieldset>
				<legend>로그인 정보</legend>
				이메일(name="email")<input type="email" name="j_username" /><br />
				비밀번호(name="password")<input type="password" name="j_password" /><br />
			</fieldset>
			<input type="submit" value="Login" />
		</form>
	</div>
	</se:authorize>
			
	<%-- <se:authentication property="name" var="LoginUser"/> --%>
	<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
		<p><a href="${pageContext.request.contextPath}/${sessionScope.PersonalURI}">(${sessionScope.PersonalURI})</a></p>
		<p><a href="${pageContext.request.contextPath}/j_spring_security_logout">로그아웃</a></p>	
	</se:authorize>
</header>
