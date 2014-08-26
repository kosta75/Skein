$(document).ready(function() {

	$(document).on('click','.addFriends',function(){
		var obj = $(this);
		$.ajax({
			type:'post',
			url:'../notification/addFriendsNotification/' + $(this).data('uri'),
			processData : false,
			contentType : false,
			success : function(data){
				obj.parent().append("<div>친구 수락 대기 중</div>");
				obj.remove();
			},error : function(){
				
			}
		});

	});
	$(document).on("mouseover",".serch-friend-list-detail",function(){
		$(this).css("background-color","skyblue");
	});
	
	$(document).on("mouseout",".serch-friend-list-detail",function(){
		$(this).css("background-color","white");
	});
	
});