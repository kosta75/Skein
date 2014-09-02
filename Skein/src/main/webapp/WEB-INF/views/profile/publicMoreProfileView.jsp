<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach var="groupItem" items="${boardGroupList}">
					<div id="groupItem[${groupItem.groupSeq}]" class="group-item-container">
						
					
						
						<div class="group-item-wrapper">
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
									<c:choose>
										<c:when test="${sessionScope.BASE_MEMBER_INFO.profileImageFileName == null}">
											<img src="${pageContext.request.contextPath}/resources/user-profile-image/default-profile-image.png" />
										</c:when>
										<c:otherwise>
											<img src="${pageContext.request.contextPath}/resources/user-profile-image/${groupItem.fileName}" />
										</c:otherwise>
									</c:choose>
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