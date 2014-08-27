$(document).ready(function() {
	  //댓글
	$(document).on('keydown',".replyWrite",function(e){
		if (e.keyCode === 13) {
			
		 var boardSeq = $(this).parent().find("input[type=hidden]").val();
		 var replyContent = $(this).val();
		
		 //var reply = $(".group-item-reply-secition ul");
		 var reply = $(this).parent().siblings().eq(1).find("ul");
		 console.log(reply);
			
		$.ajax({
			type : 'post',
			url : 'reply/insert',
			cache : false,
			data : 'boardSeq=' + boardSeq +"&replyContent="+replyContent ,
			success : function(data) {
				reply.append("<li><div class='group-item-reply-container'>" +
						
						"<div class='group-item-reply-content-container bubble'>"+replyContent+"</div></div></li>");	
				
			},
			error : function() {
				alert('indexlogged 354 : Error while request..');
			}
		});
	
	
	
	
	}
	
	
});

});

