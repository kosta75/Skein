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
	
	//console.log(ListObj);
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
			}else if(data.shareNotification != null){
				notificationObject = data.shareNotification;
			}else if(data.replyNotification != null){
				notificationObject = data.replyNotification;
			}

			var codeClass = "";
			var iconName = "";
			switch(notificationCode){
				case 1:
					codeClass = 'sending-notice-code';
					iconName= ""; //공지 아이콘 설정
					break;
				case 2:
					//console.log(notificationObject)
					//console.log(notificationObject.friendEmail)
					//console.log(profileImageFileName);
					
					codeClass = 'sending-friendship-code';
					
					if(notificationObject.friendshipConfirm > 0){
						var infoAddText = "<div class='sending-notification-info'>";
						infoAddText += "<strong><a href='"+getContextPath()+"/"+notificationSenderURI+"'>"+notificationSenderName + "("+ notificationSenderURI  +")</a></strong>님과 친구를 맺었습니다.</div>";
						infoAddText += "<div class='notification-user-profile-wrapper'>"
						infoAddText += "<div class='notification-user-profile-image'>";
						if(profileImageFileName != '' && profileImageFileName != null){
							infoAddText += "<img src='"+getContextPath()+"/resources/user-profile-image/"+profileImageFileName+"' />";
						}else{
							infoAddText += "<img src='"+getContextPath()+"/resources/user-profile-image/default-profile-image.png' />";
						}
						infoAddText += "</div>";
						
						
						if(profileCounter > 1){
							infoAddText += "<div class='public-user-info'><ul>";
							
							if(birthDay.trim() != '' && birthDay != null){
								infoAddText += "<li>";
								infoAddText += "<div class='public-user-info-wrapper'>";
								infoAddText += "<div class='public-user-info-key'>생일</div>";
								infoAddText += "<div class='public-user-info-value'>"+birthDay+"</div>";
								infoAddText += "</div>";
								infoAddText += "</li>";
							}
							
							if(publicEmail.trim() != '' && publicEmail != null){
								infoAddText += "<li>";
								infoAddText += "<div class='public-user-info-wrapper'>";
								infoAddText += "<div class='public-user-info-key'>이메일</div>";
								infoAddText += "<div class='public-user-info-value'>"+publicEmail+"</div>";
								infoAddText += "</div>";
								infoAddText += "</li>";
							}
							
							if(phoneNumber.trim() != '' && phoneNumber != null){
								infoAddText += "<li>";
								infoAddText += "<div class='public-user-info-wrapper'>";
								infoAddText += "<div class='public-user-info-key'>휴대전화번호</div>";
								infoAddText += "<div class='public-user-info-value'>"+phoneNumber+"</div>";
								infoAddText += "</div>";
								infoAddText += "</li>";
							}
							
							if(address.trim() != '' && address != null){
								infoAddText += "<li>";
								infoAddText += "<div class='public-user-info-wrapper'>";
								infoAddText += "<div class='public-user-info-key'>사는 곳</div>";
								infoAddText += "<div class='public-user-info-value'>"+address+"</div>";
								infoAddText += "</div>";
								infoAddText += "</li>";
							}
																							
							if(stateMessage.trim() != '' && stateMessage != null){
								infoAddText += "<li>";
								infoAddText += "<div class='public-user-info-wrapper'>";
								infoAddText += "<div class='public-user-info-key'>상태글</div>";
								infoAddText += "<div class='public-user-info-value'>"+stateMessage+"</div>";
								infoAddText += "</div>";
								infoAddText += "</li>";
							}
							
							if(blog.trim() != '' && blog != null){
								infoAddText += "<li>";
								infoAddText += "<div class='public-user-info-wrapper'>";
								infoAddText += "<div class='public-user-info-key'>블로그</div>";
								infoAddText += "<div class='public-user-info-value'>"+blog+"</div>";
								infoAddText += "</div>";
								infoAddText += "</li>";
							}
							
							if(religion.trim() != '' && religion != null){
								infoAddText += "<li>";
								infoAddText += "<div class='public-user-info-wrapper'>";
								infoAddText += "<div class='public-user-info-key'>종교</div>";
								infoAddText += "<div class='public-user-info-value'>"+religion+"</div>";
								infoAddText += "</div>";
								infoAddText += "</li>";
							}
							if(politics.trim() != '' && politics != null){
								infoAddText += "<li>";
								infoAddText += "<div class='public-user-info-wrapper'>";
								infoAddText += "<div class='public-user-info-key'>정치성향</div>";
								infoAddText += "<div class='public-user-info-value'>"+politics+"</div>";
								infoAddText += "</div>";
								infoAddText += "</li>";
							}
							if(language.trim() != '' && language != null){
								infoAddText += "<li>";
								infoAddText += "<div class='public-user-info-wrapper'>";
								infoAddText += "<div class='public-user-info-key'>언어</div>";
								infoAddText += "<div class='public-user-info-value'>"+language+"</div>";
								infoAddText += "</div>";
								infoAddText += "</li>";
							}

							infoAddText += "</ul></div>";
							infoAddText += "</div>";
						}else{
							infoAddText += "<div class='public-user-info-none'>공개된 사용자 프로필 정보가 존재하지 않습니다.</div>";
						}
						
						
					}else{
						var infoAddText = "<div class='sending-notification-info'>" +
								"<strong><a href='"+getContextPath()+"/"+notificationSenderURI+"'>"+notificationSenderName + "("+ notificationSenderURI  +")</a></strong>님 께서 친구가 되기를 원합니다." +
										"</div>" +
										"<div class='confirm-button-wrapper friendship-confirm-button-wrapper'>" +
										"<button class='friendship-confirm-ok' data-notificationseq='"+notificationSeq+"' data-notificationcode='"+ notificationCode +"' data-personaluri='"+notificationSenderURI+"' data-name='"+notificationSenderName+"' data-senderuri='"+notificationSenderURI+"' data-sendername='"+notificationSenderName+"'>수락</button>" +
										"<button class='friendship-confirm-reject' data-notificationseq='"+notificationSeq+"' data-notificationcode='"+ notificationCode +"' data-personaluri='"+notificationSenderURI+"' data-name='"+notificationSenderName+"' data-senderuri='"+notificationSenderURI+"' data-sendername='"+notificationSenderName+"'>거절</button>" +
										"</div>";
					}
					
					
					$('.notification-info-wrapper').append(infoAddText);
					
					break;
				case 4:
					codeClass = 'sending-share-code';
					boardCommand = notificationObject.memberBoardCommand;
					var profileImg = "";
					
					
					if(notificationObject.profileImageFileName != null && notificationObject.profileImageFileName.trim() != ''){
						profileImg = notificationObject.profileImageFileName;
					}else{
						profileImg = 'default-profile-image.png';
					}
					
					
					
					if(notificationObject.shareConfirm > 0){
						var infoAddText = "";
						if(notificationObject.shareType > 0){
							//내 글에 대한 공유 신청
							var infoAddText = "<div class='sending-notification-info'>";
							infoAddText += "<strong><a href='"+getContextPath()+"/"+notificationSenderURI+"'>"+notificationSenderName + "("+ notificationSenderURI  +")</a></strong>님의 글타래 공유 요청을 수락 했습니다.";
							infoAddText += "</div>";
							
							infoAddText += "<div class='content-thumb'>";
							infoAddText += "<div class='notification-sender-profile-image'><div class='notification-sender-profile-image-wrapper'><img src='"+getContextPath()+"/resources/user-profile-image/"+profileImg+"'/></div><span>"+boardCommand.fullName+ "("+boardCommand.personalURI+")"+"</span></div>";
							
							if(boardCommand.fileName != null && boardCommand.fileName.trim() != ''){
								infoAddText += "<div class='thumb-image-wrapper'><img src='"+getContextPath()+"/resources/upload/"+boardCommand.fileName+"' /></div>";
							}
							
							infoAddText += "<div class='thumb-content'>"+ boardCommand.content +"</div>"
							infoAddText += "</div>";
							
						}else{
							//상대방이 나에게 글을 내보내기 해줌
							var infoAddText = "<div class='sending-notification-info'>";
							infoAddText += "<strong><a href='"+getContextPath()+"/"+notificationSenderURI+"'>"+notificationSenderName + "("+ notificationSenderURI  +")</a></strong>님의 글타래를 공유하였습니다.";
							infoAddText += "</div>";
							
							infoAddText += "<div class='content-thumb'>";
							infoAddText += "<div class='notification-sender-profile-image'><div class='notification-sender-profile-image-wrapper'><img src='"+getContextPath()+"/resources/user-profile-image/"+profileImg+"'/></div><span>"+boardCommand.fullName+ "("+boardCommand.personalURI+")"+"</span></div>";
							
							if(boardCommand.fileName != null && boardCommand.fileName.trim() != ''){
								infoAddText += "<div class='thumb-image-wrapper'><img src='"+getContextPath()+"/resources/upload/"+boardCommand.fileName+"' /></div>";
							}
							
							infoAddText += "<div class='thumb-content'>"+ boardCommand.content +"</div>"
							infoAddText += "</div>";
							
						}
						
					}else{
						
						var infoAddText = "";
						if(notificationObject.shareType > 0){
							//내 글에 대한 공유 신청
							infoAddText += "<div class='sending-notification-info'>" +
							"<strong><a href='"+getContextPath()+"/"+notificationSenderURI+"'>"+notificationSenderName + "("+ notificationSenderURI  +")</a></strong>님 께서 글타래 공유를 신청하셨습니다." +
							
							"</div>" +
							"<div class='content-thumb'>"+
							
							"<div class='notification-sender-profile-image'><div class='notification-sender-profile-image-wrapper'><img src='"+getContextPath()+"/resources/user-profile-image/"+profileImg+"'/></div><span>"+boardCommand.fullName+ "("+boardCommand.personalURI+")"+"</span>"
							
							+"</div>";
							if(boardCommand.fileName != null && boardCommand.fileName.trim() != ''){
								infoAddText += "<div class='thumb-image-wrapper'><img src='"+getContextPath()+"/resources/upload/"+boardCommand.fileName+"' /></div>";
							}
							
							infoAddText += "<div class='thumb-content'>"+ boardCommand.content +"</div>"
							+"</div>"+
							"<div class='confirm-button-wrapper share-confirm-button-wrapper'>" +
							"<div class='share-confirm-help-message'>공유를 수락 하시겠습니까?</div>"+
							"<button class='send-share-confirm-ok' data-notificationseq='"+notificationSeq+"' data-personaluri='"+notificationSenderURI+"' data-name='"+notificationSenderName+"'>수락하기</button>" +
							"<button class='send-share-confirm-reject' data-notificationseq='"+notificationSeq+"' data-personaluri='"+notificationSenderURI+"' data-name='"+notificationSenderName+"'>거절하기</button>" +
							"</div>";
						}else{
							//상대방이 글을 내보내기 해줌
							infoAddText += "<div class='sending-notification-info'>" +
							"<strong><a href='"+getContextPath()+"/"+notificationSenderURI+"'>"+notificationSenderName + "("+ notificationSenderURI  +")</a></strong>님 께서 글타래를 보내셨습니다." +
							
							"</div>" +
							"<div class='content-thumb'>"+
							
							"<div class='notification-sender-profile-image'><div class='notification-sender-profile-image-wrapper'><img src='"+getContextPath()+"/resources/user-profile-image/"+profileImg+"'/></div><span>"+notificationSenderName+ "("+notificationSenderURI+")"+"</span>"
							
							+"</div>";
							if(boardCommand.fileName != null && boardCommand.fileName.trim() != ''){
								infoAddText += "<div class='thumb-image-wrapper'><img src='"+getContextPath()+"/resources/upload/"+boardCommand.fileName+"' /></div>";
							}
							
							infoAddText += "<div class='thumb-content'>"+ boardCommand.content +"</div>"
							+"</div>"+
							"<div class='confirm-button-wrapper share-confirm-button-wrapper'>" +
							"<div class='share-confirm-help-message'>글타래를 공유 하시겠습니까?</div>"+
							"<button class='send-share-confirm-ok' data-notificationseq='"+notificationSeq+"' data-personaluri='"+notificationSenderURI+"' data-name='"+notificationSenderName+"'>공유하기</button>" +
							"<button class='send-share-confirm-reject' data-notificationseq='"+notificationSeq+"' data-personaluri='"+notificationSenderURI+"' data-name='"+notificationSenderName+"'>거절하기</button>" +
							"</div>";
						}
						
					}

					$('.notification-info-wrapper').append(infoAddText);
					break;
				case 6:
					codeClass = 'sending-reply-code';
					
					
					
					//내글에 댓글을 작성한 정보
					var infoAddText = "<div class='sending-notification-info'>";
					infoAddText += "<strong><a href='"+getContextPath()+"/"+notificationSenderURI+"'>"+notificationSenderName + "("+ notificationSenderURI  +")</a></strong>님이 댓글을 작성하였습니다.";
					infoAddText += "</div>";
					
					infoAddText += "<div class='reply-content-wrapper'>";
					infoAddText += notificationObject.replyContent + " / " + notificationObject.writeDate;
					infoAddText += "</div>";
					
					$('.notification-info-wrapper').append(infoAddText);
					
					break;
			}
			
			$(".sending-notification-code").html("<div class='"+codeClass+"'></div>");
			
		},error:function(){
			alert('알림 상세 정보 요청 중 오류가 발생하였습니다. ERROR_CODE : 3425');
		}
	});
}


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
		//var requestObject = $(this);
		//console.log(requestObject);
		
		$.ajax({
			type: 'POST',
			url: requestContextPath,
			data: 'personalURI='+ notificationSenderURI +'&notificationSeq=' + notificationSeq,
			success:function(data){
				$('.notification-info-wrapper').empty();
				/*var infoAddText = "<div class='sending-notification-info'><strong>"+notificationSenderName + "("+ notificationSenderURI  +")</strong>님과 친구를 맺었습니다.</div>";
				$('.notification-info-wrapper').append(infoAddText);*/
				
				
				var targetObject = $("#notificationItemSeq-"+notificationSeq);
				//console.log(targetObject);
				targetObject.addClass('notification-read');
				$("#notificationReadButton").addClass('readed').removeClass('un-read');
				countOfUnCheckNotificationList();
				getNotificationDetailInfo(targetObject);
			},error:function(){
				alert('친구 등록 요청 중 오류가 발생하였습니다. ERROR_CODE : 4422');
			}
		});
	});
	
	//글타래 공유하기 버튼!
	$(document).on('click', '.send-share-confirm-ok', function(){
		var requestMapping = "/share/add";
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
				/*var infoAddText = "<div class='sending-notification-info'><strong>"+notificationSenderName + "("+ notificationSenderURI  +")</strong>님과 친구를 맺었습니다.</div>";
				$('.notification-info-wrapper').append(infoAddText);*/
				
				var targetObject = $("#notificationItemSeq-"+notificationSeq);
				//console.log(targetObject);
				targetObject.addClass('notification-read');
				$("#notificationReadButton").addClass('readed').removeClass('un-read');
				countOfUnCheckNotificationList();
				getNotificationDetailInfo(targetObject);
			},error:function(){
				alert('글타래 공유 수락 요청 중 오류가 발생하였습니다. ERROR_CODE : 4422');
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

