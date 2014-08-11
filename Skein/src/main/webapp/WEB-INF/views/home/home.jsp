<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--
추가 작업해야할 내용
1. ajax로 내용 추가시 html 업데이트


 
-->
<%-- <p><a href="${pageContext.request.contextPath}">타임라인</a></p>
<div id="notificationList">
</div>
<p><a href="${pageContext.request.contextPath}/notifications/list">알림리스트</a></p>
<p><a href="${pageContext.request.contextPath}/friendship/list">친구리스트</a></p>

<div> --%>



<!--
추가 작업해야할 내용
1. ajax로 내용 추가시 html 업데이트


 
-->
<%-- <p><a href="${pageContext.request.contextPath}">타임라인</a></p>
<div id="notificationList">
</div>
<p><a href="${pageContext.request.contextPath}/notifications/list">알림리스트</a></p>
<p><a href="${pageContext.request.contextPath}/friendship/list">친구리스트</a></p>

<div> --%>

<body>
<div id="modal-background">

</div>

<div id="container" style="width: 960px;clear: both;margin: auto;  ">
<!-- <video id="videobcg" loop="loop" preload="auto"
      style="margin-top: -5px; position: fixed; width: 100%; height:70% opacity: 0.9"
      autoplay="autoplay" src="img/cloud.mp4" type="video/mp4"
      poster="./images/Cosmos07.jpg "> 
   </video> -->
<!--left  -->

<div id="modal-content">

<img id="modal-close" src="${pageContext.request.contextPath}/img/Lighthouse.jpg" style="width: 59%; height: 100%;">

<div style="float: right;width: 40%;">
	
<div>

<div style="float: left;  padding-top: 15px;">
<div style="float: left;">
<img  src="${pageContext.request.contextPath}/img/20100107221109605_2R2EJLGPV_raw.jpg" style="width: 50px;height:50px;">
</div>
<div id="modalfullName" style="float: left;width:70%;padding-top:15px;">${post.fullName}
</div>
<div id="modalwriteDate" style=" float:left;">${post.writeDate}</div>
</div>
<div id="modalcontent" style="clear: both; padding-top: 15px; padding-bottom: 15px;">${post.content}</div>

</div>
<div id="reply" style="clear:both; background: #e4e4e4;width:99%;height:100%;  border: 1px solid; border-color:  #e4e4e4;">
<div style="float: left;padding:5px;padding-left:10px;">
<img src="${pageContext.request.contextPath}/img/20100107221109605_2R2EJLGPV_raw.jpg" style="width: 35px;height:35px; "> 
</div>
<div style="float: left;padding-top:10px;">
<div >
<form action="" id="rWrite" >
<input name="replyWrite" type="text" style="width:210%; height: 20px;">
</form>
</div>
</div>
</div>

</div>
</div>
<div id="containerLeft" style="width:25%; float: left;">
<img src="img/20100107221109605_2R2EJLGPV_raw.jpg" width="180px;" height="180px;" style="border:3px solid ; border-color:#fff; border-radius:10px; vertical-align: top; margin-left: 10px;" >
</div>



<!--center  -->
<div id="containerCenter" style="width:50%; float: left;">

<div id="write" style="width: 99%; background: #fff; margin-bottom: 20px;">
<div>다이어리 | 개인기록</div>
<div>
<form id="postReg" action="${pageContext.request.contextPath}/post/postReg" method="post">
 	
 	
      
	<textarea name="content" id="content" cols="64" rows="2" ></textarea>
	<div style="clear: both; background:#dcdcdc;width:99%; height: 40px ; padding-right: 5px; " align="right">
	  <div id="writeicon"  >
 	 <div  class="icon_button" id="writememnu1" > </div>
      <div class="icon_button" id="writememnu2"></div>
      <div class="icon_button" id="writememnu3"></div>
      <div class="icon_button" id="writememnu4"></div>
      </div>
		<select name="publicLevelCode" style="margin-top: 10px;">
	<c:forEach var="publicLevelList" items="${publicLevelList}">
		<option value="${publicLevelList.publicLevelCode}">${publicLevelList.publicLevelDescription}</option>
	</c:forEach>
			</select>
		
