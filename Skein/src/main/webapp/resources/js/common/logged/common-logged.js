//알림 목록 읽기
function countOfUnCheckNotificationList(){
	var requestMapping = "/notification/notificationCountList";
	var requestContextPath = getContextPath() + requestMapping;
	
	$.ajax({
		type : 'POST',
		url : requestContextPath,
		dataType : 'JSON',
		success : function(data) {
			var responseObject = data.notificationList;
			var totalNotificationCount = 0;
			var notificationText = "";
			
			$.each(responseObject, function(key, notification){
				totalNotificationCount += notification.groupCount;
				
				var responseMessage = "";
				
				/* [1]공지사항 [2]친구신청 [3]친구신청수락 [4]공유신청 [5]공유신청수락 [6]댓글 */
				switch (notification.notificationCode) {
				  case 1 : responseMessage = "공지사항";
					  break;
				  case 2 : responseMessage = "친구신청";
					  break;
				  case 4 : responseMessage = "공유신청";
					  break;
				  case 6 : responseMessage = "댓글";
					  break;
				}
				
				notificationText += "<li>";
				notificationText +="<div class='notification-info'><span class='notification-code'>"+responseMessage+"</span>";
				notificationText += "<span class='notification-count'>" + notification.groupCount+"</span>개의 알림이 있습니다.</div>";			
				notificationText += "</li>";
				
			});
			
			if(totalNotificationCount >0){
				$("#notificationCounter").show();
				$(".notification-title").show();
				$(".notification-count-number").text(totalNotificationCount);
				$(".notification-list").empty();
				$(".notification-list").append(notificationText);
			}else{
				$("#notificationCounter").hide();
				$(".notification-title").hide();
				$(".notification-count-number").text(totalNotificationCount);
				$(".notification-list").empty();
				
				notificationText = "<div class='not-exist'><span>읽지 않은 알림이 없습니다.</span></div>";
				if($(".not-exist").length == 0){
					$("#notificationListContainer").append(notificationText);
				}
			}
		},
		error : function(data) {
			clearInterval(runningCheckNotification);
			alert("알림 목록을 요청하는 동안 오류가 발생했습니다.(ERROR CODE : N0001)");
		}
	});
}

$(document).ready(function(){
	
	//알림 목록 읽기
	countOfUnCheckNotificationList();
	runningCheckNotification = setInterval("countOfUnCheckNotificationList()", 30000);

	//var requestMapping = "/notification/notificationCountList";
	//var requestContextPath = getContextPath() + requestMapping;
	
	$(".confirm-btn").on('click', function(){
		var requestMapping = "/notification/notificationAllRead";
		var requestContextPath = getContextPath() + requestMapping;
		$.ajax({
			type : 'post',
			url : requestContextPath,
			success : function(){
				$('.notification-item-container').addClass('notification-read');
				$(".un-read").addClass('readed').removeClass('un-read');
				$('#notificationListContainer').hide("slide", {direction: "up"});
				countOfUnCheckNotificationList();
				//location.reload();
			}
		});
	});
	
	///////////////색깔변경////////////////
	var color = $(".header-container").css("background-color");
	var colorBarClicked = false;
	
	$('#changeBackgroundColor li').on('mouseover', function() {
		$('.header-container').css("background-color",	$(this).css("background-color"));
		$('.header-container').css("background-color",	$(this).css("background-color"));
		$('.sub-user-profile-tip').css("background-color",	$(this).css("background-color"));
		$('#menu2').css("background-color",	$(this).css("background-color"));
	}).on('mouseleave',function(e){
		if(!colorBarClicked){
			$('.header-container').css("background-color",	color);
			$('.header-container').css("background-color",	color);
			$('.sub-user-profile-tip').css("background-color", color);
			$('#menu2').css("background-color", color); 
		}else{
			colorBarClicked = false;
		}
	});
	
	$('#changeBackgroundColor li').on('click', function() {
		var requestMapping = "/colorTheme";
		var requestContextPath = getContextPath() + requestMapping;
		
		colorBarClicked = true;
		color = $(this).css("background-color");
		var headerObject = $(this);
		
		var colorTheme = $(this).context.className;
		$.ajax({
			type : 'POST',
			url : requestContextPath,
			data :'colorTheme='+ colorTheme,
			success : function(data) {
				alert("사용자 지정색상이 변경되었습니다!");
				
				$('.header-container').css("background-color",	$(headerObject).css("background-color"));
				$('.header-container').css("background-color",	$(headerObject).css("background-color"));
				$('.sub-user-profile-tip').css("background-color",	$(headerObject).css("background-color"));
				$('#menu2').css("background-color",	$(headerObject).css("background-color"));
				$('.icon-box').css("background-color",	$(headerObject).css("background-color"));
				$('.reply-more-btn').css("background-color",$(headerObject).css("background-color"));			
			},
			error : function(data) {
				alert("사용자 지정색상 변경을 요청하는 동안 오류가 발생했습니다.(ERROR CODE : C0451)");
			}
		});
	});
	// Bar 색상 변경 End /////////////////////////////////////////
		
	//알림 메뉴 show/hide 처리 Start
	$('.notification-btn').on('click', function(e){
		$('#notificationListContainer').toggle("slide", {direction: "up"});
	}); //알림 메뉴 show/hide 처리 End

	
	//아이디 찾기, 비밀번호 찾기
	$("#helpPwdBtn").on("click", function(){
		if($("#helpPwdEmail").val() == ""){
			alert("이메일을 입력해주세요");
		}else if($("#helpPwdName").val() == ""){ 
			alert("이름을 입력해주세요");
		}else if($("#helpPwdBirthday").val() == ""){ 
			alert("생년월일을 입력해주세요");
		}else{
			$("#helpPwd").submit();
		}
	});
	$("#helpIdBtn").on("click", function(){
		 if($("#helpIdName").val() == ""){ 
			alert("이름을 입력해주세요");
		}else if($("#helpIdBirthday").val() == ""){ 
			alert("생년월일을 입력해주세요");
		}else{
			$("#helpId").submit();
		}
	});
	if($("#noResult").val() != "" || $("#noResultPwd").val() != "" || $("#emails").val() != "" ||$("#email").val() != "" ||$("#result").val() != ""){
		$(".form_wrap").css("display", "none");
		$("#search_result").css("display", "block");
	}
	//아이디,비번찾기 끝

});

