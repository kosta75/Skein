<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
   uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--  날씨 js 파일 import -->
<link href="css/webfont/climacons-font.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.min.2.0.0.js"></script>
<script type="text/javascript" src="js/mustache.js"></script>
<script type="text/javascript" src="js/whatweather.0.6.js"></script>
<!--///////////////////////////////////  -->


<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script> 
$(document).ready(function(){
   $(".img-list").hover(
      function(){
         //alert('호버~!!!!!!!!!!!!!들옴');
          $(this).css("background-color",$('#leftinfo').css("background-color")); 
      },
      function(){
         //alert('호버~2!나감');
          $(this).css("background-color","white"); 
      });   
      
   $("div #whatweather").whatWeather({city:"Brussels"});
   
   
});

</script>
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

   <div id="modal-background"></div>

   <div id="container" style="width: 960px; clear: both; margin: auto;">
   
      <!--left  -->
      <div id="modal-content"
         style="top: 10%; border-radius: 6px 6px 6px 6px;">
         <div style="float: right;">
            <img id="modal-close"
               src="${pageContext.request.contextPath}/resources/media/image/closeBtn.png"
               style="width: 20px; height: 20px; border-radius: 0 6px 0 0;">
         </div>
         <div style="float: left; width: 59%; height: 100%;">
            <div style="height: 87%;">
               <div id="detailImg" style="height: 100%; z-index: -2;">
                  <c:forEach var="imgNumber" begin="1" end="10" step="1">
                     <input type="hidden" value="${imgNumber}">
                     <c:if test="${imgNumber == 1}">
                        <%-- <img id="detailImg${imgNumber}" src="${pageContext.request.contextPath}/resources/media/upload/${list.fileName}.jpg" style="width: 100%; height: 100%; display: block;z-index: -1;border-radius:6px 0 0 0;"> --%>
                     </c:if>
                     <c:if test="${imgNumber != 1}">
                        <img id="detailImg${imgNumber}"
                           src="${pageContext.request.contextPath}/resources/media/image/${imgNumber}.jpg"
                           style="width: 100%; height: 100%; display: none; z-index: -1; border-radius: 6px 0 0 0;">
                     </c:if>
                  </c:forEach>
               </div>
            </div>
            <div style="clear: both;">
               <c:forEach var="imgBtnNumber" begin="1" end="10" step="1">
                  <div id="imgBtn">
                     <input type="hidden" value="${imgBtnNumber}"> <img
                        id="imgBtn${imgBtnNumber}"
                        src="${pageContext.request.contextPath}/resources/media/image/${imgBtnNumber}.jpg"
                        style="width: 40px; height: 40px; padding-left: 15px; padding-top: 10px; opacity: 0.4;">
                  </div>
               </c:forEach>
            </div>
         </div>
         <div style="float: right; width: 40%;">
            <div>
               <div style="float: left; padding-top: 15px; width: 200px;">
                  <div style="float: left;">
                     <img
                        src="${pageContext.request.contextPath}/resources/media/image/20100107221109605_2R2EJLGPV_raw.jpg"
                        style="width: 50px; height: 50px;">
                  </div>
                  <div id="modalfullName"
                     style="padding-left: 5px; float: left; width: 70%; padding-top: 10px;">${post.fullName}
                  </div>
                  <div id="modalwriteDate" style="float: left; padding-left: 5px;">${post.writeDate}</div>
               </div>
               <div id="modalcontent"
                  style="clear: both; padding-top: 15px; padding-bottom: 15px;">${post.content}</div>
            </div>
            <div id="reply"
               style="clear: both; background: #e4e4e4; width: 99%; height: 100%; border: 1px solid; border-color: #e4e4e4;">
               <div style="float: left; padding: 5px; padding-left: 10px;">
                  <img
                     src="${pageContext.request.contextPath}/resources/media/image/20100107221109605_2R2EJLGPV_raw.jpg"
                     style="width: 35px; height: 35px;">
               </div>
               <div style="float: left; padding-top: 10px;">
                  <div>
                     <form action="" id="rWrite">
                        <input name="replyWrite" type="text"
                           style="width: 210%; height: 20px;">
                     </form>
                  </div>
               </div>
            </div>

         </div>
      </div>
      <!--/////////////////사이드 바!! 사용자 정보 //////////////////  -->
      <div id="containerLeft" style="width: 25%; float: left;">
         <div id="infomember" style="width: 98%; height: 200px;">
            <div id="leftinfo" class="${colorTheme}"
               style="width: 98%; height: 70px; border-radius: 6px 6px 0px 0px;"></div>
            <div
               style="clear: both; width: 98%; height: 160px; background: #fff; border-radius: 0px 0px 6px 6px;">
            </div>
         </div>
         <div
            style="position: absolute; z-index: 0; width: 230px; margin-top: 40px;">
            <img
               src="${pageContext.request.contextPath}/resources/media/image/20100107221109605_2R2EJLGPV_raw.jpg"
               width="80px" height="80px"
               style="border: 3px solid; border-color: #fff; border-radius: 6px; vertical-align: middle; margin-left: 10px;">

            ${member.fullName}
            <div style="margin-left: 20px; margin-top: 10px;">
               이메일:${member.email}<br>
               <c:if test="${birthDay == toDay}">
                  <img
                     src="${pageContext.request.contextPath}/resources/media/image/birthday.jpg"
                     style="width: 30px; height: 30px;" />
               </c:if>
               <c:if test="${birthDay != toDay}">
                  생일:
               </c:if>
               <fmt:formatDate value="${member.birthday}" type="date"
                  pattern="YYYY년MM월dd일" />
            </div>
            
         </div>
         =====================================
         <!--날씨 정보   -->
         <div style="clear: both; width: 96%; height: 150px;background-color : yellow; border-radius: 6px 6px 6px 6px; margin-top: 20px;  ">
            <div id="whatweather">
            <%-- <img  src="${pageContext.request.contextPath}/resources/media/image/sunny.gif" style="height: 50px; width: 50px;"> --%>
            </div>
         </div>
         
      </div>
   <!-- 
      <div style=" clear:both; background-color: red;  height:80;">
            abb
         </div> 
   -->
      <!--////////////////////////////////center ////////////////////////// -->
      <div id="containerCenter" style="width: 75%; float: left; ">
      <%--     --%>
            <div id="boardlist-picture">
            <c:forEach var="list" items="${list}">    
               <div class="list" style="border-radius: 6px 6px 6px 6px; width: 174px;height: 174px;">
                  <div class="img-list">
                     <img   src="${pageContext.request.contextPath}/resources/upload/${list.fileName}" style="width: 155px; height: 155px;">
                  </div>
               </div>
            </c:forEach>
            <%--
            <c:forEach var="list" items="${list}">    
            <div id="list" style="border-radius: 6px 6px 6px 6px;">
                  <div style="float: left;">
                     <img
                        src="${pageContext.request.contextPath}/resources/media/image/20100107221109605_2R2EJLGPV_raw.jpg"
                        style="width: 0px; height: 50px;">
                  </div>
                  <div style="float: left;">
                     ${list.fullName}<br> ${list.writeDate}
                  </div>
                  <div style="clear: both;">
                     ${list.content}
                     <div id="modal-launcher">
                        <div id="imghover">
                           <input type="hidden" value="${list.boardSeq}"
                              id="boardSeq${list.boardSeq}">
                           <c:if test="${list.fileName != null}">
                              <img id="imghover${list.boardSeq}"
                                 src="${pageContext.request.contextPath}/resources/upload/${list.fileName}"
                                 style="width: 100%; height: 250px;">
                           </c:if>
                        </div>
                     </div>
                  </div>
                   <div style="clear: both;">수정 삭제</div> 
               </div>
               
                
                <div id="reply"
                  style="background: #e4e4e4; width: 99%; height: 100%; border: 1px solid; border-color: #e4e4e4;">
                  <div style="float: left; padding: 5px; padding-left: 10px;">
                     <img
                        src="${pageContext.request.contextPath}/resources/media/image/20100107221109605_2R2EJLGPV_raw.jpg"
                        style="width: 35px; height: 35px;">
                  </div>
                  <div style="float: left; padding-top: 10px;">
                     <form action="" id="rWrite">
                        <input name="replyWrite" type="text"
                           style="width: 270%; height: 20px;">
                     </form>
                  </div>
               </div> 
         </div>

         </c:forEach>
      </div> --%>


      <!--right  -->
<!-- 
      <div id="containerRight" style="width: 25%; float: right;">
         <ul id="side" style="float: left; margin-left: 30px;">
            <li id="sidemenu1" style="clear: both; float: left;">2014</li>
            <li id="sidemenu2" style="clear: both; float: left;">2013</li>
            <li id="sidemenu3" style="clear: both; float: left;">2012</li>
            <li id="sidemenu4" style="clear: both; float: left;">그외</li>
         </ul>
         <div>
            <ul id="mon"
               style="display: none; clear: both; padding-top: 5px; padding-left: 5px;">
               <li id="12">12월</li>
               <li id="11">11월</li>
               <li id="10">10월</li>
               <li id="9">9월</li>
               <li id="8">8월</li>
               <li id="7">7월</li>
               <li id="6">6월</li>
               <li id="5">5월</li>
               <li id="4">4월</li>
               <li id="3">3월</li>
               <li id="2">2월</li>
               <li id="1">1월</li>
            </ul>
         </div>
      </div>
 -->
</div>
   </div>


   <div style="clear: both;"></div>



</section>