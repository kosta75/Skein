<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
서치 멤버스 <br />

<div id="search" >
	<form class="serch-form" id="searchBar" method="post" action="${pageContext.request.contextPath}/friendship/search/members" role="search" onsubmit="">
		<input type="text" class="textbox" name="fullName"  placeholder="당신의 친구를 찾아보세요" autocomplete="off">
		<button type="submit" class="search-button" onclick="" title="당신의 친구를 찾아보세요" ></button>
	</form>
</div>
<ul>
<c:forEach var="list" items="${list}">
	<li>
		<div>
			<p><a href="${pageContext.request.contextPath}/${sessionScope.PersonalURI}">${list.fullName}</a>(${list.personalURI})</p>
			<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
			<c:choose>
				<c:when test="${list.isFriend != 1}">
					<span class="addFriends" data-uri="${list.personalURI}">친구신청</span>
				</c:when>
				<c:otherwise>
					<span>Text</span>
				</c:otherwise>
			</c:choose>
			</se:authorize>
		</div>
	</li>
</c:forEach>
</ul>