<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<section class="content-container">
	<div id="modal-background"></div>
	<div id="modal-content" >
		<div id="modal-content-view" class="modal-content-view">
			<div  style="float: right;">
				<img id="modal-close" src="${pageContext.request.contextPath}/resources/media/image/closeBtn.png" style="width: 20px;height: 20px; border-radius:0 6px 0 0;" >
			</div>
			<div style="float: left; width: 59%;height: 100%;">
				<div style="height: 87%;" >
					<div id="detailImg"   style="height:100%; z-index: -2;"  >
					<c:forEach var="imgNumber" begin="0" end="9" step="1">
						<div class="detailImg">
						<c:if test="${imgNumber == 0}">
							<img id="detailImg${imgNumber}"  src="" style="width: 566px; height: 452px; display: block;z-index: -1;border-radius:6px 0 0 0;">
						</c:if>
						<c:if test="${imgNumber > 0}">
							<img id="detailImg${imgNumber}" src="" style="width: 566px; height: 452px; display: none;z-index: -1;border-radius:6px 0 0 0;">
						</c:if>
						<input type="hidden" value="${imgNumber}">
						</div>
					</c:forEach>
					</div>
				</div>
				
				<div style=" clear: both; " id="imgBtnList"></div>
			</div>
			
			<div style="float: right;width: 40%;">
				<div >
					<div style="float: left;  padding-top: 15px;width: 200px;">
						<div class="modalcontent" >
							<div class="modalShare" style="float: right;padding-right: 10px;">
								<input  type="hidden" value="">공유하기
							</div>
							<div class="modal-user-profile-image" style="float: left;">
								<img src="${pageContext.request.contextPath}/resources/user-profile-image/${publicMember.profileImageFileName}" />
							</div>
							
							<!--작성자 이름 날짜 내용 출력  -->
						</div>
					</div>
				</div>
				<div class="modalreply">
					<div class="replyModalList" >
							<div class="replyList" style="width: 95%;margin: auto; border:1px solid #fff;">
						</div>
						
					</div>
					
					<div id="reply" style="clear:both; background: #e4e4e4;width:99%;height:50px;  border: 1px solid; border-color:  #e4e4e4;">
						<div style="float: left;padding:5px;padding-left:10px;">
							<img src="${pageContext.request.contextPath}/resources/media/image/20100107221109605_2R2EJLGPV_raw.jpg" style="width:40px;height:40px; ">
						</div>
						
						<div class="replyWriteForm"style="float: left;padding-top:10px;">
							<input class="modalreplyWrite"type="text" style="width:200%; height: 20px;" >
						</div>
						
						<!-- <div style="float: left;padding-top:10px;">
							<div >
							
								<form action="" id="rWrite" >
									<input name="replyWrite" type="text" style="width:210%; height: 20px;">
								</form>
							</div>
						</div> -->
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
	
	

	<div class="main-content-wrapper">
		<!-- 메인 화면 가운데 부분 -->
		<div class="content-center-wrapper">
			
			
			
			<!--공유하기 클릭시 해당 이미지 미리 보기  -->
			<div id="share-detail-preview" style="border-radius:5px 5px 5px 5px;padding:10px; width:300px; height:400px; margin-left:340px; margin-top: -400px;background-color: skyblue; opacity: 1; display:none;z-index:100;position:fixed;">
				<img id="share-detail-preview-imgtag" src="" style="width:100%; height:100%">

			</div>

			<!-- 게시물 출력 부분 Start -->

			<div id="boardListContainer">
				여기는 프로필!!!!! <br />
				${PROFILE_RESPONSE_CODE}
				<c:forEach var="groupItem" items="${boardGroupList}">
				<div class="group-item-container">
					<div class="group-item-wrapper">
						<div class="group-item-controller-container">
							<ul>
								<li><div class="icon-box group-item-edit" title="수정">수정</div></li>
								<li><div class="icon-box group-item-delete" title="삭제">삭제</div></li>
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

						<div class="group-item-user-info-container">
							<div class="group-item-user-profile-image-wrapper">
								<img src="${pageContext.request.contextPath}/resources/user-profile-image/${publicMember.profileImageFileName}" />
							</div>
							<div class="group-item-user-info-wrapper">
								<a href="${pageContext.request.contextPath}/${publicMember.personalURI}">${publicMember.fullName}</a>
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
					<c:if test="${PROFILE_RESPONSE_CODE != 20}">
					<div class="group-item-reply-write-form-container">
						<div class="image-icon reply-icon">댓글</div>
						<input type="hidden" id="boardSeq" name="boardSeq" value="${groupItem.boardSeq}"/>
						<input type="text" id="boardSeq" class="replyWrite" name="replyWrite" />						
					</div>
					</c:if>

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
			</div>
		</div>
	</div>
</section>
<script src="${pageContext.request.contextPath}/resources/js/publicProfile.js"></script>