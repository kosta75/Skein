<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:forEach var="list" items="${list}">
	<div class="friend-item-container">
		<div class="friend-image-wrapper">
			<img class=""
				src="${pageContext.request.contextPath}/resources/media/image/3.jpg">
		</div>
		<div class="friend-item-info-container">
			<div class="friend-info-wrapper">
				<div>
					<p>${list.email}</p>
				</div>
				<div>
					<p>${list.fullname }</p>
				</div>
			</div>
		</div>
		<div class="unfriend-button" data-uri="${list.personaluri}"
			data-name="${list.fullname}"></div>
	</div>
</c:forEach>