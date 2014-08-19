$(document).ready(function(){
	
	$(".addFriends").on('click', function(){
		var obj = $(this);
		console.log($(this));
		$.ajax({
			type : 'post',
			url : '../../friendship/add/' + $(this).data("uri"),
			cache : false,
			success : function(data) {
				//console.log(data);
				obj.parent().append("<div>Text</div>");
				obj.remove();
				
				
			},
			error : function() {
				alert('Error while request..');
			}
		});
	});

});
