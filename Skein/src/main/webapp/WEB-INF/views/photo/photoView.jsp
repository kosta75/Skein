<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section class="content-container">
	<div class="photo-content-wrapper">
		<div id="boardlist-picture">
		<c:forEach var="list" items="${list}">  
			<c:if test="${list.fileName !=null}">  
			<div class="list-item">
				<div class="img-list">
					<img src="${pageContext.request.contextPath}/resources/upload/${list.fileName}" style="width: 155px; height: 155px;">
				</div>
			</div>
			</c:if>
		</c:forEach>
		</div>
	</div>
</section>
<script src="${pageContext.request.contextPath}/resources/js/photoviewlist.js"></script>