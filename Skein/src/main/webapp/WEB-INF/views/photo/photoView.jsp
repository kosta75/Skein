<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section class="content-container">
	<div class="photo-content-wrapper">
		<div class="informbox photo">
				<div class="informbox_header">
				<!-- 정보헤더 -->
					<img src="${pageContext.request.contextPath}/resources/media/image/photos_img.png">사진
				</div>
			<c:choose>
				<c:when test="${list.get(0).fileName !=null}">
					
				
				
				<div class="informbox_content">
					<!-- 정보컨텐츠 -->
					<div class="clearfix">
						<div id="boardlist-picture">
							
							<c:forEach var="list" items="${list}">
								<c:if test="${list.fileName !=null}">
									<div class="list-item">
										<div class="img-list">
											<img
												src="${pageContext.request.contextPath}/resources/upload/${list.fileName}" style="width: 155px; height: 155px;">
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
				
				</c:when>
				<c:otherwise>
					<div class="nophoto_content">
						타임라인에서 새로운 사진을 등록해 보세요
					</div>
				</c:otherwise>
			</c:choose>
			
			
			
		</div>
	</div>
</section>
<script
	src="${pageContext.request.contextPath}/resources/js/photoviewlist.js"></script>
