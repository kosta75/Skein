<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/header.js" charset="UTF-8"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<div id="header" >
<div  style="width: 100%;background-color: #7F6C62;">
<div id="bar" >
<div style="width: 100px;float:left;  font-size:50px;"><a href="main.jsp">Sil</a></div>
<div id="search" ><form class="serch-form" id="searchBar" method="get" action="" role="search" onsubmit="">   
   <input type="text" class="textbox "  placeholder="당신의 친구를 찾아보세요" autocomplete="off">
   <button type="submit" class="search-button" onclick="" title="당신의 친구를 찾아보세요" ></button>
</form></div>
<se:authentication property="name" var="LoginUser"/>
<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
<div style="  width: 120px;" >
<div style="width:50px;padding-top:5px;">
<img src="img/20100107221109605_2R2EJLGPV_raw.jpg" width="40px;" height="40px;" style="border-radius:100px;">
</div>

<div style="padding-top:15px; float: left">
<a href="profile.jsp">${sessionScope.PersonalURI}</a>
</div>
</div >
<div id="myinfo">
<div >|</div>
<div id="alram" >알림</div>
<div >|</div>
<div >고객센터</div>
<div >|</div>
<div ><a href="${pageContext.request.contextPath}/j_spring_security_logout">로그아웃</a></div>
</div>
</div>
</se:authorize>
</div>
<div style="clear:both; width:960px;margin:auto;height:60px;background-color: #fff;">
<div style="float: left;width: 200px;height:50px;  text-align: center; font-weight:bold;font-size:30px; padding-top:20px;">${sessionScope.PersonalURI}</div>
<div id="alrampage"  >
<hr>
알림페이지
<hr>
</div>

</div>
</div>


