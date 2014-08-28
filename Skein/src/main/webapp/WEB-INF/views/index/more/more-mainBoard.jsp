<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

				<c:forEach var="groupItem" items="${groupList}">
				<div class="group-item-container">
					<div class="group-item-wrapper">
						<div class="group-item-controller-container">
							<ul>
								<li><div class="icon-box group-item-edit" title="수정">수정</div></li>
								<li><div class="icon-box group-item-delete" title="삭제">삭제</div></li>
								<li>
									<c:choose>
										<c:when test="${groupItem.groupCount > 1}">
											<div class="icon-box group-share" title="그룹 공유하기">그룹 공유하기</div>
										</c:when>
										<c:otherwise>
											<div class="icon-box one-share" title="공유하기">공유하기</div>
										</c:otherwise>
									</c:choose>
								</li>
							</ul>
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
										<input type="hidden" value="${groupItem.groupSeq}" id="boardSeq${groupItem.boardSeq}">
										<img id="imghover${groupItem.boardSeq}" src="${pageContext.request.contextPath}/resources/upload/${groupItem.fileName}" style="width: 100%; height: 250px;">
									</div>
								</div>
								</c:if>
							</div>
							<div>
								${groupItem.content} 
								
							</div>
						</div>
					</div>
					
					<div class="group-item-reply-write-form-container">
						<div class="image-icon reply-icon">댓글</div>
						<input type="hidden" id="boardSeq" name="boardSeq" value="${groupItem.boardSeq}"/>
						<input type="text" id="boardSeq" class="replyWrite" name="replyWrite" />
						<div class="reply-message"></div>						
					</div>

					<div class="group-item-reply-section">
						<ul>
							<c:forEach items="${groupItem.replyList}" var="replyItem">
							<li>
								<div class="group-item-reply-container">
									<div class="group-item-reply-info-container">
										<div class="group-item-reply-profile-image"><a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/user-profile-image/default-profile-image.png" alt="${replyItem.fullName}" title="${replyItem.fullName}" /><span>${replyItem.fullName}</span></a></div>
									</div>
									<div class="group-item-reply-content-container bubble">
										${replyItem.replyContent}
									</div>
								</div>
							</li>
							</c:forEach>
						</ul>
					</div>
					
				</div>
				</c:forEach>
		