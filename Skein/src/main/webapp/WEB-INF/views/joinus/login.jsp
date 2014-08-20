<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.full_wrap {
	margin: 50px auto;
	width: 640px;
	-webkit-border-radius: 4px;
	border: 1px solid #ccc;
	font-size: 13px;
}

.help_subject_container{
	border-bottom: 1px solid #aaa;
	margin: 0 20px;
	padding-top: 20px;
	padding-bottom: 5px;
	font-size: 23px;
	vertical-align: bottom;
}

.help_container{
	margin: 15px 20px;
}
.help_container #buttons{
	text-align: center;
}

.fail_login{
	background-color: #F0F6FC;
	border: 1px solid #dd3c10;
	padding: 10px;
	margin-bottom:20px;
}

.help_fail{
	padding-bottom: 10px;
	font-size: 15px;
	font-weight: bold;
}

.reg_link, .reset_link{
	padding: 5px 10px;
}

</style>

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
		<div class="full_wrap">
			<div class="help_subject_container">
				<b>로그인 실패</b>
			</div>
			<div class="help_container">
				<div class="fail_login">
					<div class="help_fail">잘못된 이메일</div>
					<div>
						<p>입력된 이메일이 어느 계정에도 속해 있지 않습니다.</p>
					</div>
				</div>
				<div id="buttons">
					<strong class="reg_link"><a href="${pageContext.request.contextPath}/">Sil에 가입하기</a></strong>
					<a href="${pageContext.request.contextPath}/joinus/refind"  class="reset_link">로그인	정보를 잊으셨나요?</a>
				</div>
			</div>
		</div>
	</c:when>
	<c:when test="${LOGIN_ERROR_CODE == 52}">
		비밀번호가 틀렸습니다.
		<div class="full_wrap">
			<div class="help_subject_container">
				<b>로그인 실패</b>
			</div>
			<div class="help_container">
				<div class="fail_login">
					<div class="help_fail">잘못된 비밀번호</div>
					<div>
						<p>입력하신 비밀번호는 올바르지 않습니다.<br />
						다시 시도해 주세요(Caps Lock 키가 꺼져있는지 확인하세요)</p>
					</div>
				</div>
				<div id="buttons">
					<strong class="reg_link"><a href="${pageContext.request.contextPath}/">Sil에 가입하기</a></strong>
					<a href="${pageContext.request.contextPath}/joinus/refind"  class="reset_link">로그인	정보를 잊으셨나요?</a>
				</div>
			</div>
		</div>
	</c:when>
	<c:when test="${LOGIN_ERROR_CODE == 53}">
		<div class="full_wrap">
			<div class="help_subject_container">
				<b>로그인 실패</b>
			</div>
			<div class="help_container">
				<div class="fail_login">
					<div class="help_fail">인증 미완료</div>
					<div>
						<p>해당 계정은 아직 메일 인증이 완료되지 않았습니다.<br />
						해당 계정에서 가입 인증 메일을 확인하시고, 메일에 적힌 주소로 접속해주세요.</p>
						<p>계정인증코드를 받지 못하셨으면 링크를 클릭하여 인증 메일을 다시 보내실 수 있습니다.
						<a href="${pageContext.request.contextPath}/${personalURI}/account/certification/mailsend">인증메일</a>
					</div>
				</div>
				<!-- <div id="buttons">
					<strong class="reg_link"><a href="#">Sil에 가입하기</a></strong>
					<a href="#"  class="reset_link">로그인	정보를 잊으셨나요?</a>
				</div> -->
			</div>
		</div>
		<%-- <p>인증되지 않은 계정입니다. 이메일 인증 과정을 마무리해주세요.</p>
		<p>계정인증코드를 받지 못하셨으면 링크를 클릭하여 인증 메일을 다시 보내실 수 있습니다.<a href="${pageContext.request.contextPath}/${personalURI}/account/certification/mailsend">인증메일</a></p>
		${param.email} <br />
		${personalURI} --%>
	</c:when>
	<c:otherwise>
	</c:otherwise>
</c:choose>
</div>

</section>