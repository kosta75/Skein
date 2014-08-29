<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>

<section class="content-container">
	<div class="search-content-wrapper">
		
			<c:forEach var="friendshipList" items="${friendshipList}">
				<div class="search-detail-info" >
					
						<div>
							<c:choose>
								<c:when test="${friendshipList.profileInfo == null}">
									<img class="s-d-i-image" src="${pageContext.request.contextPath}/resources/user-profile-image/default-profile-image.png">
								</c:when>
								<c:otherwise>
									<img class="s-d-i-image" src="${pageContext.request.contextPath}/resources/user-profile-image/${friendshipList.profileInfo}">
								</c:otherwise>
							</c:choose> 
							<p>
							
								<a href="${pageContext.request.contextPath}/${friendshipList.personalURI}">${friendshipList.fullName}</a>(${friendshipList.personalURI})
							</p>
							<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
								<c:choose>
									<c:when test="${friendshipList.friendshipConfirm == 0}">
										<c:if test="${friendshipList.isFriend == 0}">
											<span class="wait-friendship" data-uri="${friendshipList.personalURI}">친구 수락 대기중</span>
										</c:if>
									</c:when>
									<c:when test="${friendshipList.friendshipConfirm == 1}">
										<c:if test="${friendshipList.isFriend == 1}">
											<span class="delete-friendship" data-uri="${friendshipList.personalURI}">친구끊기</span>
										</c:if>
									</c:when>
									<c:when test="${friendshipList.friendshipConfirm == 2}">
										<c:if test="${friendshipList.isFriend == 0}">
											<span><a href="${pageContext.request.contextPath}/notification/">친구 신청 알림 확인</a></span>
										</c:if>
									</c:when>
									<c:when test="${friendshipList.friendshipConfirm == 3}">
										<c:if test="${friendshipList.isFriend == 1}">
											<span><a href="${pageContext.request.contextPath}/notification/">친구 신청 알림 확인</a></span>
										</c:if>
									</c:when>
									<c:otherwise>
										<c:if test="${friendshipList.isFriend == 0}">
											<span class="add-friendship" data-uri="${friendshipList.personalURI}">친구신청</span>
										</c:if>
									</c:otherwise>
								</c:choose>
							</se:authorize>
						</div>
					
				</div>
			</c:forEach>
		
	</div>
</section>
<script src="${pageContext.request.contextPath}/resources/js/search.js"></script>