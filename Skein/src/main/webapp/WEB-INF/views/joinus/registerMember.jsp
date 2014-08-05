<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post">
이메일(name="email")<input type="email" name="email" value="abc@abc.com" /><br />
성(name="lastName")<input type="text" name="lastName" value="Chang" /><br />
이름(name="firstName")<input type="text" name="firstName" value="Sungsil" /><br />
비밀번호(name="password")<input type="password" name="password" value="1004" /><br />
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
<input type="submit" value="Reg">
</form>
</body>
</html>