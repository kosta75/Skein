<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="http://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>
  <script type="text/javascript">
    function showRecaptcha(element) {
      Recaptcha.create("6LedCfgSAAAAANXE1N6vs_WLC0otH2jJkc4cXida", element, {
        theme: "red",
        callback: Recaptcha.focus_response_field
      });
    }
    
    $(document).ready(function(){
    	$("#regForm").on('submit', function(){
    		showRecaptcha('recaptcha_div');
    		return false;
    	});
    	
    });
  </script>
<div>
	<form id="regForm" action="joinus/registerMember" method="post">	 
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
		<script type="text/javascript" src="http://www.google.com/recaptcha/api/challenge?k=6LedCfgSAAAAANXE1N6vs_WLC0otH2jJkc4cXida"></script>
		<div id="recaptcha_div"></div>
		<noscript>
		  <iframe src="http://www.google.com/recaptcha/api/noscript?k=6LedCfgSAAAAANXE1N6vs_WLC0otH2jJkc4cXida" height="300" width="500" frameborder="0"></iframe><br>
		  <textarea name="recaptcha_challenge_field" rows="3" cols="40"></textarea>
			<input type="hidden" name="recaptcha_response_field" value="manual_challenge">
			<%-- <%
			ReCaptcha c = ReCaptchaFactory.newReCaptcha("6LedCfgSAAAAANXE1N6vs_WLC0otH2jJkc4cXida", "6LedCfgSAAAAAKFaVC8NM209qL-CFiOWd0C7ICXV", false);
			out.print(c.createRecaptchaHtml(null, null));
			%> --%>
		</noscript>
	
	</fieldset>
	
	<input type="submit" value="Reg">
	</form>
</div>