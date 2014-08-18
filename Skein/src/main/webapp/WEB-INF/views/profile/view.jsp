<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
이 페이지로 오나요?<br />
${memberProfile.fullName} <br />

<c:forEach var="profiles" items="${memberProfile.profiles}">
	${profiles.profileName} : ${profiles.profileInfo} <br />
</c:forEach>
