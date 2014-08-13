<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<script>
$(document).ready(function(){
	
	
});
</script>
<se:authentication property="name" var="LoginUser"/>
<section class="content-container">
	<div>
		<div id="menu">
			<div id="menu_username">${sessionScope.PersonalURI}</div>
		</div>
	
		<div id="menu2">
			<div id="menu_username">${sessionScope.PersonalURI}</div>
			<div id="menu2-1"></div>
		</div>
	</div>

	
	
	
	
	
	
	<div id="modal-background">

</div>

<div id="container" style="width: 960px;clear: both;margin: auto;  ">
<!-- <video id="videobcg" loop="loop" preload="auto"
      style="margin-top: -5px; position: fixed; width: 100%; height:70% opacity: 0.9"
      autoplay="autoplay" src="img/cloud.mp4" type="video/mp4"
      poster="./images/Cosmos07.jpg "> 
   </video> -->
<!--left  -->

<div id="modal-content" style="top: 10%; border-radius:6px 6px 6px 6px;">
<div  style="float: right;"><img id="modal-close" src="${pageContext.request.contextPath}/img/closeBtn.png" style="width: 20px;height: 20px;" aria-label="ㅇㅇㅇㅇㅇㅇ"></div>
<div style="float: left; width: 59%;height: 100%;"> 
<div style="height: 87%;" >
<div id="detailImg" style="height:100%; z-index: -2;"  >
<c:forEach var="imgNumber" begin="1" end="10" step="1">

<input type="hidden" value="${imgNumber}">
<c:if test="${imgNumber == 1}">
<img id="detailImg${imgNumber}" src="${pageContext.request.contextPath}/img/${imgNumber}.jpg" style="width: 100%; height: 100%; display: block;z-index: -1;">
</c:if>
<c:if test="${imgNumber != 1}">
<img id="detailImg${imgNumber}" src="${pageContext.request.contextPath}/img/${imgNumber}.jpg" style="width: 100%; height: 100%; display: none;z-index: -1;">
</c:if>

</c:forEach>

</div>




</div>
<div style=" clear: both; ">
<c:forEach var="imgBtnNumber" begin="1" end="10" step="1">
<div id="imgBtn">
<input type="hidden" value="${imgBtnNumber}">
<img id="imgBtn${imgBtnNumber}" src="${pageContext.request.contextPath}/img/${imgBtnNumber}.jpg" style="width: 40px; height: 40px; padding-left:15px;padding-top:10px;opacity:0.4;">
</div>
</c:forEach>

</div>
</div>

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

<div style="width: 98%;height:200px; ">

<div style="width:98%; height: 70px;background:#00B4DB; border-radius:6px 6px 0px 0px;  "></div>
<div style="clear:both;  width:98%; height: 180px;background:#fff; border-radius:0px 0px 6px 6px; " > </div>

</div>
 <div style="position: absolute;z-index: 0; width: 230px; margin-top: 40px;">
<img src="img/20100107221109605_2R2EJLGPV_raw.jpg" width="80px" height="80px" style="border:3px solid ; border-color:#fff; border-radius:6px; vertical-align:middle; margin-left: 10px;" >

${member.fullName}
<div style="margin-left: 20px;margin-top: 10px;">
이메일:${member.email}<br>
<c:if test="${birthDay == toDay}">
<img src="${pageContext.request.contextPath}/img/birthday.jpg" style="width: 30px;height: 30px;"/>
</c:if>
<c:if test="${birthDay != toDay}">
생일:
</c:if>
<fmt:formatDate value="${member.birthday}" type="date" pattern="YYYY년MM월dd일"/>

</div>

</div> 
</div>




<!--center  -->
<div id="containerCenter" style="width:50%; float: left;">

<div id="write" style="width: 99%; background: #fff; margin-bottom: 20px;border-radius:6px 6px 6px 6px;">
<div style="padding:10px;">다이어리 | 개인기록</div>
<div >
<%-- <form id="postReg" action="${pageContext.request.contextPath}/post/postReg" method="post"> --%>
<form id="hitstoryForm" method="post" enctype="multipart/form-data">
 	
 	
      
	<textarea name="content" id="content" cols="64" rows="2" ></textarea>
	<!--  -->
	
		<input type="hidden" name="email" value="${LoginUser}">
		발생일자 : <input type="date" name="startDate"><br />
		종료일자 : <input type="date" name="endDate"><br />
		
		<ul id="demo" class="offset2 arrow_box">
			<li class="">
				<h3>Drop Zone</h3>
	
				<p id="dropzone" class="">
					Drag and drop files from your desktop here (or select them from the
					input above).<br> They will be read in browser.<br>
				</p>
				<ul id="file-list"></ul>
	
			</li>
		</ul>

	
	<!--  -->
	<div style="clear: both; background:#dcdcdc;width:99%; height: 40px ; padding-right: 5px;border-radius:0 0 6px 6px; " align="right">
	  <div id="writeicon" style="margin-left: 10px;"  >
 	 <div  class="icon_button" id="writememnu1" > </div>
      <div class="icon_button" id="writememnu2"></div>
      <div class="icon_button" id="writememnu3"></div>
      <div class="icon_button" id="writememnu4"></div>
      </div>
      
      <!-- 수정할 부분  -->
	<%-- 	<select name="publicLevelCode" style="margin-top: 10px;">
	<c:forEach var="publicLevelList" items="${publicLevelList}">
		<option value="${publicLevelList.publicLevelCode}">${publicLevelList.publicLevelDescription}</option>
	</c:forEach>
			</select> --%>
			<select name="publicLevelCode">
			<option value="1">비공개</option>
			<option value="2">비공개</option>
			<option value="3">비공개</option>
			<option value="4">비공개</option>
			<option value="5">비공개</option>
		</select>
	  <!-- 수정할 부분  -->
		
<input type="submit" value="게시" style="margin-top: 10px;"></div>
</form> 
</div>
<div></div>
</div>






<!-- private String email;
	private String fullName;
	private Date birthday;
	private String personaURI;
	
	private int boardSeq;
	private int boardKindSeq;
	private String content;
	private Date writeDate;
	private int publicLevelCode;
	private int isActivated;
	private int groupSeq;
	
	private int historySeq;
	private Date startDate;
	private Date endDate;
	private String feelings;
	private String weather;
	private int isImportant;
	private int isShare;
	private String keyword;
	private String place;

	private String groupName;
	private int isImportantGroup;
	private Date groupStartDate;
	private Date groupEndDate;
	
	private int mediaSeq;
	private String fileName;
	private int fileSize;
	private String extension; -->

<c:forEach var="list" items="${list}">


<div id="boardlist"  >
<div id="list" style="border-radius:6px 6px 6px 6px;">
<div style="float: left;">

<img src="${pageContext.request.contextPath}/img/20100107221109605_2R2EJLGPV_raw.jpg" style="width: 50px;height:50px;"> 

​
</div>
<div style="float: left;">
${list.fullName}<br>
${list.writeDate}
</div>
<div style="clear: both; ">
${list.content} 
<div id="modal-launcher"  >
<div id="imghover" >
<input type="hidden" value="${list.boardSeq}" id="boardSeq${list.boardSeq}">

<img id="imghover${list.boardSeq}" src="${pageContext.request.contextPath}/img/Lighthouse.jpg"  style="width: 100%; height: 250px;"></div>
</div>
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


<div style="clear: both;"></div>
	
	
	
</section>