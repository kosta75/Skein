<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<se:authentication property="name" var="LoginUser" />
<section class="content-container">
	<div class="friendship-content-wrapper">
		<div id="friendlist">
		<c:forEach var="friendshipList" items="${friendshipList}">
			<div class="friend-item-container">
				<div class="friend-image-wrapper">
					<c:choose>
						<c:when test="${friendshipList.profileImageFileName == null}">
							<img class="" src="${pageContext.request.contextPath}/resources/user-profile-image/default-profile-image.png">
						</c:when>
						<c:otherwise>
							<img class="" src="${pageContext.request.contextPath}/resources/user-profile-image/${friendshipList.profileImageFileName}">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="friend-item-info-container">
					<div class="friend-info-wrapper">
						<div>
							<p><a href="${pageContext.request.contextPath}/${friendshipList.personaluri}">${friendshipList.fullname}</a></p>
						</div>
						
						<c:if test="${friendshipList.publicEmail != null}">
						<c:if test="${friendshipList.publicLevelCodeToEmail != null && friendshipList.publicLevelCodeToEmail > 1}">
						<div>
							<p>${friendshipList.email}</p>
						</div>
						</c:if>	
						</c:if>
												
					</div>		
				</div>
				<div class="unfriend-button" data-uri="${friendshipList.personaluri}" data-name="${list.fullname}"></div>
			</div>  
		</c:forEach>
		</div>
	</div>
</section>
<script src="${pageContext.request.contextPath}/resources/js/friendship.js"></script>