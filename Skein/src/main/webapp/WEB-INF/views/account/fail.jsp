<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style type="text/css">

.full_wrap {
	margin: 10px auto;
	width: 640px;
	-webkit-border-radius: 4px;
	border: 1px solid #ccc;
	font-size: 13px;
}

.help_subject_container{
	border-bottom: 1px solid #aaa;
	margin: 0 20px;
	padding-top: 20px;
	padding-bottom: 5px;
	font-size: 23px;
	vertical-align: bottom;
}

.help_container{
	margin: 15px 20px;
}
.help_container #buttons{
	text-align: center;
}

.fail_login{
	background-color: #F0F6FC;
	border: 1px solid #dd3c10;
	padding: 0 10px;
	margin-bottom:20px;
}

.help_fail{
	padding-top: 10px;
	font-size: 15px;
	font-weight: bold;
}

.reg_link, .reset_link{
	padding: 5px 10px;
}


</style>

</head>
<body>


	<div class="full_wrap">
		<div class="help_subject_container">
			<b>로그인 실패</b>
		</div>
		<div class="help_container">
			<div class="fail_login">
				<div class="help_fail">잘못된 이메일</div>
				<div>
					<p>입력된 이메일이 어느 계정에도 속해 있지 않습니다.</p>
				</div>
			</div>
			<div id="buttons">
				<strong class="reg_link"><a href="#">Sil에 가입하기</a></strong>
				<a href="#"  class="reset_link">로그인	정보를 잊으셨나요?</a>
			</div>
		</div>
	</div>
	
	
	<div class="full_wrap">
		<div class="help_subject_container">
			<b>로그인 실패</b>
		</div>
		<div class="help_container">
			<div class="fail_login">
				<div class="help_fail">비밀번호를 다시 입력해 주세요.</div>
				<div>
					<p>입력하신 비밀번호는 올바르지 않습니다.<br />
					다시 시도해 주세요(Caps Lock 키가 꺼져있는지 확인하세요)</p>
				</div>
			</div>
			<div id="buttons">
				<strong class="reg_link"><a href="#">Sil에 가입하기</a></strong>
				<a href="#"  class="reset_link">로그인	정보를 잊으셨나요?</a>
			</div>
		</div>
	</div>
	
	
	
	
	
</body>
</html>