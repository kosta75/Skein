$(document).ready(function() {
	
	//헤더 네비게이션 메뉴
	$('#alram').click(function() { 	//알림
		$('#sidecontent').after($('#alrampage').toggle("display"));
	});
	
	$('#sidemenu1').click(function() { 	//알림
		$('#sidemenu1').append($('#mon').toggle("display"));
	});
	$('#sidemenu2').click(function() { 	//알림
		$('#sidemenu2').after($('#mon').toggle("display"));
	});
	$('#sidemenu3').click(function() { 	//알림
		$('#sidemenu3').after($('#mon').toggle("display"));
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

});