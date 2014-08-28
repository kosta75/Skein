<%@ page import="kr.co.skein.model.vo.BoardGroup"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="YYYY년MM월dd일" var="today" />

<se:authentication property="name" var="LoginUser" />
<section class="content-container">
	<div id="modal-background"></div>
	<div id="modal-content">
		<div id="modal-content-view" class="modal-content-view">
			<div style="float: right;">
				<img id="modal-close" src="${pageContext.request.contextPath}/resources/media/image/closeBtn.png"	style="width: 20px; height: 20px; border-radius: 0 6px 0 0;">
			</div>
			<div style="float: left; width: 59%; height: 100%;">
				<div style="height: 87%;">
					<div id="detailImg" style="height: 100%; z-index: -2;">
						<c:forEach var="imgNumber" begin="0" end="9" step="1">
							<div class="detailImg">
								<c:if test="${imgNumber == 0}">
									<img id="detailImg${imgNumber}" src="" style="width: 566px; height: 452px; display: block; z-index: -1; border-radius: 6px 0 0 0;">
								</c:if>
								<c:if test="${imgNumber > 0}">
									<img id="detailImg${imgNumber}" src="" style="width: 566px; height: 452px; display: none; z-index: -1; border-radius: 6px 0 0 0;">
								</c:if>
								<input type="hidden" value="${imgNumber}">
							</div>
						</c:forEach>
					</div>
				</div>

				<div style="clear: both;" id="imgBtnList"></div>
			</div>

			<div style="float: right; width: 40%;">
				<div>
					<div style="float: left; padding-top: 15px; width: 200px;">
						<div class="modal-content-area">
							<div class="modal-edit-Div" style="margin: auto; display: none;">
								<div id="modal-EditTextarea" contenteditable="true"></div>
								<input type='hidden' name="modaleditcontent" id="modaleditcontent" />

								<div class="modaleditEmoticon" style="float: right;">이모티콘</div>
								<div class="modaleditCancleBtn" style="float: right; margin-right: 10px">취소</div>
								<div class="modaleditBtn" style="float: right; margin-right: 10px">수정</div>
							</div>

							<div class="modalcontent">

								<div style="float: right">
									<div class="modal-Edit" style="float: left; margin-right: 10px">수정</div>
									<div class="modal-Delete" style="float: left; margin-right: 10px">삭제</div>
									<div class="modalShare" style="float: right; padding-right: 10px;">
										<input type="hidden" value="">공유하기
									</div>
									<div class="modal-user-profile-image" style="float: left;">
										<img src="${pageContext.request.contextPath}/resources/user-profile-image/${sessionScope.BASE_MEMBER_INFO.profileImageFileName}" />
										<%-- <img  src="${pageContext.request.contextPath}/resources/media/image/20100107221109605_2R2EJLGPV_raw.jpg" style="width: 50px;height:50px;"> --%>
									</div>

									<!--작성자 이름 날짜 내용 출력  -->
								</div>
								<div id="modalemoticon">
									<c:forEach var="i" begin="1" end="16" step="1">
										<img class="modal-edit-emoticon" id="emoticon${i}" src="${pageContext.request.contextPath}/resources/media/emoticon/emoticon${i}.gif">
									</c:forEach>
								</div>
							</div>
						</div>
					</div>

					<div class="modalreply">
						<div class="replyModalList">
							<div class="replyList" style="width: 95%; margin: auto; border: 1px solid #fff;"></div>
						</div>

						<div id="reply" style="clear: both; background: #e4e4e4; width: 99%; height: 50px; border: 1px solid; border-color: #e4e4e4;">
							<div style="float: left; padding: 5px; padding-left: 10px;">
								<img src="${pageContext.request.contextPath}/resources/media/image/20100107221109605_2R2EJLGPV_raw.jpg" style="width: 40px; height: 40px;">
							</div>
							<div class="replyWriteForm" style="float: left; padding-top: 10px;">
								<input class="modalreplyWrite" type="text" 	style="width: 310px; height: 20px;">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 오른쪽 날짜 선택 부분  -->
	<div id="dateSelector">
		<ul id="side">
			<li id="sidemenu1" style="clear: both; float: left;">2014</li>
			<li id="sidemenu2" style="clear: both; float: left;">2013</li>
			<li id="sidemenu3" style="clear: both; float: left;">2012</li>
			<li id="sidemenu4" style="clear: both; float: left;">그외</li>
		</ul>
		<div>
			<ul id="mon"
				style="display: none; clear: both; padding-top: 5px; padding-left: 5px;">
				<li id="12">12월</li>
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


	<div class="main-content-wrapper">
		<!-- 메인 화면 가운데 부분 -->
		<div class="content-center-wrapper">
			<div id="boardListTimelineContainer"></div>
			<div id="writeTabs">
				<ul>
					<li><a href="#diaryWriteTabs">다이어리</a></li>
					<li><a href="#historyWriteTabs">개인기록</a></li>
				</ul>
				<div id="diaryWriteTabs">
					<div>Content</div>
				</div>
				<div id="historyWriteTabs">
					<div id="historyWriteForm">
						<%-- <form id="postReg" action="${pageContext.request.contextPath}/post/postReg" method="post"> --%>
						<form id="hitstoryForm" method="post"
							enctype="multipart/form-data">
							<div id="dropzone">
								<span class="placeholder">내용을 입력해 주세요...</span>
								<span 	class="help-message">* 이미지를 등록하시려면 여기에 끌어다 놓으세요!</span>
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
									<img class="emoticon" id="emoticon${i}" src="${pageContext.request.contextPath}/resources/media/emoticon/emoticon${i}.gif">
								</c:forEach>
							</div>
							<!--  -->
							<div class="write-menu-bar">
								<div id="writeicon">
									<div class="icon_button" id="historyWriteMenu1"></div>
									<div class="icon_button" id="historyWriteMenu2"></div>
									<div class="icon_button" id="historyWriteMenu3"></div>
									<div class="icon_button" id="historyWriteMenu4"></div>
									<div style="float: right; margin-right: 20px;">
										<select name="publicLevelCode" style="margin-left: 120px;">
											<c:forEach var="publicLevelList" items="${publicLevelList}">
												<option value="${publicLevelList.publicLevelCode}">${publicLevelList.publicLevelDescription}</option>
											</c:forEach>
										</select>
										<input id="hitstoryWriteBtn" type="button" value="게시" style="margin-top: 10px;" />
									</div>
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
							</div>
						</form>
					</div>
				</div>
			</div>


			<!--공유하기 클릭시 해당 이미지 미리 보기  -->
			<div id="share-detail-preview" style="border-radius: 5px 5px 5px 5px; padding: 10px; width: 300px; height: 400px; margin-left: 340px; margin-top: -400px; background-color: skyblue; opacity: 1; display: none; z-index: 100; position: fixed;">
				<img id="share-detail-preview-imgtag" src=""	style="width: 100%; height: 100%">
			</div>

			<!-- 게시물 출력 부분 Start -->
			<div id="boardListContainer">
				<c:forEach var="groupItem" items="${groupList}">
					<div class="group-item-container">
						<div class="editDiv" style="margin: auto; display: none;">
							<div id="editTextarea" contenteditable="true">${groupItem.content}</div>
								<input type='hidden' name="editcontent" id="editcontent"	data-boardSeq="${groupItem.boardSeq }" />
							<!--이모티콘  -->
							<div class="editemoticon" style="display: none;">
								<c:forEach var="i" begin="1" end="16" step="1">
									<img class="edit-emoticon-icon" id="emoticon${i}" src="${pageContext.request.contextPath}/resources/media/emoticon/emoticon${i}.gif">
								</c:forEach>
							</div>
							<div style="clear: both; float: right;">
								<div class="edit-cancle" style="margin-right: 10px; float: right;">취소</div>
								<div class="edit-Btn" style="margin-right: 10px; float: right;">수정완료</div>
								<div class="edit-emoticon" style="margin-right: 10px; float: right;">이모티콘</div>
							</div>
						</div>
						
						<div class="group-item-wrapper">
							<div class="group-item-controller-container">
								<ul>
									<li><div class="icon-box group-item-edit" data-boardSeq="${groupItem.boardSeq}" data-groupCount="${groupItem.groupCount}" title="수정">수정</div></li>
									<li><div class="icon-box group-item-delete" data-groupSeq="${groupItem.groupSeq}" data-groupCount="${groupItem.groupCount}" title="삭제">삭제</div></li>
									<li>
										<c:choose>
											<c:when test="${groupItem.groupCount > 1}">
												<div class="icon-box group-share share-btn" title="그룹 공유하기">그룹 공유하기</div>
											</c:when>
											<c:otherwise>
												<div class="icon-box one-share share-btn" title="공유하기">공유하기</div>
											</c:otherwise>
										</c:choose>
									</li>
								</ul>
							</div>

							

							<div class="share-info-div" style="text-align: center; border-radius: 10px 10px 10px 10px; width: 250px; /* height: 300px; */ display: none; right: -254px; margin-top: 0px; background-color: white; z-index: 1; position: absolute;">
								<input type="hidden" value="${groupItem.groupSeq}" id="boardSeq${groupItem.boardSeq}" class="share-input">
								<b>공 유 하 기</b>

								<div class="share-img-list" style="clear: both;">
									<!-- 목록 들어가는 곳  -->
								</div>
								<div style="clear: both;">
									<a id="share-confirm-btn">확인</a> <a id="share-cancel-btn">취소</a>
									<c:if test="${groupItem.groupCount >= 2}">
										<a id="share-ALL-clear-btn">전체해제</a>
									</c:if>
								</div>
							</div>

							<div class="group-item-user-info-container">
								<div class="group-item-user-profile-image-wrapper">
									<img src="${pageContext.request.contextPath}/resources/media/image/20100107221109605_2R2EJLGPV_raw.jpg">
								</div>
								<div class="group-item-user-info-wrapper">
									<a href="${pageContext.request.contextPath}/${sessionScope.BASE_MEMBER_INFO.personalURI}">${sessionScope.BASE_MEMBER_INFO.fullName}</a>
									<span class="group-item-write-date">${groupItem.writeDate}</span>
								</div>
							</div>
							<div class="group-item-content-wrapper">
								<div>
									<c:if test="${groupItem.fileName != null}">
										<div id="modal-launcher" data-boardSeq="${groupItem.boardSeq}">
											<div id="imghover">
												<input type="hidden" value="${groupItem.groupSeq}"
													id="boardSeq${groupItem.boardSeq}"> <img
													id="imghover${groupItem.boardSeq}"
													src="${pageContext.request.contextPath}/resources/upload/${groupItem.fileName}"
													style="width: 100%; height: 250px;">
											</div>
										</div>
									</c:if>
								</div>
								<div>${groupItem.content}</div>
							</div>
						</div>

						<div class="group-item-reply-write-form-container">
							<div class="image-icon reply-icon">댓글</div>
							<input type="hidden" id="boardSeq" name="boardSeq"
								value="${groupItem.boardSeq}" /> <input type="text"
								id="boardSeq" class="replyWrite" name="replyWrite" />
						</div>

						<div class="group-item-reply-section">
							<ul>
								<c:forEach items="${groupItem.replyList}" var="replyItem">
									<li>
										<div class="group-item-reply-container">
											<div class="group-item-reply-info-container">
												<div class="group-item-reply-profile-image">
													<a href="${pageContext.request.contextPath}/"><img
														src="${pageContext.request.contextPath}/resources/user-profile-image/default-profile-image.png"
														alt="${replyItem.fullName}" title="${replyItem.fullName}" /><span>${replyItem.fullName}</span></a>
												</div>
											</div>
											<div class="group-item-reply-content-container bubble">
												${replyItem.replyContent}</div>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</section>
<script
	src="${pageContext.request.contextPath}/resources/js/filereader.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/map.js"></script>
<script src="//code.highcharts.com/stock/highstock.js"></script>
<script src="//code.highcharts.com/stock/modules/exporting.js"></script>

