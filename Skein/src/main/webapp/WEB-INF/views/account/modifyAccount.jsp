<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>

<se:authentication property="name" var="LoginUser" />
<input type="hidden" name="email" id="AccountModifyEmail" value="${LoginUser }">
<input type="hidden" name="contextPath" value="${pageContext.request.contextPath }">

<section class="content-container">
	<div class="full_wrap">
		<div class="help_subject_container">
			<b>계정변경</b>
		</div>
		<c:if test="${check == 'domrant' }">
			<div class="help_container">
				<div class="fail_login">
					<div class="help_fail">휴면계정</div>
					<div>
						<p>
							휴면상태의 기간은 기본적으로 1개월입니다.<br />
							1개월 이내에 휴면상태를 풀지 못하고, 1개월 이후부터 휴면취소가 가능합니다.<br />
							휴면상태를 풀지 않을 시 계속 계정 상태를 유지하되 데이터는 삭제되지 않습니다.<br />
							<b>주의 : </b>비밀번호를 입력하고 신청하면 계정이 휴면상태로 변경됩니다.
						</p>
					</div>
				</div>
			</div>
			<div class="buttonsPwd">
				비밀번호 : <input type="password" name="password" id="modifyDomrantPwd">
				<input type="button" id="modifyDomrantBtn" name="modifyDomrantBtn" value="신청">
				<input type="button" id="resetAccountBtn" value="취소">
				<div class="alert"></div>
			</div>
			
		</c:if>
		<c:if test="${check == 'dropout' }">
			<div class="help_container">
				<div class="fail_login">
					<div class="help_fail">계정탈퇴</div>
					<div>
						<p>
							* 개인정보 삭제여부에 예(Y)를 체크하시면 사용자의 모든 데이터가 삭제되고, 아니오(N)를 체크하시면 6개월 동안 사용자의 데이터를 남겨둡니다.<br/>
							* 6개월의 유예 기간 내에 해당아이디로 가입할 시 남겨둔 데이터를 사용 또는 삭제하실 수 있습니다.<br/>
							<b>주의 : </b>비밀번호를 입력하고 신청하면 탈퇴가 완료됩니다.
						</p>
					</div>
				</div>
			</div>
			<div class="buttonsPwd">
				<table class="modifyInputdata">
				<tr><td colspan="2">비밀번호 : <input type="password" name="password" id="modifyDropoutPwd">&nbsp;&nbsp;<div class="alert"></div></td></tr>
				<tr>
					<td>개인정보 삭제여부 : <input type="checkbox" name="deletedata" value="1">예(Y)
					&nbsp;<input type="checkbox" name="deletedata" value="2">아니오(N)&nbsp;&nbsp;</td>
					<td>
						<input type="button" id="modifyDropoutBtn" name="modifyDropoutBtn" value="신청">
						<input type="button" id="resetAccountBtn" value="취소">
					</td></tr>
				</table>
			</div>
		</c:if>
		<c:if test="${check == 'lockout' }">
			<div class="help_container">
				<div class="fail_login">
					<div class="help_fail">계정폐쇄</div>
					<div>
						<p>
							* 계정폐쇄를 신청하시면 사용자의 모든 데이터를 삭제합니다.<br/>
							* 폐쇄된 이메일(아이디)로는 다시 가입하실 수 없습니다.<br/>
							<b>주의 : </b>비밀번호를 입력하고 신청하면 계정이 폐쇄됩니다.
						</p>
					</div>
				</div>
			</div>
			<div class="buttonsPwd">
				비밀번호 : <input type="password" name="password" id="modifyLockoutPwd">
				<input type="button" id="modifyLockoutBtn" name="modifyLockoutBtn" value="신청">
				<input type="button" id="resetAccountBtn" value="취소">
				<div class="alert"></div>
			</div>
		</c:if>
	</div>
</section>


<script
	src="${pageContext.request.contextPath}/resources/js/modifyAccount.js"></script>
