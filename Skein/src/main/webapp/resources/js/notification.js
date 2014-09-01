function getNotificationDetailInfo(obj){
	var requestMapping = "/notification/notificationDetailInfo";
	var requestContextPath = getContextPath() + requestMapping;
	
	var notificationSeq = obj.data("notificationseq");
	var notificationCode = obj.data("notificationcode");
	$.ajax({
		type: 'POST',
		url: requestContextPath,
		data:"notificationSeq=" + notificationSeq +"&notificationCode=" + notificationCode,
		success: function(data){
			console.log(data)
			console.log(data.friendshipNotification)
			initFrienshipProfile(data.friendshipNotification.memberProfileList);
		},error:function(){
			alert('알림 상세 정보 요청 중 오류가 발생하였습니다. ERROR_CODE : 3425');
		}
	});
}



var address;
var profileImageFileName;
var publicEmail;
var phoneNumber;
var stateMessage;
var religion;
var politics;
var blog;
var birthDay;




function initFrienshipProfile(ListObj){
	var address = "";
	var profileImageFileName = "";
	var publicEmail = "";
	var phoneNumber = "";
	var stateMessage = "";
	var religion = "";
	var politics = "";
	var blog = "";
	var birthDay = "";
	
	console.log(ListObj);
	
	for(var i=0;i<ListObj.length;i++){
		
	}
}


/*
<div class="friend-item-container">
	<div class="friend-image-wrapper">
	<!-- 1 사는곳 2 프로필 사진 3 공개이메일 4 휴대폰번호 5 상태글 6종교 7정치성향 8 언어 9 블로그 10 생일 -->
	<c:forEach var="profileList" items="${friendshipList.memberProfileList}">
		<c:choose>
			<c:when test="${profileList.profileCode == 1}">
				<c:set var="address" value="${profileList}"></c:set>
			</c:when>
			<c:when test="${profileList.profileCode == 2}">
				<c:set var="profileImageFileName" value="${profileList}"></c:set>
			</c:when>
			<c:when test="${profileList.profileCode == 3}">
				<c:set var="publicEmail" value="${profileList}"></c:set>
			</c:when>
			<c:when test="${profileList.profileCode == 4}">
				<c:set var="phoneNumber" value="${profileList}"></c:set>
			</c:when>
			<c:when test="${profileList.profileCode == 5}">
				<c:set var="stateMessage" value="${profileList}"></c:set>
			</c:when>
			<c:when test="${profileList.profileCode == 6}">
				<c:set var="religion" value="${profileList}"></c:set>
			</c:when>
			<c:when test="${profileList.profileCode == 7}">
				<c:set var="politics" value="${profileList}"></c:set>
			</c:when>
			<c:when test="${profileList.profileCode == 8}">
				<c:set var="language" value="${profileList}"></c:set>
			</c:when>
			<c:when test="${profileList.profileCode == 9}">
				<c:set var="blog" value="${profileList}"></c:set>
			</c:when>
			<c:when test="${profileList.profileCode == 10}">
				<c:set var="birthDay" value="${profileList}"></c:set>
			</c:when>*/

$(document).ready(function(){
	getNotificationDetailInfo($(".notification-item-selected"));
	
	
	$(document).on('click', '', function(){
		
	});
	
	
	$(".friendship-approved").on('click', function(){
		var obj = $(this);
		//console.log($(this).data("notificationseq"));
		$.ajax({
			type : 'post',
			url : '../friendship/add',
			data : 'personalURI=' + $(this).data("uri") + "&notificationSeq=" + $(this).data("notificationseq"),
			cache : false,
			success : function(data) {
				obj.remove();
				location.reload();
			},
			error : function() {
				alert('친구 신청 요청 오류...');
			}
		});
	});
	
////////////////////////////////////////////////////////////////////////////////////
	/*var jqDockOpts = {align: 'left', duration: 200, labels: 'tc', size: 48, distance: 85};
	$('#jqDock').jqDock(jqDockOpts);
	*/

	/*$('.dock-item').click(function(){
		var alramSeq = $(this).find('input').val();
		console.log(alramSeq);
		alert(alramSeq);

		$.ajax({
			type : 'get',
			url : 'notification/listsort',
			cache : false,
			data : 'alramSeq=' + alramSeq,
			success : function(data) {
				alert(data);
				
				
			},
			error : function() {
				alert('indexlogged notification 35 : Error while request..');
			}
		});

		return false;
	});*/
	
	$(document).on('click',"#alram-checkbox-all", function() {
		console.log("click1");
		
		$('input[type=checkbox]').prop("checked",true);
		return false;
	});
	$(document).on('click',"#alram-checkbox-clear", function() {
		console.log("click2");
		$('input[type=checkbox]').prop("checked",false);
		return false;
	});
	
	$(document).on('mouseover',".notification-list-div", function() {
		//console.log(aaa);
		$(this).css("background-color", "blanchedalmond");
	});
	$(document).on('mouseout',".notification-list-div", function(){
		$(this).css("background-color", "white");
	});
});

