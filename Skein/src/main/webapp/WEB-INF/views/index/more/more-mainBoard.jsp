<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
										<a id="share-ALL-choice-btn">전체선택</a>
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
												<div>${replyItem.fullName}</div>
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