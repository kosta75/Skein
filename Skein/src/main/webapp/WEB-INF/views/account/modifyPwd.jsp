
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<section class="modify-content-container">
<script src="${pageContext.request.contextPath}/resources/js/modifyPwd.js"></script>
	<div class="full_wrap">
		<div class="help_subject_container">
			<b>비밀번호 변경</b>
		</div>
		<div class="help_container">
			<div class="fail_login"><input type="hidden" id="modifyformEmail" value="${sessionScope.BASE_MEMBER_INFO.email }">
			
				<table class="pwdmodifytb">
					<tr>
						<td>현재 비밀번호</td>
						<td class="inputblock"><input type="password" name="password" id="currentpwd" /></td>
						<td id="currentpwdblock" class="alertblock"></td>
					</tr>
					<tr>
						<td>새 비밀번호</td>
						<td class="inputblock"><input type="password" name="newpwd" id="newpwd" /></td>
						<td id="newpwdblock" class="alertblock"></td>
					</tr>
					<tr>
						<td>새 비밀번호 확인</td>
						<td class="inputblock"><input type="password" name="checkpwd" id="checkpwd" /></td>
						<td id="checkpwdblock" class="alertblock"></td>
					</tr>
				</table>
			</div>
			<div class="buttonsPwd">
				<input type="button" id="modifyBtnPwd" name="modifyBtn" value="변경">
				<input type="button" id="resetBtnPwd" value="취소">
			</div>
		</div>
	</div>
</section>


