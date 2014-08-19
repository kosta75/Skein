<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
.wrap_wrap{
	margin: 0 auto;
	width: 700px;
	min-height: 250px;
	text-align: center;
}
.form_wrap {
	float: left;
	margin: 50px 20px;
	width:300px;
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

.help_subject_container .subject_sub{
	font-size: 13px;
}

.help_container{
	margin: 15px 20px;
	height: 78px;
	text-algin:center;
}

.help_container table tr td{
min-width: 80px;
}
#help_search{
	padding-top:15px;
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

.button_container{
text-align: center;
background-color: #f2f2f2;
border-top: 1px solid #ccc;
}

#search_result{
	display: none;
	clear:both;
	width:640px;
	text-align:center;
	background-color: blanchedalmond;
	border: 2px solid #dd3c10;
	padding: 10px;
	margin: 70px 10px;
}

#search_result .button_container{
	background-color: inherit;
	border-top: 1px solid #ccc;
	margin-bottom: -10px;
	margin-top: 10px;
}
</style>
<script>
	$(document).ready(function(){
		$("#helpPwdBtn").on("click", function(){
			if($("#helpPwdEmail").val() == ""){
				alert("�̸����� �Է����ּ���");
			}else if($("#helpPwdName").val() == ""){ 
				alert("�̸��� �Է����ּ���");
			}else if($("#helpPwdBirthday").val() == ""){ 
				alert("��������� �Է����ּ���");
			}else{
				$("#helpPwd").submit();
			}
		});
		$("#helpIdBtn").on("click", function(){
			 if($("#helpIdName").val() == ""){ 
				alert("�̸��� �Է����ּ���");
			}else if($("#helpIdBirthday").val() == ""){ 
				alert("��������� �Է����ּ���");
			}else{
				$("#helpId").submit();
			}
		});
		if($("#noResult").val() != "" || $("#noResultPwd").val() != "" || $("#emails").val() != "" ||$("#email").val() != "" ||$("#result").val() != ""){
			$(".form_wrap").css("display", "none");
			$("#search_result").css("display", "block");
		}
	});
</script>
</head>
<body>
<div class="wrap_wrap">

	<div class="form_wrap">
		<form id="helpId" action="id" method="post">
			<div class="help_subject_container">
				<b>���� ã��</b> <font class="subject_sub">������(e-mail) ��Ʈ����</font>
			</div>
			<div class="help_container">	
				<div class="help_search_con" id="help_search">
					<table style="text-align:left;">
						<tr><td style="text-align:right;">�̸� : </td><td><input id="helpIdName" type="text" name="fullName" ></td></tr>
						<tr><td style="text-align:right;">������� : </td><td><input id="helpIdBirthday" type="date" name="birthday" ></td></tr>
					</table>
				</div>
			</div>
			<div class="button_container">
				<input id="helpIdBtn" type="button" value="�˻�" class="submitBtn">
				<input type="button" value="���" class="resetBtn" onclick="location.href='../' ">
			</div>
		</form>
	</div>
	
	<div class="form_wrap">
		<form id="helpPwd" action="pwd" method="post">
			<div class="help_subject_container">
				<b>��й�ȣ ã��</b>
			</div>
			<div class="help_container">	
				<div class="help_search_con">
					<table style="text-align:left;">
						<tr><td style="text-align:right;">����(e-mail) : </td><td><input id="helpPwdEmail" type="email" name="email" ></td></tr>
						<tr><td style="text-align:right;">�̸� : </td><td><input id="helpPwdName" type="text" name="fullName" ></td></tr>
						<tr><td style="text-align:right;">������� : </td><td><input id="helpPwdBirthday" type="date" name="birthday" ></td></tr>
					</table>
				</div>
			</div>
			<div class="button_container">
				<input id="helpPwdBtn" type="button" value="�˻�" class="submitBtn">
				<input type="button" value="���" class="resetBtn" onclick="location.href='../' ">
			</div>
		</form>
	</div>
	
	<div id="search_result" >
	<input type="hidden" value="${noResult }" id="noResult">
	<input type="hidden" value="${noResultPwd }" id="noResultPwd">
	<input type="hidden" value="${emails.size() }" id="emails">
	<input type="hidden" value="${email }" id="email">
	<input type="hidden" value="${result }" id="result">
	
		<c:if test="${noResult == 'y' }">
			�˻� ����� �����ϴ�.<br>
			<a href="javascript:history.back()">���ư���</a>
		</c:if>
		<c:if test="${!empty emails  }">
			email ���<br>
			<c:forEach items="${emails}" var="email">
				${email.substring(3, email.indexOf("@")) }<br>
			</c:forEach>
			<a href="javascript:history.back()">���ư���</a>
		</c:if>
		
		<c:if test="${noResultPwd == 'y' }">
			�˻� ����� �����ϴ�.<br>
			<a href="javascript:history.back()">���ư���</a>
		</c:if>
		<c:if test="${!empty email  }">
			[email]  ${email } �� �ӽ� ��й�ȣ�� �����Ͻðڽ��ϱ�?
			<div class="button_container">
			<form action="pwdUpdate" method="post">
			<input type="hidden" name="email" value="${email }">
				<input type="submit" value="Ȯ��" class="submitBtn">
				<input type="button" value="���" class="resetBtn" onclick="location='refind'">
			</form>
			</div>
		</c:if>
		
		<c:if test="${!empty result  }">
			�ӽú�й�ȣ�� ���۵Ǿ����ϴ�.<br>
			<a href="javascript:history.back()">���ư���</a>
		</c:if>
	</div>
	
	
</div>
	
</body>
</html>