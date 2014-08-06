<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
<form id="postReg" action="${pageContext.request.contextPath}/post/postReg" method="post">
	<textarea name="content" id="content" cols="30" rows="10">
	</textarea>
	
	<input type="submit" value="Registry" />
</form>
</div>
<div id="response-message">
</div>
<div id="moreBtn">More</div>
<script src="//code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function(){
		$("#postReg").on('submit', function(){
			$.ajax({
				type:'post',
				url:'post/postReg',
				cache: false,				
				data:'content=' + $("#content").val(),
			    success:function(data){ //callback
			    	var post = data.post;
			    	/* historyPost.setBoardSeq(1);
					historyPost.setContent(content);
					historyPost.setBoardKindSeq(1);
					historyPost.setHistorySeq(1);
					historyPost.setFeeling("기분 좋음");
					historyPost.setWeather("비오는날");
					historyPost.setIsImportant(0);
					historyPost.setIsShare(0);
					historyPost.setKeyword("키워드");
					historyPost.setPlace("장소");
					historyPost.setGroupSeq(1); */
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
		})
		
		$("#moreBtn").on('click', function(){
			$.ajax({
				type:'get',
				url:'post/morePost',
				cache: false,				
			    success:function(data){ //callback
			    	alert(data.member);
			    	$("#response-message").html(data.member.email);
			    	
					//$('#menuView').html("First Name:- " + response.firstName +"</br>Last Name:- " + response.lastName  + "</br>Email:- " + response.email);
			        //$("#response-message").empty();
			        //$("#response-message").html(data.email);
			     },
				error: function(){						
					alert('Error while request..'	);
				}
			});
		});
		
	});
</script>