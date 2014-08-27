$(document).ready(function(){
	var jqDockOpts = {align: 'left', duration: 200, labels: 'tc', size: 48, distance: 85};
	$('#jqDock').jqDock(jqDockOpts);
	
	
	
	
	$('.dock-item').click(function(){
		var alramSeq = $(this).find('input').val();
		console.log(alramSeq);
		//alert(alramSeq);

		$.ajax({
			type : 'post',
			url : 'notification/',
			cache : false,
			data : 'alramSeq=' + alramSeq,
			success : function(data) {
			
				
				
			},
			error : function() {
				alert('indexlogged : Error while request..');
			}
		});

		return false;
	});
	
	
	
	
});