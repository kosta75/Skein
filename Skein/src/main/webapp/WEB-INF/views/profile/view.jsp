<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

.informbox {
	position: relative;
	width: 850px;
	background: #fff;
	border: 1px solid #d3d6db;
	-webkit-border-radius: 3px;
	margin: 10px auto;
	margin-bottom: 40px;	
}

.clearfix:after {
	clear:both;
}

.informbox_header {
	padding: 12px;
	border-bottom: 1px solid #d3d6db;
	background: #f6f7f8;
	font-size: 20px;
	vertical-align: bottom;
}

.informbox_header img {
	margin-right: 10px;
}

.informbox_content {
	padding: 10px 0;
	height: auto;
}

.content_inner {
	padding: 0 10px;
	float: left;
	min-width: 400px;
	height: auto;
	margin-bottom: 10px;
}

.content_inner:FIRST-CHILD {
	border-right: 1px solid #d3d6db;
}

.inform_elem {
	padding: 10px 0;
}

.inform_elem b {
	color: #9197a3;
	font-size: 13px;
}

.content_inner .status {
	vertical-align: bottom;
}

.inform_status {
	text-align: right;
}

.inform_status div {
	padding: 6px 0;
}

.inform_status a {
	text-decoration: none;
}

.inform_databox {
	overflow: hidden;
	margin-top: 8px;
	min-height: 26px;
}
.informdata.profileImage{
	height:100px;width:100px;
	border: 1px dashed black;
}
.informdata {
	float: left;
}

.inform_button {
	min-height: 26px;
	float: right;
	vertical-align: top;
	display:none;
}

.inform_edit {
	clear: both;
	display: none;
}
.has-sub{
	display:none;
	position: absolute;
	border: 1px solid #777;
	background-color: #fff;
	margin-top: 2px;
}

.has-sub ul {
	list-style: none;
	min-width: 100%;
	padding: 3px 0 4px;
	overflow-y: auto;
	
}
.has-sub .publicbtn{
	border: solid #fff;
	border-width: 1px 0;
	color: #111;
	display: block;
	font-weight: normal;
	line-height: 16px;
	padding: 1px 16px 1px 22px;
	text-decoration: none;
}
.has-sub li a.checked{
	background: url(resources/media/image/checked.png) left 4px no-repeat;
}
.has-sub li a.selected{
	background-color: fuchsia;
}
</style>

