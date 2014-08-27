$(document).ready(function() {
	$(".friendship-approved").on('click', function(){
		console.log($(this).data("notificationseq"));
		$.ajax({
			type : 'post',
			url : '../friendship/add',
			data : 'email=' + $(this).data("friendemail") + "&notificationSeq=" + $(this).data("notificationseq"),
			cache : false,
			success : function(data) {
				console.log(data);
			},
			error : function() {
				alert('indexlogged 354 : Error while request..');
			}
		});
	});
});

