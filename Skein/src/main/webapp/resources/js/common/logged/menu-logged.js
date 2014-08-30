$(document).ready(function(){	

	//상단 메뉴 고정
	var menupos = $("#menu").offset().top;	
	$(window).scroll(function() {		
		if ($(window).scrollTop() >= menupos) {
			$("#menu2").fadeIn('fast');
			$("#menu2").css("position", "fixed");
			$("#menu2").css("top", "0");
		} else {
			$("#menu2").css("display", "none");
			$("#menu2").css("top", "");
		}
	});
	
	//Top 클릭시 화면의 상단으로 이동
	$(".scroll").click(function(event){            
		event.preventDefault();
		$('html,body').animate({scrollTop:$(this.hash).offset().top}, 300);
	});

	//메뉴에 마우스 오버시 색상 변경
	$("#menu2 .arrowunderline li").hover(
		function(){
			$(this).find("a").css("color", $("#menu2").css("background-color"));
		},function(){
			$(this).find("a").css("color", "");	
		}
	);
		 
});



