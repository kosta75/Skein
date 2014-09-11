<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="error-info-container">
	<table cellspacing="0" width="650" cellpadding="0" align="center">
		<tbody>
			<tr>
				<td height="36">
					<a href="${pageContext.request.contextPath }" target="_blank" style="font-family: -webkit-pictograph; font-weight: bold; margin: 0px 20px; text-decoration: none; font-size: 60px; color: #a7bc7a;">
						Sil
					</a>
				</td>
			</tr>
			
			<tr style="vertical-align:middle; border-top: 2.5px solid #7C7C7C; z-index: 1;">
				<td>
					<div style="float: left; height: 170px;margin-left: 20px;" ><img class='error-image' src="${pageContext.request.contextPath}/resources/media/image/errorImg.png"></div>
					<div style="float: left; padding: 20px 0 40px 20px; font-size: 20px; font-weight: bold; font-family: '맑은 고딕'; color: #696767">
						존재하지 않는 페이지거나 <br/>오류로 인하여 현재 페이지를 볼 수 없습니다.
						<p style="padding: 11px 0 0 0; font-size: 15px;">
						이용에 불편을 드려서 죄송합니다. 잠시 후 다시 시도해 주십시오. <br/>
						현재 서비스되는 페이지인지 다시 한 번 확인해 주시기 바랍니다.</p>
						<div class="btnDiv">
							<div class="btn" onclick="history.back()">이전페이지</div>
							<div class="btn"><a href="${pageContext.request.contextPath}">메인페이지</a></div>
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
</div>