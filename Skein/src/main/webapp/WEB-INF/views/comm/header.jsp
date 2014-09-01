<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="globalTop">
	<div class="logo">
		<a href="${pageContext.request.contextPath}"><img style="height:30px;" src="${pageContext.request.contextPath }/resources/media/image/skein_w.png" />Sil</a>
	</div>
	<se:authorize ifNotGranted="ROLE_USER">
	<div id="loginFormContainer">
		<form id="loginForm" action="${pageContext.request.contextPath}/security/login" method="post">
			<fieldset>
				<legend>로그인 정보</legend>
				<table>
					<tr>
						<th><label for="email">이메일</label></th>
						<th><label for="password">비밀번호</label></th>
						<th></th>
					</tr>
					<tr>
						<td><input class="input-filed" id="email" type="email" name="email" /></td>
						<td><input class="input-filed" id="password" type="password" name="password" /></td>
						<td><input class="login-button" type="submit" value="Login" /></td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>
	</se:authorize>
	
	<div id="search" >
		<form class="serch-form" id="searchBar" method="post" action="${pageContext.request.contextPath}/search/members" role="search">
			<input type="text" class="textbox" name="fullName"  placeholder="당신의 친구를 찾아보세요" autocomplete="off">
			<button type="submit" class="search-button" onclick="" title="당신의 친구를 찾아보세요" ></button>
		</form>
	</div>
	
	<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
	<div id="infoContainer">
		<div class="info-nav-wrapper">
			<div class="user-profile-info-container">
				<div class="user-profile-image">
					<c:choose>
						<c:when test="${sessionScope.BASE_MEMBER_INFO.profileImageFileName == null}">
							<img src="${pageContext.request.contextPath}/resources/user-profile-image/default-profile-image.png" />
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath}/resources/user-profile-image/${sessionScope.BASE_MEMBER_INFO.profileImageFileName}" />
						</c:otherwise>
					</c:choose>
				</div>
				<div class="user-profile-uri">
					<a href="${pageContext.request.contextPath}/${sessionScope.BASE_MEMBER_INFO.personalURI}">${sessionScope.BASE_MEMBER_INFO.personalURI}</a>
				</div>
			</div >
			
			<nav id="global-navigation">
				<ul>
					<li>
						<div id="notification">
							<span class="notification-btn">알림</span>
							<div id="notificationCounter"><a class="notification-count-number" href="${pageContext.request.contextPath}/notification/"></a></div>
						</div>
						<div id="notificationListContainer">
							<div class="notification-title">
								<div class="none-confirm-notification">확인하지 않은 알림</div>
								<div class="confirm-btn">모두 확인</div>
							</div>
							<ul class="notification-list"></ul>
						</div>
					</li>
					<li><a href="">고객센터</a></li>
					<li><a href="${pageContext.request.contextPath}/security/logout">로그아웃</a></li>
				</ul>
			</nav>
		</div>
	</div>
	</se:authorize>
</header>
