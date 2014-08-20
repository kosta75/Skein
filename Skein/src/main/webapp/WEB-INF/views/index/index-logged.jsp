<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<se:authentication property="name" var="LoginUser"/>
<section class="content-container">
	<div>
	
		<div id="menu">
		<div id="menu-username"><a  href="${sessionScope.PersonalURI}">${sessionScope.PersonalURI}</a></div>
			<ul class="arrowunderline">
		
				<li><a href="#">타임라인</a></li>
				<li><a href="#">정보</a></li>
				<li><a href="time">사진</a></li>
				<li><a href="#">친구</a></li>
			</ul>
		</div>
			
		<div id="menu2" class="${colorTheme}" style="color: #fff;">
				<div id="menu-username" style="padding-left: 100px;"><a  href="${sessionScope.PersonalURI}">${sessionScope.PersonalURI}</a></div>
	
				<ul class="arrowunderline" style="float: left;padding-left: 20%;">
					<li class="first"><a href="#">타임라인</a></li>
					<li><a href="#">정보</a></li>
					<li><a href="time">사진</a></li>
					<li><a href="#">친구</a></li>
					<li><a href="#">고객센터</a></li>
					<li><a href="#">Log Out</a></li>
				</ul>
<%-- 			<div id="menu_username">${sessionScope.PersonalURI}</div>  --%>
			</div>
	
	</div>

	
	
	
	
	
	
	<div id="modal-background">

</div>

<div id="container" style="width: 960px;clear: both;margin: auto;  ">
<!-- <video id="videobcg" loop="loop" preload="auto"
      style="margin-top: -5px; position: fixed; width: 100%; height:70% opacity: 0.9"
      autoplay="autoplay" src="img/cloud.mp4" type="video/mp4"
      poster="./media/images/Cosmos07.jpg "> 
   </video> -->
<!--left  -->

<div id="modal-content" style="top: 10%; border-radius:6px 6px 6px 6px;">
<div  style="float: right;"><img id="modal-close" src="${pageContext.request.contextPath}/resources/media/image/closeBtn.png" style="width: 20px;height: 20px; border-radius:0 6px 0 0;" ></div>
<div style="float: left; width: 59%;height: 100%;"> 
<div style="height: 87%;" >
<div id="detailImg" style="height:100%; z-index: -2;"  >

<c:forEach var="imgNumber" begin="0" end="9" step="1">
<input type="hidden" value="${imgNumber}">
<c:if test="${imgNumber == 0}">
 <img id="detailImg${imgNumber}" src="" style="width: 566px; height: 452px; display: block;z-index: -1;border-radius:6px 0 0 0;"> 
</c:if>
<c:if test="${imgNumber > 0}">
<img id="detailImg${imgNumber}" src="" style="width: 566px; height: 452px; display: none;z-index: -1;border-radius:6px 0 0 0;">
</c:if>
</c:forEach>

</div>




</div>
<div style=" clear: both; " id="imgBtnList">


</div>
</div>

<div style="float: right;width: 40%;">
	
<div >
<div style="float: left;  padding-top: 15px;width: 200px;">
<div class="modalcontent">
<div style="float: left;">
<img  src="${pageContext.request.contextPath}/resources/media/image/20100107221109605_2R2EJLGPV_raw.jpg" style="width: 50px;height:50px;">
</div>
<!--작성자 이름 날짜 내용 출력  -->


</div>
</div>
</div>
<div id="reply" style="clear:both; background: #e4e4e4;width:99%;height:100%;  border: 1px solid; border-color:  #e4e4e4;">
<div style="float: left;padding:5px;padding-left:10px;">
<img src="${pageContext.request.contextPath}/resources/media/image/20100107221109605_2R2EJLGPV_raw.jpg" style="width: 35px;height:35px; "> 

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
<div id="containerLeft" style="width:25%; height: 100%;float: left;">


<div id="infomember"   style="width: 98%;height:200px; ">

<div id="leftinfo" class="${colorTheme}"  style="width:98%; height: 70px; border-radius:6px 6px 0px 0px;  "></div>

