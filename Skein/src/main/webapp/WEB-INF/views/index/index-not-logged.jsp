<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="content-container">
	<c:if test="${param.error == 'copyid'}">
	<script type="text/javascript">
		$(document).ready(function(){
			alert("다른 IP에서 접속하였습니다.");
			location.replace("/skein");
		});
	</script>
	</c:if>
<div style="height:30px;" align="center">
	<a id="refresh" href="/skein/">home</a>
</div>
<div id="join-tap" style="margin-left: 75px;height: 474px; width: 45%; float: left; ">
		<p class="main-p">JOIN</p>
</div>

<div  id="login-tap"style="height: 474px; width: 45%; float: left;">
		<p class="main-p">LOGIN</p>
</div>
<div id="bottom-tap" style="clear: both;margin-left:75px; width:90%; height:50px; z-index:1; ">
	<p class="main-bottom-p">The memories with you.</p>
</div>
</section>

<!-- 푸터 없어도 됨 -->
<div id="footer">
	<table style="width: 960px;">
	</table>
</div>

