<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--
추가 작업해야할 내용
1. ajax로 내용 추가시 html 업데이트


 
-->
<p><a href="${pageContext.request.contextPath}">타임라인</a></p>
<div id="notificationList">
</div>
<p><a href="${pageContext.request.contextPath}/notifications/list">알림리스트</a></p>
<p><a href="${pageContext.request.contextPath}/friendship/list">친구리스트</a></p>

<div>
<form id="postReg" action="${pageContext.request.contextPath}/post/postReg" method="post">
	<select name="publicLevelCode">
	<c:forEach var="publicLevelList" items="${publicLevelList}">
		<option value="${publicLevelList.publicLevelCode}">${publicLevelList.publicLevelDescription}</option>
	</c:forEach>
		
	</select>
	<textarea name="content" id="content" cols="30" rows="10">
	</textarea>
	
	<input type="submit" value="Registry" />
</form>
</div>
<div>
<table>
	<tr>
		<th>글번호</th>
		<th>작성자</th>
		<th>글내용</th>
		<th>작성일</th>
		<th>공개범위</th>
	</tr>
	<c:forEach var="list" items="${list}">
	<tr>
		<td>${list.boardSeq}</td>
		<td>${list.fullName}</td>
		<td>${list.content}</td>
		<td>${list.writeDate}</td>
		<td>${list.publicLevelCode}</td>
	</tr>	
	</c:forEach>
</table>


</div>
<div id="response-message">
</div>

<script src="//code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function(){
		/* $("#postReg").on('submit', function(){
			$.ajax({
				type:'post',
				url:'post/postReg',
				cache: false,				
				data:'content=' + $("#content").val(),
			    success:function(data){ //callback
			    	var post = data.post;
			    	historyPost.setBoardSeq(1);
					historyPost.setContent(content);
					historyPost.setBoardKindSeq(1);
					historyPost.setHistorySeq(1);
					historyPost.setFeeling("기분 좋음");
					historyPost.setWeather("비오는날");
					historyPost.setIsImportant(0);
					historyPost.setIsShare(0);
					historyPost.setKeyword("키워드");
					historyPost.setPlace("장소");
					historyPost.setGroupSeq(1);
			    	var msg = post.boardSeq + " / " + post.content + " / "+ post.boardKindSeq + " / ";
					msg += post.historySeq + " / " + post.feeling + " / "+ post.weather + " / ";
			        $("#response-message").empty();
			        $("#response-message").html(msg);
			     },
				error: function(){						
					alert('Error while request..'	);
				}
			});
			return false;
		}) */
		
		/* $("#notificationList").on('click', function(){
			$.ajax({
				type:'post',
				url:'notifications/list',
				cache: false,				
				data:'personalURI='+${sessionScope.personalURI},
			    success:function(data){ //callback
			    	
			        $("#response-message").empty();
			        $("#response-message").html();
			     },
				error: function(){						
					alert('Error while request..'	);
				}
			});
		}); */
		
		
			
	});
</script>