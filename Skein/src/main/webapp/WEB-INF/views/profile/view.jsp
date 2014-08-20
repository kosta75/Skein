<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

.informbox{
	position: relative;
	width: 850px;
	background: #fff;
	border: 1px solid #d3d6db;
	-webkit-border-radius: 3px;
	margin: 10px auto;
	margin-bottom: 40px;
	overflow: hidden;
}

.clearfix:after{
	clear:both;
}
.informbox_header{
	padding: 12px;
	border-bottom: 1px solid #d3d6db;
	background: #f6f7f8;
	font-size: 20px;
	vertical-align: bottom;
}
.informbox_header img{
	margin-right: 10px;
}
.informbox_content{
	padding: 10px 0;
	height: auto;
}
.content_inner{
	padding: 0 10px;
	float: left;
	min-width: 400px;
	height: auto;
	margin-bottom: 10px;
	
}
.content_inner:FIRST-CHILD {
	border-right: 1px solid #d3d6db;
}
.inform_elem{
	padding: 10px 0;
}
.inform_elem b{
 	color: #9197a3;
 	font-size:13px;
 }
 .content_inner .status{
 	vertical-align: bottom;
 }
 .inform_status{
 	text-align: right;
 }
 .inform_status div{
 	padding: 6px 0;
 }
 .inform_status a{
 	text-decoration: none;
 }
 .inform_data{
 	margin-top: 8px;
 }
</style>
${sessionScope.LoginUser }
${memberProfile.fullName}
${memberProfile.birthday }
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
	<div class="informbox_header"><!-- 정보헤더 -->
		<img src="${pageContext.request.contextPath}/resources/media/image/info_img.png">정보
	</div>
	<div class="informbox_content"><!-- 정보컨텐츠 -->
		<div class="clearfix">
			<div class="content_inner"><!-- 왼쪽 -->
				<div class="inform_elem" >
					<b>프로필사진</b>
					<div class="inform_data profileImage">
						${profileImage }
					</div>
				</div>
				<div class="inform_elem" >
					<b>생일</b>
					<div class="inform_data birthday">
						${memberProfile.birthday }
					</div>
				</div>
				<div class="inform_elem">
					<b>상태글</b>
					<div class="inform_data statusComment">
						${statusComment }
					</div>
				</div>
				<div class="inform_elem status" >
					<b>계정 설정</b>
					<div class="inform_status">
						<div><a href="#"> 비빌번호변경 </a><br></div>
						<div><a href="#"> 휴면계정신청 </a> || <a href="#"> 탈퇴 </a> || <a href="#"> 계정폐쇄 </a></div>
					</div>
				</div>
			</div>
			<div class="content_inner"><!-- 오른쪽 -->
				<div class="inform_elem" >
					<b>공개이메일</b>
					<div class="inform_data openEmail">
						${openEmail }
					</div>
				</div>
				<div class="inform_elem" >
					<b>블로그</b>
					<div class="inform_data blog">
						${blog }
					</div>
				</div>
				<div class="inform_elem" >
					<b>사는곳</b>
					<div class="inform_data address">
						${address }
					</div>
				</div>
				<div class="inform_elem">
					<b>언어</b>
					<div class="inform_data language">
						${language }
					</div>
				</div>
				<div class="inform_elem">
					<b>정치성향</b>
					<div class="inform_data politics">
						${politics }
					</div>
				</div>
				<div class="inform_elem" >
					<b>종교</b>
					<div class="inform_data religion">
						${religion }
					</div>
				</div>
				<div class="inform_elem" >
					<b>휴대폰번호</b>
					<div class="inform_data phoneNumber">
						${phoneNumber }
					</div>
				</div>
			</div><!-- right 끝 -->
		</div>
	</div>
</div>
