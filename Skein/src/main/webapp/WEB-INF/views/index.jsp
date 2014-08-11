<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">

#header {
background-color:#7F6C62;
height: 100px;
width: 100%;
margin: auto;
}
#Sil{
float:left;
padding-top:10px;
padding-left:100px;
color: #fff;
font-size: 80px;
margin: auto;
}

#login{
float:right;
padding-top:20px;
padding-right:50px;
color: #fff;
margin: auto;
}
#content{
width:100%;
height:100%;
background-color:#e9eaed;
clear: both;
margin: auto;
}

#header a:LINK {color: #fff;text-decoration: none;}
#header a:visited {color: #fff;text-decoration: none;} 
#header a:hover {color: #fff;text-decoration: none;}
#header a:active { color: #fff;text-decoration: none;}  



</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<div id="header" >
<div style="width: 960px; margin: auto;"align="center">
<div id="Sil"><a href="index.jsp">Sil</a> </div>
<div id="login">
<table>
<tr>	<td>
<form action="${pageContext.request.contextPath}/j_spring_security_check" method="post">
			이메일:<input type="text" name="j_username" />
			비밀번호:<input type="password" name="j_password" />
		<input type="submit" value="Login" />
	</form></td></tr>
<tr><td style="float: right; margin-right: 140px;">
<div>
	<a href="${pageContext.request.contextPath}/joinus/refind">계정찾기</a>
</div>

</td></tr>
</table>
</div>
</div>
</div>
<body>

<div id="content" >
<div align="center">
<table style="width: 960px;">
<tr><td ></td><td style="float:right;padding-right:50px;"><h1>가입하기</h1><br>
<h3>회원가입</h3>
<div>
	<form action="${pageContext.request.contextPath}/joinus/registerMember" method="post">	 
	<fieldset>
		<legend>기본 계정 정보</legend>
		이메일:<input type="text" name="email" value="abc@abc.com" /><br />
		비밀번호:<input type="password" name="password" value="1004" /><br />
	</fieldset>
	
	<fieldset>
		<legend>기본 사용자 정보</legend>
		성:<input type="text" name="lastName" value="Chang" /><br />
		이름:<input type="text" name="firstName" value="Sungsil" /><br />
	</fieldset>
	
	<fieldset>
		<legend>생년월일</legend>
		년:<input type="text" name="year" value="1985" /><br />
		월:
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
		년:<input type="text" name="date" value="20" /><br />
	</fieldset>
	<%-- <fieldset>
		<legend>자동가입방지</legend>
	<%
	ReCaptcha c = ReCaptchaFactory.newReCaptcha("6LedCfgSAAAAANXE1N6vs_WLC0otH2jJkc4cXida", "6LedCfgSAAAAAKFaVC8NM209qL-CFiOWd0C7ICXV", false);
	out.print(c.createRecaptchaHtml(null, null));
	%>
	</fieldset> --%>
	<input type="submit" value="Reg">
	</form>
</div>
</td>
</tr>
</table>
</div>
</div>

<div id="footer" >
<table style="width: 960px;">
</table>
</div>
</body>
</html>




















