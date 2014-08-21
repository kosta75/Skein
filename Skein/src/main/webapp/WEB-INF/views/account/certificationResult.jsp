<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--
certificationResult
1 : 계정 등록 승인
2 : 계정 휴면 해제 승인 
3 : 계정 재등록 승인
11 : 이미 승인된 계정
88 : 폐쇄된 계정 인증 요청 
90 : 잘못된 인증 요청
99 : 인증 실패 
 -->	
 
 <style type="text/css">
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



<c:choose>
	<c:when test="${certificationResult==1}">
		존재하지 않는 아이디 입니다.
		<div class="full_wrap">
			<div class="help_subject_container">
				<b>로그인 실패</b>
			</div>
			<div class="help_container">
				<div class="fail_login">
					<div class="help_fail"> 계정 등록 승인</div>
					<div>
						<p>계정 등록이 승인 되었습니다</p>
					</div>
				</div>
				<div id="buttons">
					<strong class="reg_link"><a href="${pageContext.request.contextPath}/">로그인하기</a></strong>
				</div>
			</div>
		</div>
	</c:when>
	<c:when test="${certificationResult==2}">
		<div class="full_wrap">
			<div class="help_subject_container">
				<b>로그인 실패</b>
			</div>
			<div class="help_container">
				<div class="fail_login">
					<div class="help_fail">계정 휴면 해제 승인 </div>
					<div>
						<p>계정 휴면 해제 승인 되었습니다 </p>
					
					
					<strong class="reg_link"><a href="${pageContext.request.contextPath}/">로그인하기</a></strong>
					</div>
				</div>
				>
			</div>
		</div>
	</c:when>
	<c:when test="${certificationResult==3}">
		<div class="full_wrap">
			<div class="help_subject_container">
				<b>로그인 실패</b>
			</div>
			<div class="help_container">
				<div class="fail_login">
					<div class="help_fail"> 계정 재등록 승인</div>
					<div>
						<p>계정 재등록이 승인되었습니다 </p>
				<strong class="reg_link"><a href="${pageContext.request.contextPath}/">로그인하기</a></strong>
						</div>
				</div>
				>
			</div>
		</div>
	</c:when>
	<c:when test="${certificationResult==11}">
		<div class="full_wrap">
			<div class="help_subject_container">
				<b>로그인 실패</b>
			</div>
			<div class="help_container">
				<div class="fail_login">
					<div class="help_fail">이미 승인된 계정</div>
					<div>
						<p>해당 계정은 아직 메일 인증이 완료되지 않았습니다.</p>
					<strong class="reg_link"><a href="${pageContext.request.contextPath}/">로그인하기</a></strong>
					</div>
				</div>
				>
			</div>
		</div>
	</c:when>
	<c:otherwise>
	</c:otherwise>
</c:choose>
</div>

</section>
 
 
</body>
</html>