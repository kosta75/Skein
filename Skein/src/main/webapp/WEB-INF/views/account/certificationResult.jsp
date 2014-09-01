<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

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
 


<section class="content-container">
<div class="login-error-message">



<c:choose>
	<c:when test="${certificationResult==1}">
		<div class="full_wrap">
			<div class="help_subject_container">
				<b>계정 인증 결과</b>
			</div>
			<div class="help_container">
				<div class="fail_login">
					<div class="help_fail">계정 등록 승인</div>
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
				<b>계정 인증 결과</b>
			</div>
			<div class="help_container">
				<div class="fail_login">
					<div class="help_fail">계정 휴면 해제 승인 </div>
					<div>
						<p>계정 휴면 해제 승인 되었습니다 </p>
					
					
					<strong class="reg_link"><a href="${pageContext.request.contextPath}/">로그인하기</a></strong>
					</div>
				</div>
				
			</div>
		</div>
	</c:when>
	
	<c:when test="${certificationResult==3}">
		<div class="full_wrap">
			<div class="help_subject_container">
				<b>계정 인증 결과</b>
			</div>
			<div class="help_container">
				<div class="fail_login">
					<div class="help_fail"> 계정 재등록 승인</div>
					<div>
						<p>계정 재등록이 승인되었습니다 </p>
				<strong class="reg_link"><a href="${pageContext.request.contextPath}/">로그인하기</a></strong>
						</div>
				</div>
				
			</div>
		</div>
	</c:when>
	
	<c:when test="${certificationResult==11}">
		<div class="full_wrap">
			<div class="help_subject_container">
				<b>계정 승인 결과</b>
			</div>
			<div class="help_container">
				<div class="fail_login">
					<div class="help_fail">이미 승인 된 계정</div>
					<div>
						<p>해당 계정은 이미 메인 인증이 완료된 계정입니다.</p>
						<se:authorize ifNotGranted="ROLE_USER">
							<strong class="reg_link"><a href="${pageContext.request.contextPath}/">로그인하기</a></strong>
						</se:authorize>
					</div>
				</div>
				
			</div>
		</div>
	</c:when>
	
	<c:when test="${certificationResult==88}">
		<div class="full_wrap">
			<div class="help_subject_container">
				<b>계정 승인 요청 결과</b>
			</div>
			<div class="help_container">
				<div class="fail_login">
					<div class="help_fail">영구 정지 계정</div>
					<div>
						<p>해당 계정은 사용자의 요청 또는 서비스 운영자의 결정에 의해 영구적으로 정지된 계정입니다.<br />
					</div>
				</div>
				
			</div>
		</div>
	</c:when>

	<c:otherwise>
		<div class="full_wrap">
			<div class="help_subject_container">
				<b>계정 승인 요청 결과</b>
			</div>
			<div class="help_container">
				<div class="fail_login">
					<div class="help_fail">잘못된 인증 요청</div>
					<div>
						<p>잘못된 인증요청입니다. 다시 한번 확인해 주세요<br />
					</div>
				</div>
				
			</div>
		</div>
	</c:otherwise>
</c:choose>
</div>

</section>
