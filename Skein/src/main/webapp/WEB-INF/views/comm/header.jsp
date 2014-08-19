<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<header id="globalTop">

<div id="changebgc"style="margin-top: 25px; position: fixed; margin-left: -150px; z-index: 3;">색상변경</div>


	<div class="logo">
		<a href="${pageContext.request.contextPath}">Sil</a>
	</div>
	<div id="search" >
		<form class="serch-form" id="searchBar" method="post" action="${pageContext.request.contextPath}/friendship/search/members" role="search" onsubmit="">
			<input type="text" class="textbox" name="fullName"  placeholder="당신의 친구를 찾아보세요" autocomplete="off">
			<button type="submit" class="search-button" onclick="" title="당신의 친구를 찾아보세요" ></button>
		</form>
	</div>
	
	<se:authorize ifNotGranted="ROLE_USER">
	<div>
		<form action="${pageContext.request.contextPath}/security" method="post">
			<fieldset>
				<legend>로그인 정보</legend>
				이메일(name="email")<input type="email" name="email" /><br />
				비밀번호(name="password")<input type="password" name="password" /><br />
			</fieldset>
			<input type="submit" value="Login" />
		</form>
	</div>
	</se:authorize>
		
	<%-- <se:authentication property="name" var="LoginUser"/> --%>
	<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
		<div style="float:left;">
			<div style="width:50px;padding-top:5px;float:left;">
				<img src="${pageContext.request.contextPath}/resources/media/image//20100107221109605_2R2EJLGPV_raw.jpg" width="40px;" height="40px;" style="border-radius:100px;">
			</div>
			<div style="padding-top:15px; float: left">
				<a href="${pageContext.request.contextPath}/${sessionScope.PersonalURI}">${sessionScope.PersonalURI}</a>
			</div>
		</div >
		<div id="myinfo">
			<div >|</div>
			<div id="alram" >알림</div>
			<div >|</div>
			<div >고객센터</div>
			<div >|</div>
			<div ><a href="${pageContext.request.contextPath}/logout">로그아웃</a></div>
		</div>
		<div id="selectpage">
            <div style="background-color: #336666; clear: both; width: 100px; height: 60px">
            <input type="hidden" value="green">
            a</div>
            <div style="background-color: red; clear: both; width: 100px; height: 60px">
            <input type="hidden" value="red">
            b</div>
            <div style="background-color: #f96e5b; clear: both; width: 100px; height: 60px">
            <input type="hidden" value="orange">
            c</div>
            <div style="background-color: #00B4DB; clear: both; width: 100px; height: 60px">
            <input type="hidden" value="blue">
            d</div>
            <div style="background-color: #a7bc7a; clear: both; width: 100px; height: 60px">
            <input type="hidden" value="yellowgreen">
            e</div>
            <div style="background-color: skyblue;clear: both; width: 100px; height: 60px">
            <input type="hidden" value="skyblue">
            f</div>

         </div>
		<div id="alrampage">
            <hr>
            알림페이지
            <hr>
         </div>
		
		
	</se:authorize>
	
	
</header>
