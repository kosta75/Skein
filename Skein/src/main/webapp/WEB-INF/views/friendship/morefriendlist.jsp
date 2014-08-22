<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%> 
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