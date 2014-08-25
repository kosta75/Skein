<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<c:forEach var="profiles" items="${memberProfile.profiles}">
	<c:if test="${profiles.profileCode == 2 }">
		<c:set var="profileImage" value="${profiles.profileInfo}" />
		<c:set var="profileImagePublic" value="${profiles.publicLevelCode}" />
	</c:if>
	<c:if test="${profiles.profileCode == 5 }">
		<c:set var="statusComment" value="${profiles.profileInfo}" />
		<c:set var="statusCommentPublic" value="${profiles.publicLevelCode}" />
	</c:if>
	<c:if test="${profiles.profileCode == 3 }">
		<c:set var="openEmail" value="${profiles.profileInfo}" />
		<c:set var="openEmailPublic" value="${profiles.publicLevelCode}" />
	</c:if>
	<c:if test="${profiles.profileCode == 4 }">
		<c:set var="phoneNumber" value="${profiles.profileInfo}" />
		<c:set var="phoneNumberPublic" value="${profiles.publicLevelCode}" />
	</c:if>
	<c:if test="${profiles.profileCode == 9 }">
		<c:set var="blog" value="${profiles.profileInfo}" />
		<c:set var="blogPublic" value="${profiles.publicLevelCode}" />
	</c:if>
	<c:if test="${profiles.profileCode == 1 }">
		<c:set var="address" value="${profiles.profileInfo}" />
		<c:set var="addressPublic" value="${profiles.publicLevelCode}" />
	</c:if>
	<c:if test="${profiles.profileCode == 8 }">
		<c:set var="language" value="${profiles.profileInfo}" />
		<c:set var="languagePublic" value="${profiles.publicLevelCode}" />
	</c:if>
	<c:if test="${profiles.profileCode == 6 }">
		<c:set var="religion" value="${profiles.profileInfo}" />
		<c:set var="religionPublic" value="${profiles.publicLevelCode}" />
	</c:if>
	<c:if test="${profiles.profileCode == 7 }">
		<c:set var="politics" value="${profiles.profileInfo}" />
		<c:set var="politicsPublic" value="${profiles.publicLevelCode}" />
	</c:if>
	<c:if test="${profiles.profileCode == 10 }">
		<c:set var="birthdayPublic" value="${profiles.publicLevelCode}" />
	</c:if>
</c:forEach>

