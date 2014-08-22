$(document).ready(function() {
	
	// /////////////색깔변경////////////////
	$('#changeBackgroundColor li').on('mouseover', function() {
		$('.header-container').css("background-color",	$(this).css("background-color"));
		$('.header-container').css("background-color",	$(this).css("background-color"));
		$('#leftinfo').css("background-color",	$(this).css("background-color"));
		$('#menu2').css("background-color",	$(this).css("background-color"));
	});
	
	$('#changeBackgroundColor li').on('click', function() {
		var obj = $(this);
		var colorTheme = $(this).context.className;
		
		$.ajax({
			type : 'post',
			url : 'member/colorTheme',
			cache : false,
			data :'colorTheme='+ colorTheme,
			success : function(data) {
				alert("사용자 지정색상이 변경되었습니다!");
				$('.header-container').css("background-color",	$(obj).css("background-color"));
				$('.header-container').css("background-color",	$(obj).css("background-color"));
				$('#leftinfo').css("background-color",	$(obj).css("background-color"));
				$('#menu2').css("background-color",	$(obj).css("background-color"));
				
				/*$('.header-container').css("background-color", $(this).css(colorTheme));
				$('.header-container').css("background-color",$(this).css(colorTheme));
				$('#leftinfo').css("background-color",$(this).css(colorTheme));
				$('#menu2').css("background-color",$(this).css(colorTheme));*/
			},
			error : function() {
				alert('Error while request..');
			}
		});
	});
	// Bar 색상 변경 End /////////////////////////////////////////
		
	//헤더 네비게이션 메뉴
	$('#notification').on('click', function() { 	//알림
		$('#notificationList').toggle("display");
		return false;
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

});