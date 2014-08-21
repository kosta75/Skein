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
	min-width: 100%;
	min-height: 100%;
}

.has-sub ul {
	list-style: none;
	min-width: 100%;
}
</style>
${memberProfile.fullName} ${memberProfile.birthday }
<br />
<c:forEach var="profiles" items="${memberProfile.profiles}">
	<c:if test="${profiles.profileName == '프로필사진' }">
		<c:set var="profileImage" value="${profiles.profileInfo}" />
	</c:if>
	<c:if test="${profiles.profileName == '상태글' }">
		<c:set var="statusComment" value="${profiles.profileInfo}" />
	</c:if>
	<c:if test="${profiles.profileName == '공개이메일' }">
		<c:set var="openEmail" value="${profiles.profileInfo}" />
	</c:if>
	<c:if test="${profiles.profileName == '휴대폰번호' }">
		<c:set var="phoneNumber" value="${profiles.profileInfo}" />
	</c:if>
	<c:if test="${profiles.profileName == '블로그' }">
		<c:set var="blog" value="${profiles.profileInfo}" />
	</c:if>
	<c:if test="${profiles.profileName == '사는곳' }">
		<c:set var="address" value="${profiles.profileInfo}" />
	</c:if>
	<c:if test="${profiles.profileName == '언어' }">
		<c:set var="language" value="${profiles.profileInfo}" />
	</c:if>
	<c:if test="${profiles.profileName == '종교' }">
		<c:set var="religion" value="${profiles.profileInfo}" />
	</c:if>
	<c:if test="${profiles.profileName == '정치성향' }">
		<c:set var="politics" value="${profiles.profileInfo}" />
	</c:if>
</c:forEach>

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
									<input type="button" value="공개범위"><input type="button" value="수정">
								</div>
								<div class="inform_edit profileImage">
									<input type="hidden" value="2">
									<div class="dropzon profileImage"></div>
									<input type="button" value="저장" class="profile_editBtn ${profileImage }">
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
								</div>
							</div>
							<div class="inform_edit birthday">
								<input type="hidden" value="2"> 수정form
							</div>
						</div>
					</div>
					<div class="inform_elem">
						<b>상태글</b>5
						<div class="inform_databox statusComment">
							<div class="clearfix">
								<div class="informdata statusComment">${statusComment }</div>
								<div class="inform_button statusComment">
									<input type="button" value="공개범위"><input type="button" value="수정">
								</div>
							</div>
							<div class="inform_edit statusComment">
								<input type="hidden" value="5">
								수정form
								<input type="button" value="저장" class="profile_editBtn ${statusComment }">
							</div>
						</div>
					</div>
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
				</div>
				<div class="content_inner">
					<!-- 오른쪽 -->
					<div class="inform_elem">
						<b>공개이메일</b>3
						<div class="inform_databox openEmail">
							<div class="clearfix">
								<div class="informdata openEmail">${openEmail }</div>
								<div class="inform_button openEmail">
									<input type="button" value="공개범위"><input type="button" value="수정">
								</div>
							</div>
							<div class="inform_edit openEmail">
								<input type="hidden" value="3"> 수정form
								<input type="button" value="저장" class="profile_editBtn ${openEmail }">
							</div>
						</div>
					</div>
					<div class="inform_elem">
						<b>휴대폰번호</b>4
						<div class="inform_databox phoneNumber">
							<div class="clearfix">
								<div class="informdata phoneNumber">${phoneNumber }</div>
								<div class="inform_button phoneNumber">
									<input type="button" value="공개범위"><input type="button" value="수정">
								</div>
							</div>
							<div class="inform_edit phoneNumber">
								<input type="hidden" value="4"> 수정form
								<input type="button" value="저장" class="profile_editBtn ${phoneNumber }">
							</div>
						</div>
					</div>
					<div class="inform_elem">
						<b>블로그</b>9
						<div class="inform_databox blog">
							<div class="clearfix">
								<div class="informdata blog">${blog }</div>
								<div class="inform_button blog">
									<input type="button" value="공개범위"><input type="button" value="수정">
								</div>
							</div>
							<div class="inform_edit blog">
								<input type="hidden" value="9"> 수정form
								<input type="button" value="저장" class="profile_editBtn ${blog }">
							</div>
						</div>
					</div>
					<div class="inform_elem">
						<b>사는곳</b>1
						<div class="inform_databox address">
							<div class="clearfix">
								<div class="informdata address">${address }</div>
								<div class="inform_button address">
									<input type="button" value="공개범위"><input type="button" value="수정">
								</div>
							</div>
							<div class="inform_edit address">
								<input type="hidden" value="1"> 수정form
								<input type="button" value="저장" class="profile_editBtn ${address }">
							</div>
						</div>
					</div>
					<div class="inform_elem">
						<b>언어</b>8
						<div class="inform_databox language">
							<div class="clearfix">
								<div class="informdata language">${language }</div>
								<div class="inform_button language">
									<input type="button" value="공개범위"><input type="button" value="수정">
								</div>
							</div>
							<div class="inform_edit language">
								<input type="hidden" value="8"> 수정form
								<input type="button" value="저장" class="profile_editBtn ${language }">
							</div>
						</div>
					</div>
					<div class="inform_elem">
						<b>정치성향</b>7
						<div class="inform_databox politics">
							<div class="clearfix">
								<div class="informdata politics">${politics }</div>
								<div class="inform_button politics">
									<input type="button" value="공개범위"><input type="button" value="수정">
								</div>
							</div>
							<div class="inform_edit politics">
								<input type="hidden" value="7"> 수정form
								<input type="button" value="저장" class="profile_editBtn ${politics }">
							</div>
						</div>
					</div>
					<div class="inform_elem">
						<b>종교</b>6
						<div class="inform_databox religion">
							<div class="clearfix">
								<div class="informdata religion">${religion }</div>
								<div class="inform_button religion">
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
							<div class="inform_edit religion">
								<input type="hidden" value="6"> 수정form
								<input type="button" value="저장" class="profile_editBtn ${religion }">
							</div>
						</div>
					</div>
				</div>
				<!-- right 끝 -->
			</div>
		</form>
	</div>
</div>