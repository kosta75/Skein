$(document).ready(function() {
	$("#modifyBtnPwd").click(function() {
		var email = $("#modifyformEmail").val();
		var password = $("#currentpwd").val();
		var newpwd = $("#newpwd").val();
		var checkpwd = $("#checkpwd").val();
		if(password == ''){
			$(".alertblock").html('');
			$("#currentpwdblock").html("비밀번호를 입력해주세요.").css("color", "red");
			$("#currentpwd").focus();
			return;
		}else if(newpwd == ''){
			$(".alertblock").html('');
			$("#newpwdblock").html("새 비밀번호를 입력해주세요.").css("color", "red");
			$("#newpwd").focus();
			return;
		}else if(checkpwd == ''){
			$(".alertblock").html('');
			$("#checkpwdblock").html("비밀번호 확인을 입력해주세요.").css("color", "red");
			$("#checkpwd").focus();
			return;
		}else if(newpwd != checkpwd){
			$(".alertblock").html('');
			$("#checkpwdblock").html("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.").css("color", "red");
			return;
		}
		$.ajax({
			url : 'update',
			type : "post",
			data : "email=" + email + "&password=" + password + "&newpwd=" + newpwd,
			success : function(data) {
				
				if (data.result == "pwdERROR") {
					$(".alertblock").html('');
					$("#currentpwdblock").html("비밀번호가 다릅니다.").css("color", "red");
					$("#currentpwd").focus();
				} else if(data.result == "updatefail"){
					alert("비밀번호 변경을 실패했습니다.");
				} else if(data.result == "success"){
					alert("변경완료");
					history.go(-1);
				}
			},
			error : function() {
				alert("ERROR");
			}
		});

	});
	
	
	$("#resetBtnPwd").click(function() {
		history.back();
	});
});