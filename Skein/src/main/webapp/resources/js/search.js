$(document).ready(function() {

	$(document).on('click','.add-friendship',function(){
		var obj = $(this);
		$.ajax({
			type:'post',
			url:'../notification/addFriendsNotification/' + $(this).data('uri'),
			processData : false,
			contentType : false,
			success : function(data){
				obj.after("<div>친구 수락 대기 중</div>");
				obj.remove();
			},error : function(){
				
			}
		});
	});
	
	$(document).on('click', '.delete-friendship', function(){
		var result = confirm('친구 관계를 끊습니다. (' + $(this).data('name') + ')\n다시 한번 확인해주세요.' );
		if(result){
			var uri = $(this).data('uri')
			var obj = $(this).parents('.friend-item-container');
			$.ajax({
				type : 'post',
				url : 'delete/' + uri,
				cache : false,
				success : function(data) {
					if(data.result.trim() == 'true'){
						obj.remove();
					}
				},
				error : function() {
					alert('Error while request..');
				}
			});
		}
	});
	
	/*$(document).on('click', '.approved-friendship', function(){
		var obj = $(this);
		$.ajax({
			type : 'post',
			url : '../friendship/add',
			data : 'personalURI=' + $(this).data("uri") + "&notificationSeq=" + $(this).data("notificationseq"),
			cache : false,
			success : function(data) {
				obj.remove();
				location.reload();
			},
			error : function() {
				alert('친구 삭제 요청 오류...');
			}
		});
	});*/
	
	
	
	$(document).on("mouseover",".serch-friend-list-detail",function(){
		$(this).css("background-color","skyblue");
	});
	
	$(document).on("mouseout",".serch-friend-list-detail",function(){
		$(this).css("background-color","white");
	});
	
});