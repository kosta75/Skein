$(document).ready(function() {
	
	//저장
	$(".inform_edit").on("click",".profile_editBtn",function(){
		profileInfo = $(this).parent().find("input[name=profileInfo]").val();
		if( profileInfo == ""){
			alert("내용을 입력해주세요");
		}else{
			$(this).parent().css("display", "none").siblings().css("display", "block");
			profileCode = $(this).parent().find("input:hidden").val();
			publicLevelCode = $(this).parent().find("select").val();
			email = $("input:hidden[name=email]").val();
			$.ajax({
				type : 'post',
				url : 'profile/',
				cache : false,
				data :'profileInfo='+ profileInfo + '&profileCode='+ profileCode + '&publicLevelCode='+ publicLevelCode + '&email='+ email,
				success : function(data) {
					alert("정보가 수정되었습니다!");
					profileName = $("input:hidden[value=" + profileCode + "]").attr("name");
					$("input:hidden[name=" + profileName + "Public]").val(publicLevelCode);
					$(".informdata."+profileName).html(profileInfo);
				},
				error : function() {
					alert('Error');
					return false;
				}
			});
			
		}
		
	});
	$(".inform_elem").mouseenter(function(){
		if($(this).find("div.inform_edit").css("display") == "none"){
			$(this).find("div.inform_button").css("display", "block");
		}
	});
	
	$(".inform_elem").mouseleave(function(){
		$(this).find("div.inform_button").css("display","none");
	});
	
	$("input:button[value=수정]").click( function(){
		$(this).parent().parent().parent().find("div.inform_edit").siblings().css("display","none");
		$(this).parent().parent().parent().find("div.inform_edit").css("display", "block");
		profileName = $(this).parent().attr("class").substring(14);
		PublicCode = $("input:hidden[name=" + profileName + "Public]").val();
		$(this).parent().parent().parent().find("select").val(PublicCode);
	});
	
	$("input:button[value=공개범위]").click(  function(){
		profileName = $(this).parent().attr("class").substring(14);
		publicCode = $("input:hidden[name="+profileName+"Public]").val();
		if( publicCode == 1){
			$(this).parent().find("a.publicbtn.privacy").addClass("checked");
		}else if(publicCode == 3){
			$(this).parent().find("a.publicbtn.friend").addClass("checked");
		}else if(publicCode == 4){
			$(this).parent().find("a.publicbtn.user").addClass("checked");
		}else if(publicCode == 5){
			$(this).parent().find("a.publicbtn.public").addClass("checked");
		}
		
		if ($(this).parent().find("div.has-sub").css("display") == "none") {
			$("div.has-sub").css("display", "none").css("z-index", "");
	    	$(this).parent().find("div.has-sub").css("display", "block").css("z-index", "100")
	    }else{
			$("div.has-sub").css("display", "none").css("z-index", "");
	    }
	});
	
	$(".has-sub li a").hover(function(){
		$(this).addClass("selected");
	},function(){
		$(this).removeClass("selected");
	});
	
	
	
});


	