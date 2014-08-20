<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>

</style>
<script>

</script>

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
	<div><!-- 정보헤더 -->
		정보
	</div>
	<div>
		<div><!-- 왼쪽 -->
			<div>
				<b>프로필사진</b>
				<div>
					<div>
						<img src="" />
						<div>
							<a href="#">
								<input type="file">
							</a>
						</div>
					</div>
				</div>
			</div>
			<div>
				<b>생일</b>
				<div>
					
				</div>
			</div>
			<div>
				비밀번호 변경
			</div>
			<div>
				계정 상태 변경
			</div>
		</div>
		<div><!-- 오른쪽 -->
			<div>
				공개이메일
			</div>
			<div>
				블로그
			</div>
			<div>
				사는곳
			</div>
			<div>
				상태글
			</div>
			<div>
				언어
			</div>
			<div>
				정치성향
			</div>
			<div>
				종교
			</div>
			<div>
				<b>휴대폰번호</b>
				<div>${phoneNumber }</div>
			</div>
		</div>
	</div>
</div>
