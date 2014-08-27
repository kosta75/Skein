$(document).ready(function() {
	$("#modifyBtnPwd").click(function() {
		email = $("#modifyformEmail").val();
		password = $("#currentpwd").val();
		newpwd = $("#newpwd").val();
		$.ajax({
			url : 'update',
			type : "post",
			data : "email=" + email + "&password=" + password + "&newpwd=" + newpwd,
			success : function(data) {
				
				if (data.result == "pwdERROR") {
					$("#currentpwdblock").html("비밀번호가 다릅니다.").css("color", "red");
				} else if(data.result == "updatefail"){
					alert("비밀번호 변경을 실패했습니다.");
				} else if(data.result == "success"){
					alert("변경완료");
				}
			},
			error : function() {
				alert("ERROR");
			}
		});

	});
});