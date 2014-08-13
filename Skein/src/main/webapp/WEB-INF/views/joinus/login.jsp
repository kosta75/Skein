<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <c:if test="${param.error != null}">
	<div>
		로그인 실패<br />
		<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
		<c:set var="msg">${SPRING_SECURITY_LAST_EXCEPTION.message}</c:set>
		이유 : <c:out value="${msg}"></c:out>
		
		</c:if>
		
	</div>
	
	
	<c:if test="${msg == 'User is disabled'}">
		인증을 받아야 되요!
		<a href="${pageContext.request.contextPath}/joinus/sendCertificationText">인증메일 보내기!</a>
	</c:if>
</c:if> --%>

<div>
<c:choose>
	<c:when test="${LOGIN_ERROR_CODE != 0}">
		<p>인증되지 않은 계정입니다. 이메일 인증 과정을 마무리해주세요. 계정인증코드를 받지 못하셨으면 링크를 클릭하여 인증 메일을 다시 보내실 수 있습니다.<a href="${pageContext.request.contextPath}/joinus/sendCertificationText">인증메일</a></p>
	</c:when>
	<c:otherwise>
		<p>로그인에 실패 하였습니다. 이메일이나 비밀번호를 확인하세요.</p>	
	</c:otherwise>
</c:choose>
<c:if test="">
</c:if>
</div>

	<form action="${pageContext.request.contextPath}/j_spring_security_check" method="post">
		<fieldset>
			<legend>로그인 정보</legend>
			이메일(name="email")<input type="email" name="j_username" value="abc@abc.com" /><br />
			비밀번호(name="password")<input type="password" name="j_password" value="1004" /><br />
		</fieldset>
		<input type="submit" value="Login" />
	</form>
</body>
</html>