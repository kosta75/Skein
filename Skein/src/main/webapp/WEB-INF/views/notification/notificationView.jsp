<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="content-container">
	<div class="notification-content-wrapper">
	
		
		<c:forEach var="notifList" items="${notificationList}">
			
			<c:choose>
				<c:when test="${notifList.notificationCode == 1}">
					공지사항 <br />
					${notifList.notificationSeq} <br />
				</c:when>
				<c:when test="${notifList.notificationCode == 2}">
					<div>
						친구 신청 <br />
						${notifList.notificationSeq} <br />
						${notifList.friendEmail} <br />
						<div class="friendship-approved" data-uri="${notifList.personalURI}" data-notificationseq="${notifList.notificationSeq}">친구 수락</div>
					</div>
				</c:when>
				<c:when test="${notifList.notificationCode == 4}">
					공유신청 <br />
					${notifList.notificationSeq} <br />
					${notifList.boardSeq} <br />
					<div class="reply-notification-confirm">공유 수락</div>
				</c:when>
				<c:when test="${notifList.notificationCode == 6}">
					<div>
					댓글 <br />
					${notifList.notificationSeq} <br />
					${notifList.replySeq} <br />
					<div class="reply-notification-confirm">알림 확인</div>
					</div>
				</c:when>
			</c:choose>
			
			
			
		</c:forEach>
	</div>
</section>
<script src="${pageContext.request.contextPath}/resources/js/notification.js"></script>