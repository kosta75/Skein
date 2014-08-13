<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
결과 값 : ${certificationResult}
<c:if test="${member != null}">
	${member.email}<br />
	${member.fullName}<br />
	${member.isApproved}<br />
</c:if>
</body>
</html>