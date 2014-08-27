<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
/* ================ DOCK 1 ================ */
#dock { position: relative; top:25px; left:210px;}
.dock-container { position: relative; top: -8px; height: 50px; padding-left: 20px; }
a.dock-item { display: block; width: 50px; position: absolute; bottom: 0; text-align: center; text-decoration: none; color: #333; }
.dock-item span { display: none; padding-left: 20px; }
.dock-item img { border: 0; margin: 5px 10px 0px; width: 100%; }
</style>	
<section class="content-container">
	<div class="notification-content-wrapper"
		style="height: 600px; width: 760px; background-color: white; border-radius: 8px 8px 8px 8px;">
		<p style="text-align: center;">
			<b style="font-size: 20px;">!Alram Page!</b>
		<p>
		<div id="dock">
				<div class="dock-container" style=" left: 503px; width: 400px; ">
					<a class="dock-item" href="#" style="width: 50px; left: 0px;"><span style="display: none;"></span><input type="hidden" value="1"><img data-dataSeq="1" src="${pageContext.request.contextPath}/resources/media/image/dock/all.gif" alt="home"></a> 
					<a class="dock-item" href="#" style="width: 50px; left: 50px;"><span style="display: none;">Notice</span><input type="hidden" value="2"><img data-dataSeq="2" src="${pageContext.request.contextPath}/resources/media/image/dock/notice.gif" alt="contact"></a> 
					<a class="dock-item" href="#" style="width: 50px; left: 100px;"><span style="display: none;">Friend</span><input type="hidden" value="3"><img data-dataSeq="3" src="${pageContext.request.contextPath}/resources/media/image/dock/friend.gif" alt="portfolio"></a> 
					<a class="dock-item" href="#" style="width: 50px; left: 150px;"><span style="display: none;">Board</span><input type="hidden" value="4"><img data-dataSeq="4" src="${pageContext.request.contextPath}/resources/media/image/dock/board.gif" alt="music"></a> 
					<a class="dock-item" href="#" style="width: 50px; left: 200px;"><span style="display: none;">Reply</span><input type="hidden" value="5"><img data-dataSeq="5" src="${pageContext.request.contextPath}/resources/media/image/dock/reply.gif" alt="video"></a> 
				</div><!-- end div .dock-container -->
			</div>
			
		<div class="notification-top-menu" style="border-bottom: 4px solid red; clear: both; background-color: white; height:30px;">
		<input type="checkbox">전체 선택
			<input type="checkbox">전체 해제
		</div>
		<div class="notification-middle-menu" style="clear: both; ">
<!--글 내용 들어가는 곳  -->
<!-- <div class="alram-page-list-div" style="border-bottom: solid 1px blue ; clear:both; height:30px;">
				<input type="checkbox"style="float: left;">
				<div style="float: left;">[공지사항]</div>
				<div style="float: left;">안녕하세요 ...업데이트 관련 공지사항입니다.</div>
				<div style="float: right;">2014/07/31</div>
			</div> 
-->	
<!--/////////////////성실이 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->
			<c:forEach var="notificationList" items="${notificationList}">
			<c:choose>
				<c:when test="${notificationList.notificationCode == 1}">
					공지사항 <br />
					${notificationList.notificationSeq} <br />
				</c:when>
				<c:when test="${notificationList.notificationCode == 2}">
					<div>
						친구 신청 <br />
						${notificationList.notificationSeq} <br />
						${notificationList.friendEmail} <br />
						<div class="friendship-approved" data-notificationseq="${notificationList.notificationSeq}" data-friendemail="${notificationList.friendEmail}">친구 수락</div>
					</div>
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

<!--///////////////////////////////////////////////////////////////////////////////////////////////////////////  -->
			<div style="border-bottom: solid 1px blue ; clear:both;height:30px; ">
				<input type="checkbox" style="float: left;">
				<div style="float: left;">[댓글]</div>
				<div style="float: left;">test! 님이 admin님에게 댓글을 남겼습니다.</div>
				<div style="float: right;">2014/07/31</div>
			</div>
			
		</div>
		<div class="notification-bottom-menu" style="clear: both; background-color: skyblue; height: 100px;widht:100%;">
			
		</div>
		
	</div>
</section>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/alram/fisheye-iutil.min.js"></script> 

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/alram/dock-example1.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/notificationView.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/alram/jquery.jqDock.min.js"></script>


<script src="${pageContext.request.contextPath}/resources/js/notification.js"></script>