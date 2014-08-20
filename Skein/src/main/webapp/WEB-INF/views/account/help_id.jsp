<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="wrap_wrap">
	<div class="form_wrap">
		<form id="helpId" action="id" method="post">
			<div class="help_subject_container">
				<b>계정 찾기</b> <font class="subject_sub">계정명(e-mail) 힌트제공</font>
			</div>
			<div class="help_container">	
				<div class="help_search_con" id="help_search">
					<table style="text-align:left;">
						<tr><td style="text-align:right;">이름 : </td><td><input id="helpIdName" type="text" name="fullName" ></td></tr>
						<tr><td style="text-align:right;">생년월일 : </td><td><input id="helpIdBirthday" type="date" name="birthday" ></td></tr>
					</table>
				</div>
			</div>
			<div class="button_container">
				<input id="helpIdBtn" type="button" value="검색" class="submitBtn">
				<input type="button" value="취소" class="resetBtn" onclick="location.href='../' ">
			</div>
		</form>
	</div>
	
	<div class="form_wrap">
		<form id="helpPwd" action="pwd" method="post">
			<div class="help_subject_container">
				<b>비밀번호 찾기</b>
			</div>
			<div class="help_container">	
				<div class="help_search_con">
					<table style="text-align:left;">
						<tr><td style="text-align:right;">계정(e-mail) : </td><td><input id="helpPwdEmail" type="email" name="email" ></td></tr>
						<tr><td style="text-align:right;">이름 : </td><td><input id="helpPwdName" type="text" name="fullName" ></td></tr>
						<tr><td style="text-align:right;">생년월일 : </td><td><input id="helpPwdBirthday" type="date" name="birthday" ></td></tr>
					</table>
				</div>
			</div>
			<div class="button_container">
				<input id="helpPwdBtn" type="button" value="검색" class="submitBtn">
				<input type="button" value="취소" class="resetBtn" onclick="location.href='../' ">
			</div>
		</form>
	</div>
	
	<div id="search_result" >
	<input type="hidden" value="${noResult }" id="noResult">
	<input type="hidden" value="${noResultPwd }" id="noResultPwd">
	<input type="hidden" value="${emails.size() }" id="emails">
	<input type="hidden" value="${email }" id="email">
	<input type="hidden" value="${result }" id="result">
	
		<c:if test="${noResult == 'y' }">
			검색 결과가 없습니다.<br>
			<a href="javascript:history.back()">돌아가기</a>
		</c:if>
		<c:if test="${!empty emails  }">
			email 목록<br>
			<c:forEach items="${emails}" var="email">
				${email }<br>
			</c:forEach>
			<a href="javascript:history.back()">돌아가기</a>
		</c:if>
		
		<c:if test="${noResultPwd == 'y' }">
			검색 결과가 없습니다.<br>
			<a href="javascript:history.back()">돌아가기</a>
		</c:if>
		<c:if test="${!empty email  }">
			[email]  ${email } 로 임시 비밀번호를 전송하시겠습니까?
			<div class="button_container">
			<form action="pwdUpdate" method="post">
			<input type="hidden" name="email" value="${email }">
				<input type="submit" value="확인" class="submitBtn">
				<input type="button" value="취소" class="resetBtn" onclick="location='refind'">
			</form>
			</div>
		</c:if>
		
		<c:if test="${!empty result  }">
			임시비밀번호가 전송되었습니다.<br>
			<a href="javascript:history.back()">돌아가기</a>
		</c:if>
	</div>
	
	
</div>
	
</body>
</html>