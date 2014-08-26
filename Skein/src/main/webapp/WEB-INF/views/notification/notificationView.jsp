<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="content-container">
	<div class="notification-content-wrapper">
		<c:forEach var="notificationList" items="${notificationList}">
			<c:choose>
				<c:when test="${notificationList.notificationCode == 1}">
					공지사항 <br />
					${notificationList.notificationSeq} <br />
				</c:when>
				<c:when test="${notificationList.notificationCode == 2}">
					친구 신청 <br />
					${notificationList.notificationSeq} <br />
					${notificationList.friendEmail} <br />
				</c:when>
				<c:when test="${notificationList.notificationCode == 4}">
					공유신청 <br />
					${notificationList.notificationSeq} <br />
					${notificationList.boardSeq} <br />
				</c:when>
				<c:when test="${notificationList.notificationCode == 6}">
					댓글 <br />
					${notificationList.notificationSeq} <br />
					${notificationList.replySeq} <br />
				</c:when>
			</c:choose>
			
			${notificationList.notificationCode} <br />
			
		</c:forEach>
	</div>
</section>