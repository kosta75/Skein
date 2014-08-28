$(document).ready(function() {
	//아이디 찾기, 비밀번호 찾기
	$("#helpPwdBtn").on("click", function(){
		if($("#helpPwdEmail").val() == ""){
			alert("이메일을 입력해주세요");
		}else if($("#helpPwdName").val() == ""){ 
			alert("이름을 입력해주세요");
		}else if($("#helpPwdBirthday").val() == ""){ 
			alert("생년월일을 입력해주세요");
		}else if($("#helpPwdBirthday").val().length > 8 ){ 
			alert("날짜형식이 잘못되었습니다. ex) 1991-01-05");
		}else{
			$("#helpPwd").submit();
		}
	});
	$("#helpIdBtn").on("click", function(){
		 if($("#helpIdName").val() == ""){ 
			alert("이름을 입력해주세요");
		}else if($("#helpIdBirthday").val() == ""){ 
			alert("생년월일을 입력해주세요");
		}else if($("#helpPwdBirthday").val().length > 8 ){ 
			alert("날짜형식이 잘못되었습니다. ex) 1991-01-05");
		}else{
			$("#helpId").submit();
		}
	});

	//아이디,비번찾기 끝
	
});