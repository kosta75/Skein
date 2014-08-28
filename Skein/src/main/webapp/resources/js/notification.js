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
	
////////////////////////////////////////////////////////////////////////////////////
	/*var jqDockOpts = {align: 'left', duration: 200, labels: 'tc', size: 48, distance: 85};
	$('#jqDock').jqDock(jqDockOpts);
	*/

	$('.dock-item').click(function(){
		var alramSeq = $(this).find('input').val();
		console.log(alramSeq);
		alert(alramSeq);

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

		return false;
	});
	
	$(document).on('click',"#alram-checkbox-all", function() {
		console.log("click1");
		
		$('input[type=checkbox]').prop("checked",true);
		return false;
	});
	$(document).on('click',"#alram-checkbox-clear", function() {
		console.log("click2");
		$('input[type=checkbox]').prop("checked",false);
		return false;
	});
	
	$(document).on('mouseover',".alram-page-list-div", function() {
		//console.log(aaa);
		$(this).css("background-color", "blanchedalmond");
	});
	$(document).on('mouseout',".alram-page-list-div", function(){
		$(this).css("background-color", "white");
	});
});