<br />
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
		<form action="#" method="post">
			<!-- 정보컨텐츠 -->
			<div class="clearfix">
				<div class="content_inner">
					<!-- 왼쪽 -->
					<div class="inform_elem">
						<b>프로필사진</b>2
						<div class="inform_databox profileImage">
							<div class="clearfix">
								<div class="informdata profileImage">${profileImage }</div>
								<div class="inform_button profileImage">
									<c:if test="${!empty profileImage }"><input type="button" value="공개범위"></c:if><input type="button" value="수정">
									<div class='has-sub' >
								      <ul>
								         <li><a href="#" class="publicbtn public">전체공개</a></li>
								         <li><a href="#" class="publicbtn user">Sil사용자공개</a></li>
								         <li><a href="#" class="publicbtn friend">친구공개</a></li>
								         <li><a href="#" class="publicbtn privacy">나만보기</a></li>
								      </ul>
								   </div>
								</div>
								<div class="inform_edit profileImage">
									<input type="hidden" name="profileImage" value="2">
									<div class="dropzon profileImage"></div>
									<select name="publicLevelCode">
										<option value="5">전체공개</option>
										<option value="4">Sil사용자공개</option>
										<option value="3">친구공개</option>
										<option value="1">나만보기</option>
									</select>
									<input type="button" value="저장" class="profile_editBtn profileImage">
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
								         <li><a href="#" class="publicbtn public">전체공개</a></li>
								         <li><a href="#" class="publicbtn user">Sil사용자공개</a></li>
								         <li><a href="#" class="publicbtn friend">친구공개</a></li>
								         <li><a href="#" class="publicbtn privacy">나만보기</a></li>
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
									<c:if test="${!empty statusComment }"><input type="button" value="공개범위"></c:if><input type="button" value="수정">
									<div class='has-sub' >
								      <ul>
								         <li><a href="#" class="publicbtn public">전체공개</a></li>
								         <li><a href="#" class="publicbtn user">Sil사용자공개</a></li>
								         <li><a href="#" class="publicbtn friend">친구공개</a></li>
								         <li><a href="#" class="publicbtn privacy">나만보기</a></li>
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
							</div>
						</div>
					</div>
					
					<c:if test="${sessionScope.PersonalURI == personalURI}">
						<div class="inform_elem status">
							<b>계정 설정</b>
							<div class="inform_status">
								<div>
									<a href="#"> 비빌번호변경 </a><br>
								</div>
								<div>
									<a href="#"> 휴면계정신청 </a> || <a href="#"> 탈퇴 </a> || <a href="#">
										계정폐쇄 </a>
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
									<c:if test="${!empty openEmail }"><input type="button" value="공개범위"></c:if><input type="button" value="수정">
									<div class='has-sub' >
								      <ul>
								         <li><a href="#" class="publicbtn public">전체공개</a></li>
								         <li><a href="#" class="publicbtn user">Sil사용자공개</a></li>
								         <li><a href="#" class="publicbtn friend">친구공개</a></li>
								         <li><a href="#" class="publicbtn privacy">나만보기</a></li>
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
							</div>
						</div>
					</div>
					<div class="inform_elem">
						<b>휴대폰번호</b>4
						<div class="inform_databox phoneNumber">
							<div class="clearfix">
								<div class="informdata phoneNumber">${phoneNumber }</div>
								<div class="inform_button phoneNumber">
									<c:if test="${!empty phoneNumber }"><input type="button" value="공개범위"></c:if><input type="button" value="수정">
									<div class='has-sub' >
								      <ul>
								         <li><a href="#" class="publicbtn public">전체공개</a></li>
								         <li><a href="#" class="publicbtn user">Sil사용자공개</a></li>
								         <li><a href="#" class="publicbtn friend">친구공개</a></li>
								         <li><a href="#" class="publicbtn privacy">나만보기</a></li>
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
							</div>
						</div>
					</div>
					<div class="inform_elem">
						<b>블로그</b>9
						<div class="inform_databox blog">
							<div class="clearfix">
								<div class="informdata blog">${blog }</div>
								<div class="inform_button blog">
									<c:if test="${!empty blog }"><input type="button" value="공개범위"></c:if><input type="button" value="수정">
									<div class='has-sub' >
								      <ul>
								         <li><a href="#" class="publicbtn public">전체공개</a></li>
								         <li><a href="#" class="publicbtn user">Sil사용자공개</a></li>
								         <li><a href="#" class="publicbtn friend">친구공개</a></li>
								         <li><a href="#" class="publicbtn privacy">나만보기</a></li>
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
							</div>
						</div>
					</div>
					<div class="inform_elem">
						<b>사는곳</b>1
						<div class="inform_databox address">
							<div class="clearfix">
								<div class="informdata address">${address }</div>
								<div class="inform_button address">
									<c:if test="${!empty address }"><input type="button" value="공개범위"></c:if><input type="button" value="수정">
									<div class='has-sub' >
								      <ul>
								         <li><a href="#" class="publicbtn public">전체공개</a></li>
								         <li><a href="#" class="publicbtn user">Sil사용자공개</a></li>
								         <li><a href="#" class="publicbtn friend">친구공개</a></li>
								         <li><a href="#" class="publicbtn privacy">나만보기</a></li>
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
							</div>
						</div>
					</div>
					<div class="inform_elem">
						<b>언어</b>8
						<div class="inform_databox language">
							<div class="clearfix">
								<div class="informdata language">${language }</div>
								<div class="inform_button language">
									<c:if test="${!empty language }"><input type="button" value="공개범위"></c:if><input type="button" value="수정">
									<div class='has-sub' >
								      <ul>
								         <li><a href="#" class="publicbtn public">전체공개</a></li>
								         <li><a href="#" class="publicbtn user">Sil사용자공개</a></li>
								         <li><a href="#" class="publicbtn friend">친구공개</a></li>
								         <li><a href="#" class="publicbtn privacy">나만보기</a></li>
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
							</div>
						</div>
					</div>
					<div class="inform_elem">
						<b>정치성향</b>7
						<div class="inform_databox politics">
							<div class="clearfix">
								<div class="informdata politics">${politics }</div>
								<div class="inform_button politics">
									<c:if test="${!empty politics }"><input type="button" value="공개범위"></c:if><input type="button" value="수정">
									<div class='has-sub' >
								      <ul>
								         <li><a href="#" class="publicbtn public">전체공개</a></li>
								         <li><a href="#" class="publicbtn user">Sil사용자공개</a></li>
								         <li><a href="#" class="publicbtn friend">친구공개</a></li>
								         <li><a href="#" class="publicbtn privacy">나만보기</a></li>
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
							</div>
						</div>
					</div>
					<div class="inform_elem">
						<b>종교</b>6
						<div class="inform_databox religion">
							<div class="clearfix">
								<div class="informdata religion">${religion }</div>
								<div class="inform_button religion">
									<c:if test="${!empty religion }"><input type="button" value="공개범위"></c:if><input type="button" value="수정">
									<div class='has-sub' >
								      <ul>
								         <li><a href="#" class="publicbtn public">전체공개</a></li>
								         <li><a href="#" class="publicbtn user">Sil사용자공개</a></li>
								         <li><a href="#" class="publicbtn friend">친구공개</a></li>
								         <li><a href="#" class="publicbtn privacy">나만보기</a></li>
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
							</div>
						</div>
					</div>
				</div>
				<!-- right 끝 -->
			</div>
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
		</form>
	</div>
</div>

<script src="${pageContext.request.contextPath}/resources/js/profile.js"></script>
<c:if test="${sessionScope.PersonalURI == personalURI}">
	<script src="${pageContext.request.contextPath}/resources/js/profile-my.js"></script>
</c:if>