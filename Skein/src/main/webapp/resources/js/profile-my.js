$(document).ready(function() {
	// 수정form 저장
	$(".inform_edit").not(".profileImage").on("click",".profile_editBtn",function(){
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
				url : 'profile/update',
				cache : false,
				data :'profileInfo='+ profileInfo + '&profileCode='+ profileCode + '&publicLevelCode='+ publicLevelCode + '&email='+ email,
				success : function(data) {
					/*alert("정보가 수정되었습니다!");*/
					profileName = $("input:hidden[value=" + profileCode + "]").attr("name");
					$("input:hidden[name=" + profileName + "Public]").val(publicLevelCode);
					$(".informdata."+profileName).html(profileInfo);
				},
				error : function() {
					alert('Error');
					return false;
				}
			});
			
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
				url : 'profile/update',
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
	
	//프로필 삭제 
	$(".profile_deleteBtn").click(function(){
		var profileName = $(this).attr("class").substring(18);
		var profileCode = $("input:hidden[name=" + profileName + "]").attr("value");
		var email = $("input:hidden[name=email]").val();
		var deletebtn = $(this);

		$.ajax({
			type : 'post',
			url : 'profile/delete',
			cache : false,
			data : 'profileCode='+ profileCode + '&email='+ email,
			success : function(data) {
				/*alert("정보가 수정되었습니다!");*/
				$("input:hidden[name=" + profileName + "Public]").val('');
				$(".informdata."+profileName).html('');
				deletebtn.parent().css("display", "none").siblings().css("display", "block");
				deletebtn.parent().find("input[name=profileInfo]").val('');
			},
			error : function() {
				alert('Error');
				return false;
			}
		});
		
	});
	
	
	//수정 form 닫기
	$(".profilecloseBtn").click(function(){
		$(this).parent().css("display", "none").siblings().css("display", "block");
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
		if(PublicCode == ''){
			PublicCode = 5;
			$(this).parent().parent().parent().find(".profile_deleteBtn").css("display", "none");
		}else{
			$(this).parent().parent().parent().find(".profile_deleteBtn").css("display", "");
		}
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
	
	//공개범위 선택지 마우스오버 색변화
	$(".has-sub li a").hover(function(){
		$(this).addClass("selected");
	},function(){
		$(this).removeClass("selected");
	});
	
	
	
	
	
	
	//프로필사진 설정 Start //////////////////////////////////////////////////////////////////////////

	$(".dropzone.profileImage").fileReaderJS(opts);
	$("body").fileClipboard(opts);
	var opts = {
		on : {
			load : function(e, file) {
				var fileDiv = $("#profileImageUp")

				if (file.type.match(/image/)) {
					// Create a thumbnail and add it to the output if it is an image
					console.log("이미지 업로드 했음");
					var img = new Image();
					img.onload = function() {
						//fileDiv.find(".modal").append(img);
						fileDiv.prepend($(img).clone());
					};
					img.src = e.target.result;
				} else {
					//fileDiv.find(".modal").append($("<div />").text(e.target.result));
				}
			},
			error : function(e, file) {
				alert("파일올려줘");
			}
		}
	};
	$(".profile_editBtn.profileImage") .click(	function(event) {
		event.preventDefault();
		var file =  document.getElementById("profileImageUp");
		var email = $("input:hidden[name=email]").val();
		var publicLevelCode = $(this).parent().find("select").val();
		var data = "profileInfo=" + file + "&email=" + email + "&profileCode=2" + '&publicLevelCode='+ publicLevelCode;
	
		$.ajax({
			url : 'profile/',
			type : "post",
			data : data,
			/*// cache: false,
			processData : false,
			contentType : false,*/
			success : function(data) {
				alert("정보가 수정되었습니다!");
				var profileName = $("input:hidden[value=2]").attr("name");
				var contextPath = $("input:hidden[name=contextPath]").val();
				$("input:hidden[name=" + profileName + "Public]").val(publicLevelCode);
				$(".informdata."+profileName).html('<img src="' + contextPath + '/resources/user-profile-image/' + file + '">');
			},
			error : function() {
				alert("ERROR");
			}
		});
		return false;
	});
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////프로필사진 업데이트 ㅡㅡ하 
	
	
	
});



//해당 프로필의 공개범위에 따라 체크표시
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

	