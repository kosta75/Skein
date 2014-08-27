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
////////////////////////////////////////////////////////////////////////////////////
	var jqDockOpts = {align: 'left', duration: 200, labels: 'tc', size: 48, distance: 85};
	$('#jqDock').jqDock(jqDockOpts);
	

	$('.dock-item').click(function(){
		var alramSeq = $(this).find('input').val();
		console.log(alramSeq);
		alert(alramSeq);
/*
		$.ajax({
			type : 'get',
			url : 'notification/list',
			cache : false,
			data : 'alramSeq=' + alramSeq,
			success : function(data) {
				alert(aa);
				
				
			},
			error : function() {
				alert('indexlogged notification 35 : Error while request..');
			}
		});
*/
		//return false;
	});

	$(document).on('mouseover',".alram-page-list-div", function() {
		console.log(aaa);
		//$(this).css("background-color", "blanchedalmond");
	});
	$(document).on('mouseout',".alram-page-list-div", function(){
		$(this).css("background-color", "white");
	});
	
	
	
	
});

