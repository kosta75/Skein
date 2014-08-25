$(document).ready(function() {
	
	// 수정form 저장
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
			publicBtn($(this).parent());
			
		}//else end
		
	});
	
	//공개범위selected 저장
	$(".has-sub .publicbtn").click(function(){
		var email = $("input:hidden[name=email]").val();
		var profileName = $(this).parent().parent().parent().parent().parent().find(".inform_button").attr("class").substring(14);
		var profileCode = $("input:hidden[name=" + profileName + "]").attr("value");
		var publicCode = 0 ;
		var publicName = $(this).attr("class");
		
		if(publicName.indexOf("checked") != -1){
			return;
		}else{
			
			if( publicName.indexOf("privacy") != -1){
				publicCode = 1;
			}else if(publicName.indexOf("friend") != -1){
				publicCode = 3;
			}else if(publicName.indexOf("user") != -1){
				publicCode = 4;
			}else if(publicName.indexOf("public") != -1){
				publicCode = 5;
			}
			$.ajax({
				type : 'post',
				url : 'profile/',
				cache : false,
				data : 'profileCode='+ profileCode + '&publicLevelCode='+ publicCode + '&email='+ email,
				success : function(data) {
					/*alert("정보가 수정되었습니다!");*/
					$("input:hidden[name=" + profileName + "Public]").val(publicCode);
					$("div.has-sub").css("display", "none").css("z-index", "");
				},
				error : function() {
					alert('Error');
					return false;
				}
			});
			
		}
		
	});	
	
	
	
	//마우스오버시 버튼보이기
	$(".inform_elem").mouseenter(function(){
		if($(this).find("div.inform_edit").css("display") == "none"){
			$(this).find("div.inform_button input[value=공개범위]").css("display", "");
			$(this).find("div.inform_button").css("display", "block");
			if($(this).find("div.informdata").html() == ""){
				$(this).find("div.inform_button input[value=수정]").siblings().css("display", "none");
			}else{
			}
		}
	});
	//버튼 숨기기
	$(".inform_elem").mouseleave(function(){
		$(this).find("div.inform_button").css("display","none");
	});
	
	// 수정버튼 클릭 후 수정form 보이기
	$("input:button[value=수정]").click( function(){
		$(this).parent().parent().parent().find("div.inform_edit").siblings().css("display","none");
		$(this).parent().parent().parent().find("div.inform_edit").css("display", "block");
		profileName = $(this).parent().attr("class").substring(14);
		PublicCode = $("input:hidden[name=" + profileName + "Public]").val();
		$(this).parent().parent().parent().find("select").val(PublicCode);
	});
	
	// 공개범위 클릭시 공개범위 선택지 보이기
	$("input:button[value=공개범위]").click(function(){
			publicBtn($(this));
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

function publicBtn(publicbtn){
	publicbtn.parent().find("a.publicbtn").removeClass("checked");
	profileName = publicbtn.parent().attr("class").substring(14);

	publicCode = $("input:hidden[name="+profileName+"Public]").val();
	if( publicCode == 1){
		publicbtn.parent().find("a.publicbtn.privacy").addClass("checked");
	}else if(publicCode == 3){
		publicbtn.parent().find("a.publicbtn.friend").addClass("checked");
	}else if(publicCode == 4){
		publicbtn.parent().find("a.publicbtn.user").addClass("checked");
	}else if(publicCode == 5){
		publicbtn.parent().find("a.publicbtn.public").addClass("checked");
	}
	

}
/*function publicBtn(publicbtn){
	$(this).parent().find("a.publicbtn").removeClass("checked");
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
}*/
	