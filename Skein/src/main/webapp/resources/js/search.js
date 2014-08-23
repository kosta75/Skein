$(document).ready(function() {

	$(document).on('click','.addFriends',function(){
		var obj = $(this);
		$.ajax({
			type:'post',
			url:'../friendship/add/' + $(this).data('uri'),
			processData : false,
			contentType : false,
			success : function(data){
				obj.parent().append("<div>Text</div>");
				obj.remove();
			},error : function(){
				
			}
		});
		
	})
	
});