<section class="content-container">

	 ${memberProfile.birthday }
	<br />
	<div class="informbox information">
		<div class="informbox-header">
		<!-- 정보헤더 -->
			<img	src="${pageContext.request.contextPath}/resources/media/image/info-img.png">${memberProfile.fullName}
		</div>
		<div class="informbox-content">
			<form action="#" method="post">
			<!-- 정보컨텐츠 -->
			<div class="clearfix">

				<div class="content-inner">
					<!-- 왼쪽 -->
					<div class="inform-elem">
						<div class="profile-title">프로필사진/2</div>
						<div class="inform-databox">
							<div class="informdata profileImage">${profileImage}</div>
							<div class="inform-controller">
								
								
								
								<div class="inform-button">
									<input type="button" value="공개범위"><input type="button" value="수정">
								</div>
								<div class="inform-edit profileImage">
									<input type="hidden" value="2">
									<div class="dropzon profileImage"></div>
									<input type="button" value="저장" class="profile-editBtn ${profileImage }">
								</div>
							</div>
						</div>

					</div>
					
					<div class="inform-elem">
						<div class="profile-title">생일/10</div>
						<div class="inform-databox birthday">
							<div class="clearfix">
								<div class="informdata birthday">${memberProfile.birthday }</div>
								<div class="inform-button birthday">
									<input type="button" value="공개범위">
								</div>
							</div>
							<div class="inform-edit birthday">
								<input type="hidden" value="2"> 수정form
							</div>
						</div>
					</div>
					
					<div class="inform-elem">
						<div class="profile-title">상태글/5</div>
						<div class="inform-databox statusComment">
							<div class="clearfix">
								<div class="informdata statusComment">${statusComment }</div>
								<div class="inform-button statusComment">
									<input type="button" value="공개범위"><input type="button" value="수정">
								</div>
							</div>
							<div class="inform-edit statusComment">
								<input type="hidden" value="5">
								수정form
								<input type="button" value="저장" class="profile-editBtn ${statusComment }">
							</div>
						</div>
					</div>
					
					<div class="inform-elem status">
						<div class="profile-title">계정 설정</div>
						
						<div class="inform-status">
							<div>
								<a href="#"> 비빌번호변경 </a><br>
							</div>
							<div>
								<a href="#"> 휴면계정신청 </a> || <a href="#"> 탈퇴 </a> || <a href="#">
									계정폐쇄 </a>
							</div>
						</div>
					</div>
				</div>
				
				<div class="content-inner">
					<!-- 오른쪽 -->
					<div class="inform-elem">
						<div class="profile-title">공개이메일/3</div>
						<div class="inform-databox openEmail">
							<div class="clearfix">
								<div class="informdata openEmail">${openEmail }</div>
								<div class="inform-button openEmail">
									<input type="button" value="공개범위"><input type="button" value="수정">
								</div>
							</div>
							<div class="inform-edit openEmail">
								<input type="hidden" value="3"> 수정form
								<input type="button" value="저장" class="profile-editBtn ${openEmail }">
							</div>
						</div>
					</div>
					
					<div class="inform-elem">
						<div class="profile-title">휴대전화번호 /4</div>
						<div class="inform-databox phoneNumber">
							<div class="clearfix">
								<div class="informdata phoneNumber">${phoneNumber }</div>
								<div class="inform-button phoneNumber">
									<input type="button" value="공개범위"><input type="button" value="수정">
								</div>
							</div>
							<div class="inform-edit phoneNumber">
								<input type="hidden" value="4"> 수정form
								<input type="button" value="저장" class="profile-editBtn ${phoneNumber }">
							</div>
						</div>
					</div>
					
					<div class="inform-elem">
						<div class="profile-title">블로그 /9</div>
						<div class="inform-databox blog">
							<div class="clearfix">
								<div class="informdata blog">${blog }</div>
								<div class="inform-button blog">
									<input type="button" value="공개범위"><input type="button" value="수정">
								</div>
							</div>
							<div class="inform-edit blog">
								<input type="hidden" value="9"> 수정form
								<input type="button" value="저장" class="profile-editBtn ${blog }">
							</div>
						</div>
					</div>
					
					<div class="inform-elem">
						<div class="profile-title">사는곳 /1</div>
						<div class="inform-databox address">
							<div class="clearfix">
								<div class="informdata address">${address }</div>
								<div class="inform-button address">
									<input type="button" value="공개범위"><input type="button" value="수정">
								</div>
							</div>
							<div class="inform-edit address">
								<input type="hidden" value="1"> 수정form
								<input type="button" value="저장" class="profile-editBtn ${address }">
							</div>
						</div>
					</div>
					
					<div class="inform-elem">
						<div class="profile-title">언어/8</div>
						<div class="inform-databox language">
							<div class="clearfix">
								<div class="informdata language">${language }</div>
								<div class="inform-button language">
									<input type="button" value="공개범위"><input type="button" value="수정">
								</div>
							</div>
							<div class="inform-edit language">
								<input type="hidden" value="8"> 수정form
								<input type="button" value="저장" class="profile-editBtn ${language }">
							</div>
						</div>
					</div>
					
					<div class="inform-elem">
						<div class="profile-title">정치성향/7</div>
						<div class="inform-databox politics">
							<div class="clearfix">
								<div class="informdata politics">${politics }</div>
								<div class="inform-button politics">
									<input type="button" value="공개범위"><input type="button" value="수정">
								</div>
							</div>
							<div class="inform-edit politics">
								<input type="hidden" value="7"> 수정form
								<input type="button" value="저장" class="profile-editBtn ${politics }">
							</div>
						</div>
					</div>
					
					<div class="inform-elem">
						<div class="profile-title">종교 /6</div>
						<div class="inform-databox religion">
							<div class="clearfix">
								<div class="informdata religion">${religion }</div>
								<div class="inform-button religion">
									<input type="button" value="공개범위"><input type="button" value="수정">
									<div class='has-sub' >
								      <ul>
								         <li>전체공개</li>
								         <li>친구공개</li>
								         <li>나만보기</li>
								      </ul>
								   </div>
								</div>
							</div>
							<div class="inform-edit religion">
								<input type="hidden" value="6"> 수정form
								<input type="button" value="저장" class="profile-editBtn ${religion }">
							</div>
						</div>
					</div>
				</div>
				<!-- right 끝 -->
			</div>
		</form>
	</div>
</div>
</section>
<script src="${pageContext.request.contextPath}/resources/js/profile.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/filereader.js"></script>