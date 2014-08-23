<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<se:authentication property="name" var="LoginUser" />
<section class="content-container">
<div id="subNavigationContainer">
		<div id="menu" class="sub-menu">
			<div class="menu-username">
				<a  href="${pageContext.request.contextPath}/${sessionScope.PersonalURI}">${sessionScope.PersonalURI}</a>
			</div>
			<nav class="sub-navigation">
				<ul class="arrowunderline">
					<li><a href="${pageContext.request.contextPath}/timeline/viewlist">타임라인</a></li>
					<li><a href="#">정보</a></li>
					<li><a href="${pageContext.request.contextPath}/photo/viewlist?pictureCount=0">사진</a></li>	
					<li><a href="${pageContext.request.contextPath}/friendship/viewlist">친구</a></li>
	
				</ul>
			</nav>
		</div>
			
		<div id="menu2" class="sub-menu2 ${colorTheme}">
			<div class="menu-username">
				<a  href="${sessionScope.PersonalURI}">${sessionScope.PersonalURI}</a>
			</div>

			<nav class="sub-navigation">
				<ul class="arrowunderline">
					<li><a href="${pageContext.request.contextPath}/timeline/viewlist">타임라인</a></li>
					<li><a href="#">정보</a></li>
					<li><a href="${pageContext.request.contextPath}/photo/viewlist?pictureCount=0">사진</a></li>
					<li><a href="${pageContext.request.contextPath}/friendship/viewlist">친구</a></li>
					<li><a href="#">고객센터</a></li>
					<li><a href="${pageContext.request.contextPath}/security/logout">Log Out</a></li>
				</ul>
			</nav>
		</div>
	</div>
   
	<!-- 왼쪽 사용자 개인정보  -->
	<div id="subUserProfileContainer">
		<div id="infomember">
			<div class="sub-user-profile-tip ${colorTheme}"></div>
			<div class="sub-user-profile-wrapper">
				<div class="sub-user-profile-image-container">
					<img src="${pageContext.request.contextPath}/resources/media/image/20100107221109605_2R2EJLGPV_raw.jpg">
				</div>
				<div class="sub-user-profile-name">
					<a href="${pageContext.request.contextPath}/${sessionScope.PersonalURI}">${member.fullName}</a>
				</div>
				
				<div class="sub-user-proifle-info">
					<p>${member.email}</p>
					<div class="sub-user-profile-birthday">								
						<fmt:formatDate value="${member.birthday}" type="date" pattern="YYYY년MM월dd일"/>
						<c:if test="${birthDay == toDay}">
							<img src="${pageContext.request.contextPath}/resources/media/image/birthday.jpg" style="width: 30px;height: 30px;"/>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		
		<!--******************************날씨 정보******************************   -->
         <div class="weather-info-container">
         	<div id="whatweather">
         		<div id="observinfo"></div>
         		<div id="locationinfo"></div>
         	</div>
		</div>
		<!--********************************************************************** -->
	</div>
	

	<div class="friendship-content-wrapper">
		<div id="friendlist">
		<c:forEach var="list" items="${list}">
			<div class="friend-item-container">
				<div class="friend-image-wrapper">
					<img class="" src="${pageContext.request.contextPath}/resources/media/image/3.jpg">
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
				<div class="unfriend-button" data-uri="${list.personaluri}" data-name="${list.fullname}"></div>
			</div>  
		</c:forEach>
		</div>
	</div>
</section>
