$(document).ready(function() {
	lheight = $(".content_inner:FIRST-CHILD").css("height");
	rheight = $(".content_inner:LAST-CHILD").css("height");

	if(rheight >lheight){
		$(".content_inner:FIRST-CHILD").css("height", rheight);
		$(".informbox_content").css("height", rheight);
	}else{
		$(".content_inner:LAST-CHILD").css("height", lheight);
		$(".informbox_content").css("height", lheight);
	}

	$(".inform_edit").on("click",".profile_editBtn",function(){
		/*
		data = "profileName="+$(".inform_edit."+$(this).attr("class").substring(14) +" input[type=hidden]").val() +
		"&profileInfo="+$(".inform_edit."+$(this).attr("class").substring(14) +" input[name=edit]").val();
		*/
		
		$(this).parent().css("display", "none").siblings().css("display", "block");
		
		
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
	});
	
	$("input:button[value=공개범위]").click( function(){
		$(this).parent().find("div.has-sub").css("display", "block").css("z-index", "100");
	});
	
	
	
	alert($(".A").data("phonenumberpublic"));
});
	function edit_ajax(){
		/*여기 ajax */
		
	}
