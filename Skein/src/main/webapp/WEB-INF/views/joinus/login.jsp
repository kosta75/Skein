<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="content-container">
<div class="login-error-message">

<!--
ERROR_CODE
51 : 존재하지 않는 아이디
52 : 틀린 비밀번호
53 : 인증 되지 않은 계정
99 : 알 수 없는 에러
 -->
<c:choose>
	<c:when test="${LOGIN_ERROR_CODE == 51}">
		존재하지 않는 아이디 입니다.
	</c:when>
	<c:when test="${LOGIN_ERROR_CODE == 52}">
		비밀번호가 틀렸습니다.
	</c:when>
	<c:when test="${LOGIN_ERROR_CODE == 53}">
		<p>인증되지 않은 계정입니다. 이메일 인증 과정을 마무리해주세요.</p>
		<p>계정인증코드를 받지 못하셨으면 링크를 클릭하여 인증 메일을 다시 보내실 수 있습니다.<a href="${pageContext.request.contextPath}/${personalURI}/account/certification/mailsend">인증메일</a></p>
		${param.email} <br />
		${personalURI}
	</c:when>
	<c:otherwise>
	</c:otherwise>
</c:choose>
</div>
</section>