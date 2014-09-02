<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--
PROFILE_RESPONSE_CODE
10 - 로그인한 타인
20 - 비로그인
99 - 사용자 본인
-->
<section class="public-profile-content-container" data-color="${sessionScope.BASE_MEMBER_INFO.colorTheme}" data-email="${sessionScope.BASE_MEMBER_INFO.email}" data-profileImg="${sessionScope.BASE_MEMBER_INFO.profileImageFileName}">
	<div id="modal-background" ></div>
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
						
							
							<div class="modalcontent">

							
							
							</div>
						</div>
					</div>

					<div class="modalreply">
						<div class="replyModalList">
							<div class="replyList" style="width: 95%; margin: auto; border: 1px solid #fff;"></div>
						</div>

						<div id="reply" style="clear: both; background: #e4e4e4; width: 99%; height: 50px; border: 1px solid; border-color: #e4e4e4;">
							<div style="float: left; padding: 5px; padding-left: 10px;">
									<c:choose>
					<c:when test="${sessionScope.BASE_MEMBER_INFO.profileImageFileName == null}">
						<img class="replyImg"src="${pageContext.request.contextPath}/resources/user-profile-image/default-profile-image.png" style="border-radius:100px;width: 40px; height: 40px;"/>
					</c:when>
					<c:otherwise>
						<img class="replyImg" src="${pageContext.request.contextPath}/resources/user-profile-image/${sessionScope.BASE_MEMBER_INFO.profileImageFileName}" style="border-radius:100px;width: 40px; height: 40px;"/>
					</c:otherwise>
				</c:choose>
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

	<div class="main-content-wrapper">
		<!-- 메인 화면 가운데 부분 -->
		<div class="content-center-wrapper" >
		


			<!--공유하기 클릭시 해당 이미지 미리 보기  -->
			<div id="share-detail-preview" style="border-radius: 5px 5px 5px 5px; padding: 10px; width: 300px; height: 400px; margin-left: 330px; margin-top: -400px; background-color: skyblue; opacity: 1; display: none; z-index: 100; position: fixed;">
				<img id="share-detail-preview-imgtag" src=""	style="width: 100%; height: 100%">
			</div>

			<!-- 게시물 출력 부분 Start -->
			<div id="boardListContainer">
				<c:forEach var="groupItem" items="${boardGroupList}">
					<div id="groupItem[${groupItem.groupSeq}]" class="group-item-container">
						
					
						
						<div class="group-item-wrapper" data-personalURI="${groupItem.personalURI}">
							<div class="group-item-controller-container">
								<ul>
								<li>
									<div class="group-item-public-level-cotroller">
									<ul>
									<c:forEach var="publicLevelList" items="${publicLevelList}">
									<c:choose>
										<c:when test="${groupItem.publicLevelCode == publicLevelList.publicLevelCode}">
											<li class="public-level-check ${sessionScope.BASE_MEMBER_INFO.colorTheme}" data-publiclevelcode="${publicLevelList.publicLevelCode}">${publicLevelList.publicLevelDescription}</li>
										</c:when>
										<c:otherwise>
											<li data-publiclevelcode="${publicLevelList.publicLevelCode}">${publicLevelList.publicLevelDescription}</li>
										</c:otherwise>
									</c:choose>				
											</c:forEach>
											</ul>
											</div>
									</li>
								
									<li>
										<c:choose>
											<c:when test="${groupItem.groupCount > 1}">
											<img class='icon-box group-share share-btn ${sessionScope.BASE_MEMBER_INFO.colorTheme}' src='./resources/media/image/shareImg.png' style="margin-right:10px;float: left;" data-boardSeq="${groupItem.boardSeq}" data-groupCount="${groupItem.groupCount}" title="그룹 공유하기">
											</c:when>
											<c:otherwise>
											<img class='icon-box group-share share-btn ${sessionScope.BASE_MEMBER_INFO.colorTheme}' src='./resources/media/image/shareImg.png' style="margin-right:10px;float: left;" data-boardSeq="${groupItem.boardSeq}" data-groupCount="${groupItem.groupCount}" title="그룹 공유하기">
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
										<a id="share-ALL-choice-btn">전체선택</a>
										<a id="share-ALL-clear-btn">전체해제</a>
									</c:if>
								</div>
							</div>

							<div class="group-item-user-info-container">
								<div class="group-item-user-profile-image-wrapper">
								<img src="./resources/user-profile-image/${groupItem.fileName}" />
									
								</div>
								<div class="group-item-user-info-wrapper">
									<a href="${pageContext.request.contextPath}/${groupItem.personalURI}"> ${groupItem.fullName}</a>
									<fmt:formatDate value="${groupItem.writeDate}" pattern="YYYY.MM.dd" var="writeDate" />
									<span class="group-item-write-date">${writeDate}</span>
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
													>
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
								id="boardSeq" class="replyWrite" name="replyWrite" data-fullname="${sessionScope.BASE_MEMBER_INFO.fullName }" />
								<input class="reply-show-hide-btn" style="width:80px;" type="button" value="숨김/보이기">
						</div>

						<div class="group-item-reply-section">
							<ul>
								<c:forEach items="${groupItem.replyList}" var="replyItem">
									<li>
										<div class="group-item-reply-container">
											<div class="group-item-reply-info-container">
												<div class="group-item-reply-profile-image">
													<a href="${pageContext.request.contextPath}/">
													<img src="${pageContext.request.contextPath}/resources/user-profile-image/${replyItem.profileinfo}"
														alt="${replyItem.fullName}" title="${replyItem.fullName}" /><span>${replyItem.fullName}</span></a>
												</div>
												<div>${replyItem.fullName}</div>
											</div>
											
											<div class="group-item-reply-content-container bubble" style="clear: both;">
												
												${replyItem.replyContent}  
												<c:if test="${sessionScope.BASE_MEMBER_INFO.email == replyItem.email}">
													<div class="reply-edit-container" style="float: right;margin-bottom: 5px;" >
												<img class='icon-box reply-Edit ${sessionScope.BASE_MEMBER_INFO.colorTheme}' src='./resources/media/image/editImg.jpg'  style="margin-right:10px;float: left;">	
												<img class='icon-box reply-Delete ${sessionScope.BASE_MEMBER_INFO.colorTheme}'src='./resources/media/image/deleteImg.jpg' data-replySeq="${replyItem.replySeq}" style="float: right;">
													</div>
												</c:if>
												
												</div>
												<div class="bubble"style="display: none;">
												<div class="reply-Edit-Textarea" contenteditable="true" data-replySeq="${replyItem.replySeq}"></div>
												<input type='hidden' name="reply-Edit-Content" id="reply-Edit-Content" />
												</div>
										</div>
										
									</li>
									
									
								</c:forEach>
								<li>
								<c:if test="${groupItem.replyCount >5}">
										<div class="reply-more-btn ${sessionScope.BASE_MEMBER_INFO.colorTheme}" data-boardSeq="${groupItem.boardSeq}">더보기(${groupItem.replyCount -5 })</div>
									
									</c:if>
									</li>
							</ul>
						</div>
							
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
</section>
<script src="${pageContext.request.contextPath}/resources/js/publicProfile.js"></script>