<div style="clear:both;  width:98%; height: 180px;background:#fff; border-radius:0px 0px 6px 6px; " > </div>
</div>
 <div style="position: absolute;z-index: 0; width: 230px; margin-top: 40px;">
<img src="${pageContext.request.contextPath}/resources/media/image/20100107221109605_2R2EJLGPV_raw.jpg" width="80px" height="80px" style="border:3px solid ; border-color:#fff; border-radius:6px; vertical-align:middle; margin-left: 10px;" >

<a href="${pageContext.request.contextPath}/${sessionScope.PersonalURI}">${member.fullName}</a>
<div style="margin-left: 20px;margin-top: 10px;">
이메일:${member.email}<br>
<c:if test="${birthDay == toDay}">
<img src="${pageContext.request.contextPath}/resources/media/image/birthday.jpg" style="width: 30px;height: 30px;"/>
</c:if>
<c:if test="${birthDay != toDay}">
생일:
</c:if>
<fmt:formatDate value="${member.birthday}" type="date" pattern="YYYY년MM월dd일"/>

</div> 

</div> 
<div style="clear: both; margin-top: 20px; ">하이아아아이</div>
<!--******************************날씨 정보******************************   -->
         <div
            style="clear: both; width: 96%; height: 350px; background-color: white; border-radius: 10px 10px 10px 10px; margin-top: 30px;">
            <div id="whatweather">
               <div id="observinfo"
                  style="width: 100%; height: 200px; clear: both;"></div>
               <div id="locationinfo" style="width: 100%; clear: both;"></div>
            </div>
         </div>
         <!--********************************************************************** -->

</div>




<!--center  -->
<div id="containerCenter" style="width:50%; float: left;">

<div id="boardListTimelinContainer">
</div>



<div id="write" style="width: 99%; background: #fff; margin-bottom: 20px;border-radius:6px 6px 6px 6px;">
<div style="padding:10px;">
<ul>
<li id="tab1" style="float: left">다이어리</li>
<li style="float: left"><p>|</p></li>
<li id="tab2" style="float: left">개인기록</li>
</ul>
</div>

<!--다이어리  -->
<%-- <div id="diaryWrite">
<form id="postReg" action="${pageContext.request.contextPath}/post/postReg" method="post">
 <form id="diaryForm" method="post" enctype="multipart/form-data">
 	
 	
  <!--     
	<textarea name="content" id="content" cols="64" rows="2" ></textarea>
 -->	<!--  -->
	
	<input type="hidden" name="email" value="${LoginUser}">
	
		<ul id="diaryImg" class="offset2 arrow_box" style="display: none;">
			<li class="">
				<h3>이미지를 끌어다 놓으세요</h3>
				<ul id="file-list"></ul>
				<p id="dropzone" class="" style="height: 200px;">
					
				</p>
				
	
			</li>
		</ul>
	<!--  -->
	<div style="clear: both; background:#dcdcdc;width:99%; height: 40px ; padding-right: 5px;border-radius:0 0 6px 6px; " align="right">
	  <div id="writeicon" style="margin-left: 10px;"  >
 	 <div  class="icon_button" id="diaryWriteMenu1" > </div>
      <div class="icon_button" id="diaryWriteMenu3"></div>
      <div class="icon_button" id="diaryWriteMenu4"></div>
      	<select name="publicLevelCode" style="margin-left:120px;">
			<c:forEach var="publicLevelList" items="${publicLevelList}">
				<option value="${publicLevelList.publicLevelCode}">${publicLevelList.publicLevelDescription}</option>
			</c:forEach>
		</select>
      
      <input type="submit" value="게시" style="margin-top: 10px;"></div>
      
      </div>
      </form>  
</div> --%>





