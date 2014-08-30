

//pageContext.request.contextPath

//알림 목록 읽기
function countOfUnCheckNotificationList(){
	var contextPath = getContextPath();
	var contextURI = contextPath + "/notification/notificationCountList";
	//$(".notification-list").empty();
	$.ajax({
		type : 'POST',
		url : contextURI,
		dataType : 'JSON',
		/*data : "fullName=" + $("#search .textbox").val(),*/
		success : function(data) {
			var obj = data.notificationList;
			var totalCount = 0;
			var notificationText = "";
			//console.log(obj);
			
			$.each(obj, function(key, value){
				var msg = "";
				/*1	공지사항
				2	친구신청
				3	친구신청수락
				4	공유신청
				5	공유신청수락
				6	댓글*/
				switch (value.notificationCode) {
				  case 1 : msg = "공지사항";
					  break;
				  case 2 : msg = "친구신청";
					  break;
				  case 4 : msg = "공유신청";
					  break;
				  case 6 : msg = "댓글";
					  break;
				}
				notificationText += "<li>";
				notificationText +="<div class='notification-info'><span class='notification-code'>"+msg+"</span>";
				notificationText += "<span class='notification-count'>" + value.groupCount+"</span>개의 알림이 있습니다.</div>";
				
				//console.log(value.notificationCode);
				totalCount += value.groupCount;
				notificationText += "</li>";
			});
			
			
			if(totalCount >0){
				$("#notificationCounter").show();
				$(".notification-title").show();
				$(".notification-count-number").text(totalCount);
				$(".notification-list").append(notificationText);
			}else{
				notificationText = "<div class='not-exist'><span>읽지 않은 알림이 없습니다.</span></div>";
				$("#notificationListContainer").append(notificationText);
			}
			
			
			
			
		},
		error : function() {
			alert('Error while request..');
		}
	});
}















$(document).ready(function() {
	

	
	var contextPath = getContextPath();
	var rootPath = "/skein";
	
	
	
	//알림 목록 읽기
	countOfUnCheckNotificationList();
	
	$(".confirm-btn").on('click', function(){
		console.log("dd");
		var contextURI = contextPath + "/notification/notificationAllRead";
		$.ajax({
			type : 'post',
			url : contextURI,
			success : function(){
				location.reload();
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
		colorBarClicked = true;
		color = $(this).css("background-color");
		var obj = $(this);
		var colorTheme = $(this).context.className;
		var urlText = contextPath + "/colorTheme";
		$.ajax({
			type : 'post',
			url : urlText,
			cache : false,
			data :'colorTheme='+ colorTheme,
			success : function(data) {
				alert("사용자 지정색상이 변경되었습니다!");
				$('.header-container').css("background-color",	$(obj).css("background-color"));
				$('.header-container').css("background-color",	$(obj).css("background-color"));
				$('.sub-user-profile-tip').css("background-color",	$(obj).css("background-color"));
				$('#menu2').css("background-color",	$(obj).css("background-color"));
			},
			error : function() {
				alert('Error while request..');
			}
		});
	});
	// Bar 색상 변경 End /////////////////////////////////////////
		
	//헤더 네비게이션 메뉴
	$('.notification-btn').on('click', function(e){ 	//알림
		console.log("dd");
		$('#notificationListContainer').toggle("slide", {direction: "up"});
	});

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
	
	
	 $(".scroll").click(function(event){            
	        event.preventDefault();
	        $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
	});
	 
	 
	 $("#menu2 .arrowunderline li").hover(function(){
		 $(this).find("a").css("color", $("#menu2").css("background-color"));},
		 function(){
			 $(this).find("a").css("color", "");
		 
	 });
	 
	

});
