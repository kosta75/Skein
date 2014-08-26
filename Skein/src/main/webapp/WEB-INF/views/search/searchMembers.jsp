<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<se:authentication property="name" var="LoginUser" />
<section class="content-container">
	<div class="search-content-wrapper">
		
			<c:forEach var="list" items="${list}">
				<div class="search-detail-info" >
					
						<div>
							<c:if test="${list.profileInfo == null}">
								<img class="s-d-i-image" src="${pageContext.request.contextPath}/resources/media/image/default.jpg" >
							</c:if>
							<c:if test="">
							 	<img class="s-d-i-image" src="${pageContext.request.contextPath}/resources/media/image/${list.profileInfo}.jpg" >
							 </c:if> 
							<p>
							${list.profileInfo}
								<a href="${pageContext.request.contextPath}/${list.personalURI}">${list.fullName}</a>(${list.personalURI})
							</p>
							<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
								<c:choose>
									<c:when test="${list.isFriend != 1}">
										<span class="addFriends" data-uri="${list.personalURI}">친구신청</span>
									</c:when>
									<c:otherwise>
										<span>Text</span>
									</c:otherwise>
								</c:choose>
							</se:authorize>
						</div>
					
				</div>
			</c:forEach>
		
	</div>
</section>
<script src="${pageContext.request.contextPath}/resources/js/search.js"></script>