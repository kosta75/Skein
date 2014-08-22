<!-- 친구 목록 페이지   -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
   uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<se:authentication property="name" var="LoginUser" />
<section class="content-container">
   <div>
      <div id="menu">
         <div id="menu_username">${sessionScope.PersonalURI}</div>
      </div>

      <div id="menu2" class="${colorTheme}" style="color: #fff;">
         <div id="menu_username">${sessionScope.PersonalURI}</div>

      </div>
   </div>

   <div id="container" style="width: 960px; clear: both; margin: auto;">
   
      <!--left  -->
   
      <!--/////////////////사이드 바!! 사용자 정보 //////////////////  -->
  <div id="containerLeft" style="width:25%; height: 100%;float: left;">


<div id="infomember"   style="width: 98%;height:200px; ">

<div id="leftinfo" class="${colorTheme}"  style="width:98%; height: 70px; border-radius:6px 6px 0px 0px;  "></div>

<div style="clear:both;  width:98%; height: 180px;background:#fff; border-radius:0px 0px 6px 6px; " > </div>
</div>
 <div id="sideProfileHeader" >
<img id="sideProfileImg"src="${pageContext.request.contextPath}/resources/media/image/20100107221109605_2R2EJLGPV_raw.jpg"  >

<a href="${pageContext.request.contextPath}/${sessionScope.PersonalURI}">${member.fullName}</a>
<div style="margin-left: 20px;margin-top: 10px;">
이메일:${member.email}<br>
<c:if test="${birthDay == toDay}">
<img src="${pageContext.request.contextPath}/resources/media/image/birthday.jpg" style="width: 30px;height: 30px;"/>
</c:if>
<c:if test="${birthDay != toDay}">
생일:
</c:if>
<fmt:formatDate value="${member.birthday}" type="date" pattern="YYYY년MM월dd일"/>

</div> 

</div> 
<div style="clear: both; margin-top: 20px; ">하이아아아이</div>
<!--******************************날씨 정보******************************   -->
         <div
            style="clear: both; width: 96%; height: 350px; background-color: white; border-radius: 10px 10px 10px 10px; margin-top: 30px;">
            <div id="whatweather">
               <div id="observinfo"
                  style="width: 100%; height: 200px; clear: both;"></div>
               <div id="locationinfo" style="width: 100%; clear: both;"></div>
            </div>
         </div>
<!--********************************************************************** -->
</div>
    <div id="containerCenter" style="width: 75%; float: left; ">
            <div id="friendlist">
            <c:forEach var="list" items="${list}">  
               <div class="list" >
						<div class="friendlistInfo">
							<div>
								<img class="friendImg"
									src="${pageContext.request.contextPath}/resources/media/image/3.jpg"
									style="height: 100%; width: 100%;">
							</div>
							<div class="finfo">
								<div>
									<p>${list.email}</p>
								</div>
								<div>
									<p>${list.fullname }</p>
								</div>
								<div>
									<p>${list.birthday }</p>
								</div>
							</div>
							<div class="finfo">
								<div>
									<p>${list.personaluri }</p>
								</div>
								<div>
									<p>${list.profilecode }= 지금은 null</p>
								</div>
								<div class="friendBtnDiv">
								 	<input type="button" class='friendBtn' value='친구끊기' style="display: none;">
								</div>
							</div>
						</div>
					</div>  
            </c:forEach>
       
			</div>
   </div>
</div>

   <div style="clear: both;"></div>

	
<script src="${pageContext.request.contextPath}/resources/js/friendship.js"></script>
</section>