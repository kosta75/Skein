$(document).ready(function(){
	
	//사이드 메뉴 자동 스크롤 Start
	//필요한 값
	var sideInfoObjectName = "#subUserProfileContainer";
	var menuYloc = parseInt($(sideInfoObjectName).css("top").substring(0,$(sideInfoObjectName).css("top").indexOf("px")))
	$(window).scroll(function () { 
		offset = menuYloc+$(document).scrollTop()+"px";
		$(sideInfoObjectName).animate({top:offset},{duration:800,queue:false});
		if ($(window).scrollTop() == $(document).height() - $(window).height()){
			$(sideInfoObjectName).css("margin-top","-100px");
		}else{
			$(sideInfoObjectName).css("margin-top","0px");
		}
	});//사이드 메뉴 자동스크롤 End

	$('#sidemenu1').click(function() {
		$('#sidemenu1').append($('#mon').toggle("display"));
	});
	$('#sidemenu2').click(function() {
		$('#sidemenu2').after($('#mon').toggle("display"));
	});
	$('#sidemenu3').click(function() {
		$('#sidemenu3').after($('#mon').toggle("display"));
	});		 
});



