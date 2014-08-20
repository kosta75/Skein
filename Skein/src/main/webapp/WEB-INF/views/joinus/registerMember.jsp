<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="content-container">
<div>
<table style="width: 960px;">
	<tr>
		<td></td>
		<td style="float: right; padding-right: 50px;"><h1>가입하기</h1>
			<br>
			<h3>회원가입</h3>
			<div id="memberRegistryForm">
				<form action="${pageContext.request.contextPath}/joinus/registerMember" method="post">	 
				<fieldset>
					<legend>기본 계정 정보</legend>
					이메일(name="email")<input type="email" name="email" /><br />
					비밀번호(name="password")<input type="password" name="password" /><br />
				</fieldset>
				
				<fieldset>
					<legend>기본 사용자 정보</legend>
					성(name="lastName")<input type="text" name="lastName" /><br />
					이름(name="firstName")<input type="text" name="firstName" /><br />
				</fieldset>
				
				<fieldset>
					<legend>생년월일</legend>
					<input type="date" name="birthday" />
				</fieldset>
			
				<input type="submit" value="Reg">
				</form>
			</div>
		</td>
	</tr>
</table>
</div>
</section>