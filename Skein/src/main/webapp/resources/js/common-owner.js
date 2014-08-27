$(document).ready(function() {
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
});
