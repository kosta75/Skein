<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<se:authentication property="name" var="LoginUser"/>
<section class="content-container">
	<div id="subNavigationContainer">
		<div id="menu" class="sub-menu">
			<div class="menu-username">
				<a  href="${pageContext.request.contextPath}/${sessionScope.PersonalURI}">${sessionScope.PersonalURI}</a>
			</div>
			<nav class="sub-navigation">
				<ul class="arrowunderline">
					<li><a href="${pageContext.request.contextPath}/timeline/viewlist">타임라인</a></li>
					<li><a href="#">정보</a></li>
					<li><a href="${pageContext.request.contextPath}/photo/viewlist?pictureCount=0">사진</a></li>	
					<li><a href="${pageContext.request.contextPath}/friendship/viewlist?friendCount=0">친구</a></li>
	
				</ul>
			</nav>
		</div>
			
		<div id="menu2" class="sub-menu2 ${colorTheme}">
			<div class="menu-username">
				<a  href="${sessionScope.PersonalURI}">${sessionScope.PersonalURI}</a>
			</div>

			<nav class="sub-navigation">
				<ul class="arrowunderline">
					<li><a href="/skein">타임라인</a></li>
					<li><a href="#">정보</a></li>
					<li><a href="${pageContext.request.contextPath}/photo/viewlist?pictureCount=0">사진</a></li>
					<li><a href="${pageContext.request.contextPath}/friendship/viewlist?friendCount=0">친구</a></li>
					<li><a href="#">고객센터</a></li>
					<li><a href="${pageContext.request.contextPath}/security/logout">Log Out</a></li>
					<li><a href="#changeBackgroundColor" class="scroll">▲TOP</a></li>
				</ul>
			</nav>
		</div>
	</div>

	<div id="modal-background"></div>
	<div id="modal-content">
		<div  style="float: right;">
			<img id="modal-close" src="${pageContext.request.contextPath}/resources/media/image/closeBtn.png" style="width: 20px;height: 20px; border-radius:0 6px 0 0;" >
		</div>
		
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
			
			<div style=" clear: both; " id="imgBtnList"></div>
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
	
	<!-- 왼쪽 사용자 개인정보  -->
	<div id="subUserProfileContainer">
		<div id="infomember">
			<div class="sub-user-profile-tip ${colorTheme}"></div>
			<div class="sub-user-profile-wrapper">
				<div class="sub-user-profile-image-container">
					<img src="${pageContext.request.contextPath}/resources/media/image/20100107221109605_2R2EJLGPV_raw.jpg">
				</div>
				<div class="sub-user-profile-name">
					<a href="${pageContext.request.contextPath}/${sessionScope.PersonalURI}">${member.fullName}</a>
				</div>
				
				<div class="sub-user-proifle-info">
					<p>${member.email}</p>
					<div class="sub-user-profile-birthday">								
						<fmt:formatDate value="${member.birthday}" type="date" pattern="YYYY년MM월dd일"/>
						<c:if test="${birthDay == toDay}">
							<img src="${pageContext.request.contextPath}/resources/media/image/birthday.jpg" style="width: 30px;height: 30px;"/>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		
		<!--******************************날씨 정보******************************   -->
         <div class="weather-info-container">
         	<div id="whatweather">
         		<div id="observinfo"></div>
         		<div id="locationinfo"></div>
         	</div>
		</div>
		<!--********************************************************************** -->
	</div>
	
	
	<!-- 오른쪽 날짜 선택 부분  -->
	<div id="dateSelector">
		<ul id="side">
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
	

	<div class="content-wrapper">
		<!--center  -->
		<div class="content-center-wrapper">
			<div id="boardListTimelineContainer"></div>
			<div id="writeTabs">
				<ul>
					<li><a href="#diaryWriteTabs">다이어리</a></li>
					<li><a href="#historyWriteTabs">개인기록</a></li>
				</ul>
				<div id="diaryWriteTabs">
					<div>
					Content
					</div>
				</div>
				<div id="historyWriteTabs">
					<div id="historyWriteForm">
					<%-- <form id="postReg" action="${pageContext.request.contextPath}/post/postReg" method="post"> --%>
					<form id="hitstoryForm" method="post" enctype="multipart/form-data">
						<div id="dropzone">
							<span class="placeholder">내용을 입력해 주세요...</span>
							<span class="help-message">* 이미지를 등록하시려면 여기에 끌어다 놓으세요!</span>
							<div id="writeTextarea" contenteditable="true"></div>
						</div>
						<input type='hidden' name="content" id="content" />
						<input type="hidden" name="email" value="${LoginUser}" />
						<!--이미지  -->
						<div id="historyImg" class="offset2 arrow_box">
							<ul id="file-list"></ul>
						</div>
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
						<div class="write-menu-bar">
							<div id="writeicon"  >
								<div  class="icon_button" id="historyWriteMenu1" ></div>
								<div class="icon_button" id="historyWriteMenu2"></div>
								<div class="icon_button" id="historyWriteMenu3"></div>
								<div class="icon_button" id="historyWriteMenu4"></div>
								<select name="publicLevelCode" style="margin-left:120px;">
									<c:forEach var="publicLevelList" items="${publicLevelList}">
										<option value="${publicLevelList.publicLevelCode}">${publicLevelList.publicLevelDescription}</option>
									</c:forEach>
								</select>
								<input id="hitstoryWriteBtn" type="button" value="게시" style="margin-top: 10px;" />
							</div>
						</div>
					</form> 
				</div>
			  </div>
			</div>


			<!-- 게시물 출력 부분 Start -->
			<div id="boardListContainer">
				<c:forEach var="list" items="${groupList}" varStatus="groupStep">
				<div class="group-item-container">
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
					<div style="clear: both;float: right;"><input type="button" value="공유하기"> </div>
					<div style="clear: both;float: right;">수정 삭제</div>
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
				</c:forEach>
			</div>
		</div>
	</div>
	
	
		
		
	<div style="clear: both;"></div>

<script src="${pageContext.request.contextPath}/resources/js/filereader.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/map.js"></script>
<script src="//code.highcharts.com/stock/highstock.js"></script>
<script src="//code.highcharts.com/stock/modules/exporting.js"></script>


</section>
