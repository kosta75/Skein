$(document).ready(function() {

	$('#alram').click(function() {

		$('#sidecontent').after($('#alrampage').toggle("display"));

	});

	$('#sidemenu1').click(function() {

		$('#sidemenu1').append($('#mon').toggle("display"));

	});

	$('#sidemenu2').click(function() {

		$('#sidemenu2').after($('#mon').toggle("display"));

	});

	$('#sidemenu3').click(function() {

		$('#sidemenu3').after($('#mon').toggle("display"));

	});

	

	/*//이미지 마우스 오버시
	 $(imghover).hover(function(){
	 var imghover = "#imghover"+ $(this).find("input").val();
	

	 $(imghover).css("opacity","0.4");
	 $(imghover).css("cursor","pointer");
	 },
	 function(){
	 var imghover = "#imghover"+ $(this).find("input").val();
	 $(imghover).css("opacity","1");
	 }
	 );
	
	
	 //이미지 버튼 마우스 오버시
	 $(imgBtn).hover(function(){
	
	 var imgBtn = "#imgBtn"+ $(this).find("input").val();
	 $(this).css("opacity","1");
	 $(this).css("cursor","pointer");	 
	
	 },
	 function(){
	
	 $(this).css("opacity","0.4");
	 }
	 );


	 //상세이미지 이미지 버튼 클릭시 
	 $(imgBtn).click(function(){
	 var imgBtn = "#imgBtn"+$(this).find("input").val();
	 var detailImg = "#detailImg"+$(this).find("input").val();
	 var j = $(this).find("input").val();
	
	 for(var i =1; i<11; i++){
	 if(i == j){
	 $("#detailImg"+i).css("display","block");
	 }else{
	 $("#detailImg"+i).css("display","none");	
	 }
	 }
	
	 });*/

	//상단 메뉴 고정
	var menupos = $("#menu").offset().top;
	$(window).scroll(function() {
		if ($(window).scrollTop() >= menupos) {
			$("#menu").css("display", "none");
			$("#menu2").fadeIn('slow');
			$("#menu2").css("position", "fixed");
			$("#menu2").animate('')
			$("#menu2").css("top", "0");

		} else {
			$("#menu").css("display", "block");
			$("#menu2").css("display", "none");
			$("#menu2").css("top", "");
		}
	});

});
