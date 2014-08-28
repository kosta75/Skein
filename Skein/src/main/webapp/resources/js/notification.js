$(document).ready(function() {
	$(".friendship-approved").on('click', function(){
		var obj = $(this);
		//console.log($(this).data("notificationseq"));
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
				alert('친구 신청 요청 오류...');
			}
		});
	});
});

