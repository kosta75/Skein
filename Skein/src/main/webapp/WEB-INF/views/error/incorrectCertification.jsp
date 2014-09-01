<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="content-container">
<div class="certification-error-message">
	<c:choose>
		<c:when test="${certificationResult==88}">
			폐쇄된 계정
		</c:when>
		<c:otherwise>
			잘못된 인증 요청
		</c:otherwise>
	</c:choose>
</div>
</section>
