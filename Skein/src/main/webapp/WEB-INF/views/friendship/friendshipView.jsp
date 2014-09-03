<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<se:authentication property="name" var="LoginUser" />
<section class="content-container">
	<div class="friendship-content-wrapper">
		<div class="informbox photo">
			<div class="informbox_header">
				<!-- 정보헤더 -->
				<img src="${pageContext.request.contextPath}/resources/media/image/friends_img.png">친구
			</div>
			<c:choose>
				<c:when test="${friendshipList.size() > 0}">
					<div class="informbox_content">
						<!-- 정보컨텐츠 -->
						<div class="clearfix">
							<div id="friendlist">
								<c:forEach var="friendshipList" items="${friendshipList}">
									<c:set var="address" value=""></c:set>
									<c:set var="profileImageFileName" value=""></c:set>
									<c:set var="publicEmail" value=""></c:set>
									<c:set var="phoneNumber" value=""></c:set>
									<c:set var="stateMessage" value=""></c:set>
									<c:set var="religion" value=""></c:set>
									<c:set var="politics" value=""></c:set>
									<c:set var="language" value=""></c:set>
									<c:set var="blog" value=""></c:set>
									<c:set var="birthDay" value=""></c:set>
		
									<div class="friend-item-container">
										<div class="friend-image-wrapper">
											<!-- 1 사는곳 2 프로필 사진 3 공개이메일 4 휴대폰번호 5 상태글 6종교 7정치성향 8 언어 9 블로그 10 생일 -->
											<c:forEach var="profileList"
												items="${friendshipList.memberProfileList}">
												<c:choose>
													<c:when test="${profileList.profileCode == 1}">
														<c:set var="address" value="${profileList}"></c:set>
													</c:when>
													<c:when test="${profileList.profileCode == 2}">
														<c:set var="profileImageFileName" value="${profileList}"></c:set>
													</c:when>
													<c:when test="${profileList.profileCode == 3}">
														<c:set var="publicEmail" value="${profileList}"></c:set>
													</c:when>
													<c:when test="${profileList.profileCode == 4}">
														<c:set var="phoneNumber" value="${profileList}"></c:set>
													</c:when>
													<c:when test="${profileList.profileCode == 5}">
														<c:set var="stateMessage" value="${profileList}"></c:set>
													</c:when>
													<c:when test="${profileList.profileCode == 6}">
														<c:set var="religion" value="${profileList}"></c:set>
													</c:when>
													<c:when test="${profileList.profileCode == 7}">
														<c:set var="politics" value="${profileList}"></c:set>
													</c:when>
													<c:when test="${profileList.profileCode == 8}">
														<c:set var="language" value="${profileList}"></c:set>
													</c:when>
													<c:when test="${profileList.profileCode == 9}">
														<c:set var="blog" value="${profileList}"></c:set>
													</c:when>
													<c:when test="${profileList.profileCode == 10}">
														<c:set var="birthDay" value="${profileList}"></c:set>
													</c:when>
												</c:choose>
											</c:forEach>
		
		
											<c:choose>
												<c:when test="${profileImageFileName != ''}">
													<img class=""
														src="${pageContext.request.contextPath}/resources/user-profile-image/${profileImageFileName.profileInfo}">
												</c:when>
												<c:otherwise>
													<img class=""
														src="${pageContext.request.contextPath}/resources/user-profile-image/default-profile-image.png">
												</c:otherwise>
											</c:choose>
										</div>
										<div class="friend-item-info-container">
											<div class="friend-info-wrapper">
												<div>
													<p class="friendName">
														<a
															href="${pageContext.request.contextPath}/${friendshipList.personalURI}">${friendshipList.fullName}</a>(${friendshipList.personalURI })
													</p>
												</div>
		
												<c:if test="${publicEmail != ''}">
													<c:if test="${publicEmail.publicLevelCode > 1}">
														<div>
															<p>${publicEmail.profileInfo}</p>
														</div>
													</c:if>
												</c:if>
		
												<c:if test="${address != ''}">
													<c:if test="${address.publicLevelCode > 1}">
														<div>
															<p>${address.profileInfo}</p>
														</div>
													</c:if>
												</c:if>
		
												<c:if test="${phoneNumber != ''}">
													<c:if test="${phoneNumber.publicLevelCode > 1}">
														<div>
															<p>${phoneNumber.profileInfo}</p>
														</div>
													</c:if>
												</c:if>
		
											</div>
										</div>
										<div class="unfriend-button" data-uri="${friendshipList.personalURI}" data-name="${friendshipList.fullName}">
											<img title="친구끊기" class="unfriendImg" src="${pageContext.request.contextPath}/resources/media/image/unfriendImg2.png" />
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="nofriend_content">
						당신의 친구를 검색해서 친구를 신청해 보세요
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</section>
<script src="${pageContext.request.contextPath}/resources/js/friendship.js"></script>