<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="YYYY년MM월dd일" var="today" />

<!-- 왼쪽 사용자 개인정보  -->
<div id="subUserProfileContainer">
	<div id="infomember">
		<div class="sub-user-profile-tip ${sessionScope.BASE_MEMBER_INFO.colorTheme}"></div>
		<div class="sub-user-profile-wrapper">
			<div class="sub-user-profile-image-container">
				<c:choose>
					<c:when test="${sessionScope.BASE_MEMBER_INFO.profileImageFileName == null}">
						<img src="${pageContext.request.contextPath}/resources/user-profile-image/default-profile-image.png" />
					</c:when>
					<c:otherwise>
						<img src="${pageContext.request.contextPath}/resources/user-profile-image/${sessionScope.BASE_MEMBER_INFO.profileImageFileName}" />
					</c:otherwise>
				</c:choose>
			</div>
			<div class="sub-user-profile-name">
				<a href="${pageContext.request.contextPath}/${sessionScope.BASE_MEMBER_INFO.personalURI}">${sessionScope.BASE_MEMBER_INFO.fullName}</a>
			</div>
			
			<div class="sub-user-proifle-info">
				<p>${sessionScope.BASE_MEMBER_INFO.email}</p>
				<div class="sub-user-profile-birthday">								
					<fmt:formatDate value="${sessionScope.BASE_MEMBER_INFO.birthday}" type="date" pattern="YYYY년MM월dd일"/>
					<c:if test="${sessionScope.BASE_MEMBER_INFO.birthday == toDay}">
						<img src="${pageContext.request.contextPath}/resources/media/image/birthday.jpg" style="width: 30px;height: 30px;"/>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	
	<!--******************************날씨 정보******************************   -->
        <div class="weather-info-container">
        	<div id="whatweather">
        		<div id="observinfo"></div>
        		<div id="locationinfo"></div>
        	</div>
	</div>
	<!--********************************************************************** -->
</div>
