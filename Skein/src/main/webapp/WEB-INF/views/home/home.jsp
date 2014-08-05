<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<div>
<form id="postReg" action="${pageContext.request.contextPath}/post/postReg" method="post">
	<textarea name="content" id="content" cols="30" rows="10">
	</textarea>
	
	<input type="submit" value="Registry" />
</form>
</div>
<div id="response-message">
</div>
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
			        $("#response-message").empty();
			        $("#response-message").html(data);
			     },
				error: function(){						
					alert('Error while request..'	);
				}
			});
			return false;
		})
		
	});
</script>