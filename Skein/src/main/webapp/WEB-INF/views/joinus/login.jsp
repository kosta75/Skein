<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="content-container">
${LOGIN_ERROR_CODE}
<div class="login-error-message">

<!--
ERROR_CODE
51 : 존재하지 않는 아이디
52 : 틀린 비밀번호
53 : 인증 되지 않은 계정
88 : 보안 문자 틀림
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
					<a href="${pageContext.request.contextPath}/account/refind"  class="reset_link">로그인	정보를 잊으셨나요?</a>
				</div>
			</div>
		</div>
	</c:when>
	<c:when test="${LOGIN_ERROR_CODE == 52 || LOGIN_ERROR_CODE == 88}">
		<div class="full_wrap">
			<div class="help_subject_container">
				<b>로그인 실패</b>
			</div>
			<div class="help_container">
			
				<c:if test="${failedPasswordAttempCount > 5}">
				<div id="reCaptcha">
				<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
    			<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
					비밀번호가 5회 이상 틀렸습니다.
					<%
         			ReCaptcha c = ReCaptchaFactory.newReCaptcha("6LedCfgSAAAAANXE1N6vs_WLC0otH2jJkc4cXida", "6LedCfgSAAAAAKFaVC8NM209qL-CFiOWd0C7ICXV", false);
          			out.print(c.createRecaptchaHtml(null, null));
        			%>
				</div>
				<script>
				$("#loginForm").submit(function(){
					var parent_element = '';

					// 기존 form에 element를 그대로 clone

					$.each($(this).serializeArray(), function (idx, obj){
					    parent_element += "<input type='hidden' name='" + obj.name + "' value='" + obj.value +"' />";
					});
					console.log("첫번째 확인");
					alert(parent_element);

					// 신규 form을 만든다.  
					var new_form = document.createElement("form");
					        
					// 신규 form의 POST항목을 지정
					$(new_form).attr({
					    'action': 'security',
					    'method': 'POST'
					});

					// 신규 form에 element를 지정
					parent_element += "<input type='hidden' name='recaptcha_response_field' value='" + $("#recaptcha_response_field").val() +"' />";
					parent_element += "<input type='hidden' name='recaptcha_challenge_field' value='" + $("#recaptcha_challenge_field").val() +"' />";
					console.log("두번째 확인"); 
					alert(parent_element);
					$(new_form).append(parent_element);

					// 신규 form으로 POST
					document.body.appendChild(new_form);
					new_form.submit(function(){
						return false;
					});
					document.body.removeChild(new_form);
					return false;
				});
				</script>
				</c:if>
				<div class="fail_login">
					<c:choose>
						<c:when test="${LOGIN_ERROR_CODE == 88}">
						<div class="help_fail">잘못된 보안 문자.</div>
						<div>
							<p>입력하신 보안문자는 올바르지 않습니다.<br />
							다시 시도해 주세요(Caps Lock 키가 꺼져있는지 확인하세요)</p>
						</div>
						</c:when>
						<c:otherwise>
						<div class="help_fail">잘못된 비밀번호</div>
						<div>
							<p>입력하신 비밀번호는 올바르지 않습니다.<br />
							다시 시도해 주세요(Caps Lock 키가 꺼져있는지 확인하세요)</p>
						</div>
						</c:otherwise>
					</c:choose>
					
				</div>
				
				<div id="buttons">
					<strong class="reg_link"><a href="${pageContext.request.contextPath}/">Sil에 가입하기</a></strong>
					<a href="${pageContext.request.contextPath}/account/refind"  class="reset_link">로그인	정보를 잊으셨나요?</a>
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