<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
/* ================ DOCK 1 ================ */
#dock { position: relative; top:25px; left:210px;}
.dock-container { position: relative; top: -8px; height: 50px; padding-left: 20px; }
a.dock-item { display: block; width: 50px; position: absolute; bottom: 0; text-align: center; text-decoration: none; color: #333; }
.dock-item span { display: none; padding-left: 20px; }
.dock-item img { border: 0; margin: 5px 10px 0px; width: 100%; }
</style>	


<section class="content-container">
	<div class="notification-content-wrapper">
		<!-- <div class="notification-guide-title">
			<h3>알림</h3>
		</div> -->
		
		
		
		<div class="notification-middle-menu">
			<div class="notification-list-container">
			
				<div class="notification-list-title">
					최근 알림
				</div>
				
				<header class="notification-list-header">
					<div class="notification-read-confirm">확인</div>
					<div class="notification-create-date">날짜</div>
					<div class="notification-item-code">활동</div>
					<div class="notification-message">내용</div>
				</header>
			
				<ul>
				<c:forEach var="notificationList" items="${notificationList}" varStatus="c">
					<fmt:formatDate value="${notificationList.createDate}" pattern="YY. MM. dd." var="createDate" />
					<c:set var="notificationCode" value=""></c:set>
					<c:set var="notificationMessage" value=""></c:set>
					<c:choose>
						<c:when test="${notificationList.notificationCode == 1}">
							<c:set var="notificationCode" value="notice-code"></c:set>
							<c:set var="notificationMessage"></c:set>
						</c:when>
						<c:when test="${notificationList.notificationCode == 2}">
							<c:set var="notificationCode" value="friendship-code"></c:set>
							<c:set var="notificationMessage">님이 친구 신청을 하였습니다.</c:set>
						</c:when>
						<c:when test="${notificationList.notificationCode == 4}">
							<c:set var="notificationCode" value="share-code"></c:set>
							<c:set var="notificationMessage">님이 공유 신청을 하였습니다.</c:set>
						</c:when>
						<c:when test="${notificationList.notificationCode == 6}">
							<c:set var="notificationCode" value="reply-code"></c:set>
							<c:set var="notificationMessage">님이 댓글을 작성하였습니다.</c:set>
						</c:when>
					</c:choose>
					
					<li>
						<div class="notification-item-container${(c.index == 0) ? ' notification-item-selected':''}${(notificationList.isRead != 0) ? ' notification-read':''}" data-notificationseq="${notificationList.notificationSeq}" data-notificationcode="${notificationList.notificationCode}" data-sendername="${notificationList.notificationSenderName}" data-senderuri="${notificationList.notificationSenderURI}">
							<div class="notification-read-button${(notificationList.isRead == 0) ? ' un-read':' readed'}">R</div>
							<div class="notification-create-date">${createDate}</div>
							
							<div class="notification-item-code ${notificationCode}"></div>
							<div class="notification-message">
								<c:choose>
									<c:when test="${notificationList.notificationCode == 1}">
										 
									</c:when>
									<c:otherwise>
										<span>${notificationList.notificationSenderName}(${notificationList.notificationSenderURI})</span>${notificationMessage}
									</c:otherwise>
								</c:choose>
							</div>
							
						</div>
					</li>				
				</c:forEach>
				</ul>
			</div>
			<div class="notification-item-detial-container">
				<div class="notification-sender-info-wrapper">
					<div class="sending-notification-code"></div>
				</div>
				<div class="notification-info-wrapper">
				</div>
			</div>
		</div>
		<div class="notification-bottom-menu">
		</div>		
	</div>
</section>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/alram/dock-example1.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/alram/fisheye-iutil.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/notification.js"></script>




