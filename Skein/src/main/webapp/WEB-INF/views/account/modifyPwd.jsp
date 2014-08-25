<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="content-container">

	<div class="full_wrap">
		<div class="help_subject_container">
			<b>비밀번호 변경</b>
		</div>
		<div class="help_container">
			<div class="fail_login">
				<table style="border: 1px; text-align:center;">
					<tr>
						<td>현재 비밀번호</td>
						<td><input type="password" name="currentpwd" id="password" /></td>
						<td></td>
					</tr>
					<tr>
						<td>새 비밀번호</td>
						<td><input type="password" name="newpwd" id="password" /></td>
						<td></td>
					</tr>
					<tr>
						<td>새 비밀번호 확인</td>
						<td><input type="password" name="checkpwd" id="password" /></td>
						<td></td>
					</tr>
				</table>
			</div>
			<div id="buttons">
				<input type="button" id="modifyBtn" name="modifyBtn" value="변경">
				<input type="button" id="resetBtn" value="취소">
			</div>
		</div>
	</div>

</section>

<script src="${pageContext.request.contextPath}/resources/js/modifyPwd.js"></script>