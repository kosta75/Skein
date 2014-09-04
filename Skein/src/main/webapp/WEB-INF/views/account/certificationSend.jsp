<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="login-error-message">
		<div class="full_wrap">
			<div class="help_subject_container">
				<b>계정인증 메일 전송</b>
			</div>
			<div class="help_container">
				<div class="fail_login">
					<div class="help_fail">인증 메일을 보냈습니다.</div>
				</div>
				<div id="buttons">
					<strong class="reg_link">3초 후 메인페이지로 이동합니다.</strong>
					<script>
						$(document).ready(function(){
							getContextPath();
							setTimeout(function(){location.href=getContextPath()}, 3000)
						});
					</script>
				</div>
			</div>
		</div>

</div>