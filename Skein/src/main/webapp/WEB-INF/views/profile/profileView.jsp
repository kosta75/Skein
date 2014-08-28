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

<!-- 
profileImagePublic
statusCommentPublic
openEmailPublic
phoneNumberPublic
blogPublic
addressPublic
languagePublic
religionPublic
politicsPublic
birthdayPublic

1 Privacy
2 Share
3 Friend
4 User
5 Public

 -->
	 <div class="informbox information">
	<div class="informbox_header">
		<!-- 정보헤더 -->
		<img
			src="${pageContext.request.contextPath}/resources/media/image/info_img.png">정보
	</div>
	<div class="informbox_content">
			<!-- 정보컨텐츠 -->
			<div class="clearfix">
				<div class="content_inner">
					<!-- 왼쪽 -->
					<div class="inform_elem">
						<b>프로필사진</b>2
						<div class="inform_databox profileImage">
							<div class="clearfix">
								<c:if test="${empty profileImage }">
									<font> 프로필사진을 등록해보세요.</font>
								</c:if>
								<div class="informdata profileImage"><c:if test="${!empty profileImage }">
									<img src="${pageContext.request.contextPath}/resources/user-profile-image/${profileImage }">
								</c:if></div>
								<div class="inform_button profileImage">
									<input class="publichover" type="button" value="공개범위"><input type="button" value="수정">
									<div class='has-sub' >
								      <ul>
								         <li><a class="publicbtn public">전체공개</a></li>
								         <li><a class="publicbtn user">Sil사용자공개</a></li>
								         <li><a class="publicbtn friend">친구공개</a></li>
								         <li><a class="publicbtn privacy">나만보기</a></li>
								      </ul>
								   </div>
								</div>
								<div class="inform_edit profileImage">
									<input type="hidden" name="profileImage" value="2">
									<!-- 이미지 -->
									<div id="profileImageUp" class="offset2 arrow_box">
									</div>
									<!-- 프로필사진dropzone -->
									<form id="profileImageForm" method="post" enctype="multipart/form-data">
										<div class="dropzone profileImage">
											<span class="help-message">* 이미지를 등록하시려면 여기에 끌어다 놓으세요!</span>
										</div>
									</form>
									<select name="publicLevelCode">
										<option value="5">전체공개</option>
										<option value="4">Sil사용자공개</option>
										<option value="3">친구공개</option>
										<option value="1">나만보기</option>
									</select>
									<input type="button" value="저장" class="profile_editBtn profileImage">
									<input type="button" value="삭제" class="profile_deleteBtn profileImage">
									<img class="profilecloseBtn" src="${pageContext.request.contextPath}/resources/media/image/closeBtn.png" >
								</div>
							</div>
						</div>
					</div>
					<div class="inform_elem">
						<b>생일</b>
						<div class="inform_databox birthday">
							<div class="clearfix">
								<div class="informdata birthday">${memberProfile.birthday }</div>
								<div class="inform_button birthday">
									<input type="button" value="공개범위">
									<div class='has-sub' >
								      <ul>
								         <li><a class="publicbtn public">전체공개</a></li>
								         <li><a class="publicbtn user">Sil사용자공개</a></li>
								         <li><a class="publicbtn friend">친구공개</a></li>
								         <li><a class="publicbtn privacy">나만보기</a></li>
								      </ul>
								   </div>
								</div>
							</div>
							<div class="inform_edit birthday">
								<input type="hidden" name="birthday" value="10">
							</div>
						</div>
					</div>
					<div class="inform_elem">
						<b>상태글</b>5
						<div class="inform_databox statusComment">
							<div class="clearfix">
								<div class="informdata statusComment">${statusComment }</div>
								<div class="inform_button statusComment">
									<input class="publichover" type="button" value="공개범위"><input type="button" value="수정">
									<div class='has-sub' >
								      <ul>
								         <li><a class="publicbtn public">전체공개</a></li>
								         <li><a class="publicbtn user">Sil사용자공개</a></li>
								         <li><a class="publicbtn friend">친구공개</a></li>
								         <li><a class="publicbtn privacy">나만보기</a></li>
								      </ul>
								   </div>
								</div>
							</div>
							<div class="inform_edit statusComment">
								<input type="hidden" name="statusComment" value="5">
								<input type="text" name="profileInfo" value="${statusComment }" />
								<select name="publicLevelCode">
									<option value="5">전체공개</option>
									<option value="4">Sil사용자공개</option>
									<option value="3">친구공개</option>
									<option value="1">나만보기</option>
								</select>
								<input type="button" value="저장" class="profile_editBtn statusComment">
								<input type="button" value="삭제" class="profile_deleteBtn statusComment">
								<img class="profilecloseBtn" src="${pageContext.request.contextPath}/resources/media/image/closeBtn.png" >
							</div>
						</div>
					</div>
					
					<c:if test="${sessionScope.BASE_MEMBER_INFO.personalURI == personalURI}">	
						<div class="inform_elem status">
							<b>계정 설정</b>
							<div class="inform_status">
								<div>
									<a href="${pageContext.request.contextPath}/account/modifypwd"> 비빌번호변경 </a><br>
								</div>
								<div>
									<a href="${pageContext.request.contextPath}/account/modifydomrant"> 휴면계정신청 </a> || 
									<a href="${pageContext.request.contextPath}/account/modifydropout"> 탈퇴 </a> ||
									<a href="${pageContext.request.contextPath}/account/modifylockout"> 계정폐쇄 </a>
								</div>
							</div>
						</div>
					</c:if>
				</div>
				<div class="content_inner">
					<!-- 오른쪽 -->
					<div class="inform_elem">
						<b>공개이메일</b>3
						<div class="inform_databox openEmail">
							<div class="clearfix">
								<div class="informdata openEmail">${openEmail }</div>
								<div class="inform_button openEmail">
									<input class="publichover" type="button" value="공개범위"><input type="button" value="수정">
									<div class='has-sub' >
								      <ul>
								         <li><a class="publicbtn public">전체공개</a></li>
								         <li><a class="publicbtn user">Sil사용자공개</a></li>
								         <li><a class="publicbtn friend">친구공개</a></li>
								         <li><a class="publicbtn privacy">나만보기</a></li>
								      </ul>
								   </div>
								</div>
							</div>
							<div class="inform_edit openEmail">
								<input type="hidden" name="openEmail" value="3">
								<input type="text" name="profileInfo" value="${openEmail }" />
								<select name="publicLevelCode">
									<option value="5">전체공개</option>
									<option value="4">Sil사용자공개</option>
									<option value="3">친구공개</option>
									<option value="1">나만보기</option>
								</select>
								<input type="button" value="저장" class="profile_editBtn openEmail">
								<input type="button" value="삭제" class="profile_deleteBtn openEmail">
								<img class="profilecloseBtn" src="${pageContext.request.contextPath}/resources/media/image/closeBtn.png" >
							</div>
						</div>
					</div>
					<div class="inform_elem">
						<b>휴대폰번호</b>4
						<div class="inform_databox phoneNumber">
							<div class="clearfix">
								<div class="informdata phoneNumber">${phoneNumber }</div>
								<div class="inform_button phoneNumber">
									<input class="publichover" type="button" value="공개범위"><input type="button" value="수정">
									<div class='has-sub' >
								      <ul>
								         <li><a class="publicbtn public">전체공개</a></li>
								         <li><a class="publicbtn user">Sil사용자공개</a></li>
								         <li><a class="publicbtn friend">친구공개</a></li>
								         <li><a class="publicbtn privacy">나만보기</a></li>
								      </ul>
								   </div>
								</div>
							</div>
							<div class="inform_edit phoneNumber">
								<input type="hidden" name="phoneNumber" value="4">
								<input type="text" name="profileInfo" value="${phoneNumber }" />
								<select name="publicLevelCode">
									<option value="5">전체공개</option>
									<option value="4">Sil사용자공개</option>
									<option value="3">친구공개</option>
									<option value="1">나만보기</option>
								</select>
								<input type="button" value="저장" class="profile_editBtn phoneNumber">
								<input type="button" value="삭제" class="profile_deleteBtn phoneNumber">
								<img class="profilecloseBtn" src="${pageContext.request.contextPath}/resources/media/image/closeBtn.png" >
							</div>
						</div>
					</div>
					<div class="inform_elem">
						<b>블로그</b>9
						<div class="inform_databox blog">
							<div class="clearfix">
								<div class="informdata blog">${blog }</div>
								<div class="inform_button blog">
									<input class="publichover" type="button" value="공개범위"><input type="button" value="수정">
									<div class='has-sub' >
								      <ul>
								         <li><a class="publicbtn public">전체공개</a></li>
								         <li><a class="publicbtn user">Sil사용자공개</a></li>
								         <li><a class="publicbtn friend">친구공개</a></li>
								         <li><a class="publicbtn privacy">나만보기</a></li>
								      </ul>
								   </div>
								</div>
							</div>
							<div class="inform_edit blog">
								<input type="hidden" name="blog" value="9">
								<input type="text" name="profileInfo" value="${blog }" />
								<select name="publicLevelCode">
									<option value="5">전체공개</option>
									<option value="4">Sil사용자공개</option>
									<option value="3">친구공개</option>
									<option value="1">나만보기</option>
								</select>
								<input type="button" value="저장" class="profile_editBtn blog">
								<input type="button" value="삭제" class="profile_deleteBtn blog">
								<img class="profilecloseBtn" src="${pageContext.request.contextPath}/resources/media/image/closeBtn.png" >
							</div>
						</div>
					</div>
					<div class="inform_elem">
						<b>사는곳</b>1
						<div class="inform_databox address">
							<div class="clearfix">
								<div class="informdata address">${address }</div>
								<div class="inform_button address">
									<input class="publichover" type="button" value="공개범위"><input type="button" value="수정">
									<div class='has-sub' >
								      <ul>
								         <li><a class="publicbtn public">전체공개</a></li>
								         <li><a class="publicbtn user">Sil사용자공개</a></li>
								         <li><a class="publicbtn friend">친구공개</a></li>
								         <li><a class="publicbtn privacy">나만보기</a></li>
								      </ul>
								   </div>
								</div>
							</div>
							<div class="inform_edit address">
								<input type="hidden" name="address" value="1">
								<input type="text" name="profileInfo" value="${address }" />
								<select name="publicLevelCode">
									<option value="5">전체공개</option>
									<option value="4">Sil사용자공개</option>
									<option value="3">친구공개</option>
									<option value="1">나만보기</option>
								</select>
								<input type="button" value="저장" class="profile_editBtn address">
								<input type="button" value="삭제" class="profile_deleteBtn address">
								<img class="profilecloseBtn" src="${pageContext.request.contextPath}/resources/media/image/closeBtn.png" >
							</div>
						</div>
					</div>
					<div class="inform_elem">
						<b>언어</b>8
						<div class="inform_databox language">
							<div class="clearfix">
								<div class="informdata language">${language }</div>
								<div class="inform_button language">
									<input class="publichover" type="button" value="공개범위"><input type="button" value="수정">
									<div class='has-sub' >
								      <ul>
								         <li><a class="publicbtn public">전체공개</a></li>
								         <li><a class="publicbtn user">Sil사용자공개</a></li>
								         <li><a class="publicbtn friend">친구공개</a></li>
								         <li><a class="publicbtn privacy">나만보기</a></li>
								      </ul>
								   </div>
								</div>
							</div>
							<div class="inform_edit language">
								<input type="hidden" name="language" value="8">
								<input type="text" name="profileInfo" value="${language }" />
								<select name="publicLevelCode">
									<option value="5">전체공개</option>
									<option value="4">Sil사용자공개</option>
									<option value="3">친구공개</option>
									<option value="1">나만보기</option>
								</select>
								<input type="button" value="저장" class="profile_editBtn language">
								<input type="button" value="삭제" class="profile_deleteBtn language">
								<img class="profilecloseBtn" src="${pageContext.request.contextPath}/resources/media/image/closeBtn.png" >
							</div>
						</div>
					</div>
					<div class="inform_elem">
						<b>정치성향</b>7
						<div class="inform_databox politics">
							<div class="clearfix">
								<div class="informdata politics">${politics }</div>
								<div class="inform_button politics">
									<input class="publichover" type="button" value="공개범위"><input type="button" value="수정">
									<div class='has-sub' >
								      <ul>
								         <li><a class="publicbtn public">전체공개</a></li>
								         <li><a class="publicbtn user">Sil사용자공개</a></li>
								         <li><a class="publicbtn friend">친구공개</a></li>
								         <li><a class="publicbtn privacy">나만보기</a></li>
								      </ul>
								   </div>
								</div>
							</div>
							<div class="inform_edit politics">
								<input type="hidden" name="politics" value="7">
								<input type="text" name="profileInfo" value="${politics }" />
								<select name="publicLevelCode">
									<option value="5">전체공개</option>
									<option value="4">Sil사용자공개</option>
									<option value="3">친구공개</option>
									<option value="1">나만보기</option>
								</select>
								<input type="button" value="저장" class="profile_editBtn politics">
								<input type="button" value="삭제" class="profile_deleteBtn politics">
								<img class="profilecloseBtn" src="${pageContext.request.contextPath}/resources/media/image/closeBtn.png" >
							</div>
						</div>
					</div>
					<div class="inform_elem">
						<b>종교</b>6
						<div class="inform_databox religion">
							<div class="clearfix">
								<div class="informdata religion">${religion }</div>
								<div class="inform_button religion">
									<input class="publichover" type="button" value="공개범위"><input type="button" value="수정">
									<div class='has-sub' >
								      <ul>
								         <li><a class="publicbtn public">전체공개</a></li>
								         <li><a class="publicbtn user">Sil사용자공개</a></li>
								         <li><a class="publicbtn friend">친구공개</a></li>
								         <li><a class="publicbtn privacy">나만보기</a></li>
								      </ul>
								   </div>
								</div>
							</div>
							<div class="inform_edit religion">
								<input type="hidden" name="religion" value="6"> 
								<input type="text" name="profileInfo" value="${religion }" />
								<select name="publicLevelCode">
									<option value="5">전체공개</option>
									<option value="4">Sil사용자공개</option>
									<option value="3">친구공개</option>
									<option value="1">나만보기</option>
								</select>
								<input type="button" value="저장" class="profile_editBtn religion">
								<input type="button" value="삭제" class="profile_deleteBtn religion">
								<img class="profilecloseBtn" src="${pageContext.request.contextPath}/resources/media/image/closeBtn.png" >
							</div>
						</div>
					</div>
				</div>
				<!-- right 끝 -->
			</div>
			<input type="hidden" name="contextPath" value="${pageContext.request.contextPath }"/>
			<input type="hidden" name="email" value="${email }" />
			<input type="hidden" name="profileImagePublic" value="${profileImagePublic }" />
			<input type="hidden" name="statusCommentPublic" value="${statusCommentPublic }" />
			<input type="hidden" name="openEmailPublic" value="${openEmailPublic }" />
			<input type="hidden" name="phoneNumberPublic" value="${phoneNumberPublic }" />
			<input type="hidden" name="blogPublic" value="${blogPublic }" />
			<input type="hidden" name="addressPublic" value="${addressPublic }" />
			<input type="hidden" name="languagePublic" value="${languagePublic }" />
			<input type="hidden" name="religionPublic" value="${religionPublic }" />
			<input type="hidden" name="politicsPublic" value="${politicsPublic }" />
			<input type="hidden" name="birthdayPublic" value="${birthdayPublic }" />
	</div>
</div>


	
</section>
<script src="${pageContext.request.contextPath}/resources/js/profile.js"></script>
<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
	<c:if test="${sessionScope.BASE_MEMBER_INFO.personalURI == personalURI}">
		<script src="${pageContext.request.contextPath}/resources/js/filereader.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/profile-my.js"></script>
	</c:if>
</se:authorize>