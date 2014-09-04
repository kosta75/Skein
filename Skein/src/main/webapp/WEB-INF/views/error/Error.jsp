<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table {
	border: 0;
	border-collapse: collapse;
	padding-top: 20px;
}
tr {
	border: 0;
}
.btnDiv{
	text-align: center;
	font-size: 14px;
}
.btn{
	display: inline-block;
	cursor: pointer;
	outline: none;
	width: 90px;
	border: 1px solid #ddd;
	background: #fff;
	padding: 10px 10px;
	margin: 0 5px;
}
img{
	width: 150px; 
	padding-top: 30px;
}
</style>
</head>
<body>
	<table cellspacing="0" width="650" height="420" cellpadding="0" align="center">
		<tbody>
			<tr>
				<td height="36">
					<a href="${pageContext.request.contextPath }" target="_blank" style="font-family: -webkit-pictograph; font-weight: bold; margin: 0px 20px; text-decoration: none; font-size: 60px; color: #a7bc7a;">
						Sil
					</a>
				</td>
			</tr>
			
			<tr style="vertical-align:middle; height: 300px; border-top: 2.5px solid #7C7C7C; z-index: 1;">
				<td>
					<div style="float: left; height: 170px;margin-left: 20px;" ><img src="${pageContext.request.contextPath}/resources/media/image/errorImg.png"></div>
					<div style="float: left; padding: 20px 0 40px 20px; font-size: 20px; font-weight: bold; font-family: '맑은 고딕'; color: #696767">
						존재하지 않는 페이지거나 <br/>오류로 인하여 현재 페이지를 볼 수 없습니다.
						<p style="padding: 11px 0 0 0; font-size: 15px;">
						이용에 불편을 드려서 죄송합니다. 잠시 후 다시 시도해 주십시오. <br/>
						현재 서비스되는 페이지인지 다시 한 번 확인해 주시기 바랍니다.</p>
						<div class="btnDiv">
							<div class="btn" onclick="history.back()">이전페이지</div>
							<div class="btn" onclick="${pageContext.request.contextPath}">메인페이지</div>
						</div>
					</div>
					<div style="clear: both;"></div>
				</td>
			</tr>
			<!-- Footer -->
			<tr>
				<td style="height: 18px; border-top: 2px solid #696767; font-size: 0; line-height: 0">&nbsp;</td>
			</tr>
		</tbody>
	</table>
</body>
</html>