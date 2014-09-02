var address;
var profileImageFileName;
var publicEmail;
var phoneNumber;
var stateMessage;
var religion;
var politics;
var language;
var blog;
var birthDay;
var profileCounter;

function initFrienshipProfile(ListObj){
	address = "";
	profileImageFileName = "";
	publicEmail = "";
	phoneNumber = "";
	stateMessage = "";
	religion = "";
	politics = "";
	language ="";
	blog = "";
	birthDay = "";
	profileCounter = 0;
	
	console.log(ListObj);
	profileCounter = ListObj.length;
	
	for(var i=0;i<ListObj.length;i++){
		switch(ListObj[i].profileCode){
			case 1 :
				address = ListObj[i].profileInfo;
				break;
			case 2 :
				profileImageFileName = ListObj[i].profileInfo;
				break;
			case 3 :
				publicEmail = ListObj[i].profileInfo;
				break;
			case 4 :
				phoneNumber = ListObj[i].profileInfo;
				break;
			case 5 :
				stateMessage = ListObj[i].profileInfo;
				break;
			case 6 :
				religion = ListObj[i].profileInfo;
				break;
			case 7 :
				politics = ListObj[i].profileInfo;
				break;
			case 8 :
				language = ListObj[i].profileInfo;
				break;
			case 9 :
				blog = ListObj[i].profileInfo;
				break;
			case 10 :
				birthDay = ListObj[i].profileInfo;
				break;
		}
	}
}

function getNotificationDetailInfo(obj){
	var requestMapping = "/notification/notificationDetailInfo";
	var requestContextPath = getContextPath() + requestMapping;
	
	var notificationSeq = obj.data("notificationseq");
	var notificationCode = obj.data("notificationcode");
	var notificationSenderName = obj.data("sendername");
	var notificationSenderURI = obj.data("senderuri");
	
	$.ajax({
		type: 'POST',
		url: requestContextPath,
		data:"notificationSeq=" + notificationSeq +"&notificationCode=" + notificationCode,
		success: function(data){
			$('.notification-info-wrapper').empty();

			var notificationObject;
			if(data.friendshipNotification != null){
				initFrienshipProfile(data.friendshipNotification.memberProfileList);
				notificationObject = data.friendshipNotification;
			}

			var codeClass = "";
			switch(notificationCode){
				case 1:
					codeClass = 'sending-notice-code';
					break;
				case 2:
					//console.log(notificationObject)
					//console.log(notificationObject.friendEmail)
					console.log(profileImageFileName);
					
					codeClass = 'sending-friendship-code';
					if(notificationObject.friendshipConfirm > 0){
						var infoAddText = "<div class='sending-notification-info'>";
						infoAddText += "<strong>"+notificationSenderName + "("+ notificationSenderURI  +")</strong>님과 친구를 맺었습니다.</div>";
						if(profileImageFileName != '' && profileImageFileName != null){
							infoAddText += "<div class='notification-user-profile-image'><img src='"+getContextPath()+"/resources/user-profile-image/"+profileImageFileName+"' />";
							if(profileCounter > 1){
								infoAddText += "";
							}else{
								infoAddText += "<div class='public-user-info-none'>공개된 사용자 프로필 정보가 존재하지 않습니다.</div>";
							}
							infoAddText += "</div>";
						}else{
							infoAddText += "<div class='notification-user-profile-image'><img src='"+getContextPath()+"/resources/user-profile-image/default-profile-image.png' />";
							if(profileCounter > 1){
								infoAddText += "";
							}else{
								infoAddText += "<div class='public-user-info-none'>공개된 사용자 프로필 정보가 존재하지 않습니다.</div>";
							}
							infoAddText += "</div>";
						}
						
						
					}else{
						var infoAddText = "<div class='sending-notification-info'>" +
								"<strong>"+notificationSenderName + "("+ notificationSenderURI  +")</strong>님 께서 친구가 되기를 원합니다." +
										"</div>" +
										"<div class='friendship-confirm-button-wrapper'>" +
										"<button class='friendship-confirm-ok' data-notificationseq='"+notificationSeq+"' data-personaluri='"+notificationSenderURI+"' data-name='"+notificationSenderName+"'>수락</button>" +
										"<button class='friendship-confirm-reject' data-notificationseq='"+notificationSeq+"' data-personaluri='"+notificationSenderURI+"' data-name='"+notificationSenderName+"'>거절</button>" +
										"</div>";
					}
					
					
					$('.notification-info-wrapper').append(infoAddText);
					
					break;
				case 4:
					codeClass = 'sending-share-code';
					
					
					
					break;
				case 6:
					codeClass = 'sending-reply-code';
					break;
			}
			
			$(".sending-notification-code").html("<div class='"+codeClass+"'></div>");
			
		},error:function(){
			alert('알림 상세 정보 요청 중 오류가 발생하였습니다. ERROR_CODE : 3425');
		}
	});
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
	
	
	//처음 알림 정보 가져오기
	if($(".notification-item-selected").length > 0){
		getNotificationDetailInfo($(".notification-item-selected"));
	}
	
	//알림 정보 클릭시 가져오기
	$(document).on('click', '.notification-item-container', function(){
		$('.notification-item-container').removeClass('notification-item-selected');
		$(this).addClass('notification-item-selected');
		getNotificationDetailInfo($(this));
	});
	
	//친구 수락 버튼!
	$(document).on('click', '.friendship-confirm-ok', function(){
		var requestMapping = "/friendship/add";
		var requestContextPath = getContextPath() + requestMapping;
		
		var notificationSeq = $(this).data("notificationseq");
		var notificationSenderURI = $(this).data("personaluri"); 
		var notificationSenderName = $(this).data("name");
		
		$.ajax({
			type: 'POST',
			url: requestContextPath,
			data: 'personalURI='+ notificationSenderURI +'&notificationSeq=' + notificationSeq,
			success:function(data){
				$('.notification-info-wrapper').empty();
				var infoAddText = "<div class='sending-notification-info'><strong>"+notificationSenderName + "("+ notificationSenderURI  +")</strong>님과 친구를 맺었습니다.</div>";
				$('.notification-info-wrapper').append(infoAddText);
				countOfUnCheckNotificationList();
			},error:function(){
				alert('친구 등록 요청 중 오류가 발생하였습니다. ERROR_CODE : 4422');
			}
		});
	});
	
	//알림 읽기 버튼
	$(document).on('click', '.un-read', function(){
		
		var requestMapping = "/notification/notificationRead";
		var requestContextPath = getContextPath() + requestMapping;
		console.log(requestContextPath);
		var notificationSeq = $(this).parent().data("notificationseq");
		var currentObject = $(this);
		console.log(notificationSeq);
		$.ajax({
			type: 'POST',
			url: requestContextPath,
			data: 'notificationSeq=' + notificationSeq,
			success: function(data){
				currentObject.removeClass('un-read').addClass('readed');
				currentObject.parent().addClass('notification-read');
				countOfUnCheckNotificationList();
			},error: function(data){
				alert("알림 읽기 처리 요청 중 에러 발생 ERROR_CODE : 1231");
			}
		});
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

