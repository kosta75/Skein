<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<h3>회원가입</h3>
<div>
	<form action="${pageContext.request.contextPath}/joinus/registerMember" method="post">	 
	<fieldset>
		<legend>기본 계정 정보</legend>
		이메일(name="email")<input type="email" name="email" value="abc@abc.com" /><br />
		비밀번호(name="password")<input type="password" name="password" value="1004" /><br />
	</fieldset>
	
	<fieldset>
		<legend>기본 사용자 정보</legend>
		성(name="lastName")<input type="text" name="lastName" value="Chang" /><br />
		이름(name="firstName")<input type="text" name="firstName" value="Sungsil" /><br />
	</fieldset>
	
	<fieldset>
		<legend>생년월일</legend>
		년(type="text", name="year")<input type="text" name="year" value="1985" /><br />
		월(name="month")
		<select name="month">
			<option value="1" selected="selected">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
		</select>
		<br />
		년(type="text", name="date")<input type="text" name="date" value="20" /><br />
	</fieldset>
	<fieldset>
		<legend>자동가입방지</legend>
	<%
	ReCaptcha c = ReCaptchaFactory.newReCaptcha("6LedCfgSAAAAANXE1N6vs_WLC0otH2jJkc4cXida", "6LedCfgSAAAAAKFaVC8NM209qL-CFiOWd0C7ICXV", false);
	out.print(c.createRecaptchaHtml(null, null));
	%>
	</fieldset>
	<input type="submit" value="Reg">
	</form>
</div>
<hr />
<br />
<h3>로그인</h3>
<div>
	<form action="${pageContext.request.contextPath}/j_spring_security_check" method="post">
		<fieldset>
			<legend>로그인 정보</legend>
			이메일(name="email")<input type="email" name="j_username" value="abc@abc.com" /><br />
			비밀번호(name="password")<input type="password" name="j_password" value="1004" /><br />
		</fieldset>
		<input type="submit" value="Login" />
	</form>
</div>
<hr />
<br />
<h3>아이디/비밀번호 찾기</h3>
<div>
	<a href="${pageContext.request.contextPath}/joinus/refind"></a>
</div>