<!--개인기록  -->
<div id="historyWrite">
<%-- <form id="postReg" action="${pageContext.request.contextPath}/post/postReg" method="post"> --%>
<form id="hitstoryForm" method="post" enctype="multipart/form-data">
	<div id="writeTextarea" style="width: 100%;height: 100%;margin-bottom: 10px; " contenteditable="true" ></div>
	   <input type='hidden' name='content' id='content' style="width: 100%;"/>
	<input type="hidden" name="email" value="${LoginUser}">
		<!--이미지  -->
		<ul id="historyImg" class="offset2 arrow_box" style="display: none;">
			<li class="">
				<h3>이미지를 끌어다 놓으세요</h3>
				<ul id="file-list"></ul>
				<p id="dropzone" class="" style="height: 200px;">
				</p>
			</li>
		</ul>
			<!--날짜  -->
		<div id="historyDate">
		발생일자 : <input type="date" name="startDate"><br />
		종료일자 : <input type="date" name="endDate"><br />
		</div>
			<!--위치정보  -->
			<div id="historymap" style="display: none;">
					<input type="text" id="historyplace" name="historyplace">
			</div>
			<!--이모티콘  -->
		<div id="historyemoticon">
		<c:forEach var="i" begin="1" end="16" step="1">
		<img class="emoticon" id="emoticon${i}" src="${pageContext.request.contextPath}/resources/media/emoticon/emoticon${i}.png">
		</c:forEach>
		</div>
	<!--  -->
	<div style="clear: both; background:#dcdcdc;width:100%; height: 40px ;padding-left:5px;border-radius:0 0 6px 6px; " align="right">
	  <div id="writeicon"  >
 	 <div  class="icon_button" id="historyWriteMenu1" > </div>
      <div class="icon_button" id="historyWriteMenu2"></div>
      <div class="icon_button" id="historyWriteMenu3"></div>
      <div class="icon_button" id="historyWriteMenu4"></div>
      	<select name="publicLevelCode" style="margin-left:120px;">
			<c:forEach var="publicLevelList" items="${publicLevelList}">
				<option value="${publicLevelList.publicLevelCode}">${publicLevelList.publicLevelDescription}</option>
			</c:forEach>
		</select>
      <input id="hitstoryWriteBtn" type="button" value="게시" style="margin-top: 10px;"></div>
      </div>
      </form> 
</div>
</div>


<!-- 게시물 출력 부분 Start -->

<c:forEach var="list" items="${groupList}" varStatus="groupStep">
	
	<%-- <c:forEach var="list" items="${boardList}"> --%>
	<div id="boardlist">
		<%-- ${groupStep.count} 번째 그룹 <br /> --%>
		<div id="list" style="border-radius:6px 6px 6px 6px;">
	
		
		<div style="float: left;">
			<img src="${pageContext.request.contextPath}/resources/media/image/20100107221109605_2R2EJLGPV_raw.jpg" style="width: 50px;height:50px;">
		</div>
		
		<div style="float: left;">
			${list.fullName}<br>
			${list.writeDate}
		</div>
		
		<div style="clear: both; ">
			${list.content}
			<c:if test="${list.fileName != null}">
			<div id="modal-launcher">
				<div id="imghover" >
					<input type="hidden" value="${list.groupSeq}" id="boardSeq${list.boardSeq}">
					
					
						<img id="imghover${list.boardSeq}" src="${pageContext.request.contextPath}/resources/upload/${list.fileName}"  style="width: 100%; height: 250px;">
			
					
				</div>
			</div>
			</c:if>
		</div>
		<div style="clear: both; ">수정 삭제</div>
		</div>
	

		<div id="reply" style="background: #e4e4e4;width:99%;height:100%;  border: 1px solid; border-color:  #e4e4e4;">
			<div style="float: left;padding:5px;padding-left:10px;">
				<img src="${pageContext.request.contextPath}/resources/media/image/20100107221109605_2R2EJLGPV_raw.jpg" style="width: 35px;height:35px; ">
			</div>
			<div style="float: left;padding-top:10px;">
				<form action="board/reply" id="replyMain" method="post" >
					<input type="hidden"  value="${list.boardSeq}" id="boardSeq" name="boardSeq">
					<input name="replyWrite" type="text" style="width:270%; height: 20px;">
				</form>
			</div>
		</div>
	</div>
	
	<%-- </c:forEach> --%>

</c:forEach>
</div>


<!--right  -->
<div id="containerRight" style="width:25%; float:right;">
<ul id="side" style="float: left;margin-left: 30px; ">
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
