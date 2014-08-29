<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section class="content-container">
	<XMP>
		<h1>Sil</h1>
	</XMP>
	<div id="Sil">
		<a href="${pageContext.request.contextPath}">Sil</a>
	</div>
	
	<div id="loginFormContainer">
		<form action="${pageContext.request.contextPath}/security/login"	method="post">
			<fieldset>
				<legend><label for="email">이메일</label></legend>
				<input type="text" id="email" name="email" />
			</fieldset>
			<fieldset>
				<legend><label for="password">비밀번호</label></legend>
				<input type="password" id="password" name="password" />
			</fieldset>
			<fieldset>
				<input id="loginBtn" type="submit" value="Login" />
			</fieldset>
			
		</form>
		<div>
			<a href="${pageContext.request.contextPath}/account/refind">계정찾기</a>
		</div>
	</div>
	
	
	<div id="memberJoinFormContainer">
		<div class="join-message">
			<span>Join</span>
		</div>
		<form action="${pageContext.request.contextPath}/joinus/registerMember" method="post">	 
			<fieldset>
				<legend class="text-hidden">기본 계정 정보</legend>
				<input type="email" id="email" name="email" placeholder="welcome@skein.com" required />
				<input type="password" id="password" name="password" placeholder="**********" required />
			</fieldset>
			
			<fieldset>
				<legend class="text-hidden">기본 사용자 정보</legend>
				<input type="text" name="lastName" placeholder="성" required />
				<input type="text" name="firstName" placeholder="이름" required />
			</fieldset>
			
			<fieldset>
				<legend class="birthday">생년월일</legend>
				<input type="date" id="birthday" name="birthday" required />
			</fieldset>
			<fieldset>
				<input type="submit" id="joinBtn" value="가입하기">
			</fieldset>
		</form>
	</div>
</section>

<!-- 푸터 없어도 됨 -->
<div id="footer">
	<table style="width: 960px;">
	</table>
</div>