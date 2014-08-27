$(document).ready(function() {
	email = $("#AccountModifyEmail").val();
	
	$("#modifyDomrantBtn").click(function() {
		var password = $("#modifyDomrantPwd").val();
		var data = "email=" + email + "&password=" + password;
		
		modifyAccount("modifydomrant", data);
	});

	$("#modifyDropoutBtn").click(function() {
		var password = $("#modifyDropoutPwd").val();
		var data = "email=" + email + "&password=" + password;

		modifyAccount("modifydropout", data);
	});

	$("#modifyLockoutBtn").click(function() {
		var password = $("#modifyLockoutPwd").val();
		var data = "email=" + email + "&password=" + password;

		modifyAccount("modifylockout", data);
	});
	
});

function modifyAccount(url, data){
	contextPath = $("input[name=contextPath]").val();
	$.ajax({
		url : url,
		type : "post",
		data : data,
		success : function(data) {
			if (data.result == "success") {
				alert("변경완료");
			location.replace(contextPath + "/security/logout");

			}else if(data.result == "pwdERROR"){
				$(".alert").html("비밀번호가 다릅니다.");
			}
			
		},
		error : function() {
			alert("ERROR");
		}
	});
}