<input type="submit" value="게시" style="margin-top: 10px;"></div>
</form> 
</div>
<div></div>
</div>

<c:forEach var="list" items="${list}">


<div id="boardlist"  >
<div id="list" >
<div style="float: left;">

<img  src="${pageContext.request.contextPath}/img/20100107221109605_2R2EJLGPV_raw.jpg" style="width: 50px;height:50px;"> 

​
</div>
<div style="float: left;">
${list.fullName}<br>
${list.writeDate}
</div>
<div style="clear: both; ">
${list.content} 
<div id="modal-launcher"  >
<input type="hidden" value="${list.boardSeq}" id="boardSeq${list.boardSeq}">
<img src="${pageContext.request.contextPath}/img/Lighthouse.jpg"  style="width: 100%; height: 250px;"></div>

</div>
<div style="clear: both; float: right;">수정 삭제</div>
</div>
<div id="reply" style="background: #e4e4e4;width:99%;height:100%;  border: 1px solid; border-color:  #e4e4e4;">
<div style="float: left;padding:5px;padding-left:10px;">
<img src="${pageContext.request.contextPath}/img/20100107221109605_2R2EJLGPV_raw.jpg" style="width: 35px;height:35px; "> 
</div>
<div style="float: left;padding-top:10px;">
<form action="" id="rWrite" >
<input name="replyWrite" type="text" style="width:270%; height: 20px;">
</form>
</div>
</div>
</div>

</c:forEach>
</div>


<!--right  -->
<div id="containerRight" style="width:25%; float:right;">
<ul id="side" style="float: left; ">
<li id="sidemenu1" style="clear: both;float:left;">2014</li>
<li id="sidemenu2" style="clear: both;float:left;">2013</li>
<li id="sidemenu3" style="clear: both;float:left;">2012</li>
<li id="sidemenu4" style="clear: both;float:left;">그외</li>
</ul>
<div >
<ul id="mon" style="display: none;clear:both;  padding-top:5px;padding-left:5px;  ">
<li id="12" >12월</li>
<li id="11">11월</li>
<li id="10">10월</li>
<li id="9">9월</li>
<li id="8">8월</li>
<li id="7">7월</li>
<li id="6">6월</li>
<li id="5">5월</li>
<li id="4">4월</li>
<li id="3">3월</li>
<li id="2">2월</li>
<li id="1">1월</li>
</ul>
</div>
</div>


</div>


<script type="text/javascript">
$(document).ready(function(){$("#postReg").on('submit', function(){
	
	
	$.ajax({
		type:'post',
		url:'post/postReg',
		cache: false,				
		data:'content=' + $("#content").val(),
	    success:function(data){ //callback
	    	var post = data.post;
	    	historyPost.setBoardSeq(1);
			historyPost.setContent(content);
			historyPost.setBoardKindSeq(1);
			historyPost.setHistorySeq(1);
			historyPost.setFeeling("기분 좋음");
			historyPost.setWeather("비오는날");
			historyPost.setIsImportant(0);
			historyPost.setIsShare(0);
			historyPost.setKeyword("키워드");
			historyPost.setPlace("장소");
			historyPost.setGroupSeq(1);
	    	var msg = post.boardSeq + " / " + post.content + " / "+ post.boardKindSeq + " / ";
			msg += post.historySeq + " / " + post.feeling + " / "+ post.weather + " / ";
	        $("#response-message").empty();
	        $("#response-message").html(msg);
	     },
		error: function(){						
			alert('Error while request..'	);
		}
	});
	return false;
	
}) 
$("#notificationList").on('click', function(){
	$.ajax({
		type:'post',
		url:'notifications/list',
		cache: false,				
		data:
			'personalURI='+${sessionScope.personalURI},
		
	    success: function(data){ 
	    
	        $("#boardlist").html();
	     },
		error: function(){						
			alert('Error while request..'	);
		}
	});
});  
});




</script>







<div style="clear: both;"></div>
</body>