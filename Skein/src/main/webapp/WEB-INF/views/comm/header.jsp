<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="globalTop">

	<div class="logo">
		<a href="${pageContext.request.contextPath}">Sil</a>
	</div>
	
	<se:authorize ifNotGranted="ROLE_USER">
	<div id="loginFormContainer">
		<form id="loginForm" action="${pageContext.request.contextPath}/security/login" method="post">
			<fieldset>
				<legend>로그인 정보</legend>
				<table>
					<tr>
						<th><label>이메일</label></th>
						<th><label>비밀번호</label></th>
						<th></th>
					</tr>
					<tr>
						<td><input class="input-filed" type="email" name="email" /></td>
						<td><input class="input-filed" type="password" name="password" /></td>
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
					<img src="${pageContext.request.contextPath}/resources/media/image//20100107221109605_2R2EJLGPV_raw.jpg" width="40px;" height="40px;" style="border-radius:100px;">
				</div>
				<div class="user-profile-uri">
					<a href="${pageContext.request.contextPath}/${sessionScope.PersonalURI}">${sessionScope.PersonalURI}</a>
				</div>
			</div >
			
			<nav id="global-navigation">
				<ul>
					<li>
						<a href="" id="notification">알림</a>
						<div id="notificationList">
							<!-- 1:공지사항 / 2:친구신청 3:친구신청수락 4:공유신청 5:공유신청수락 6:댓글 -->
							<hr>
								알림페이지
							<hr>
							<c:forEach var="list" items="${notificationList}">
							<c:set var="code" value="${list.notificationCode}"></c:set>
								<c:choose>
									<c:when test="${code == 1}">
										읽지 않은 공지사항 알림 - ${list.groupCount} 개 <br />
									</c:when>
									<c:when test="${code == 2}">
										읽지 않은 친구신청 알림 - ${list.groupCount} 개 <br />
									</c:when>
									<c:when test="${code == 3}">
										읽지 않은 친구신청수락 알림 - ${list.groupCount} 개 <br />
									</c:when>
									<c:when test="${code == 4}">
										읽지 않은 공유신청 알림 - ${list.groupCount} 개 <br />
									</c:when>
									<c:when test="${code == 5}">
										읽지 않은 공유신청수락 알림 - ${list.groupCount} 개 <br />
									</c:when>
									<c:when test="${code == 6}">
										읽지 않은 댓글 알림 - ${list.groupCount} 개 <br />
									</c:when>
								</c:choose>    	
							</c:forEach>
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
