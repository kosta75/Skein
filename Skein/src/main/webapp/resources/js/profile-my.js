$(document).ready(function() {
	//프로필사진 설정 Start //////////////////////////////////////////////////////////////////////////

	//프로필사진 등록 취소
	$(".profile-image-closeBtn").click(function(){
		$(this).parent().css("display", "none").siblings().css("display", "block");
		multiFiles = null;
		$(".dropzone #file-list").empty();
		$(".dropzone").append(detachObject);
	});

	//프로필사진 등록/수정
	//파일업로드 설정 Start //////////////////////////////////////////////////////////////////////////
	var filelist = document.getElementById("file-list");
	var detachObject;
	var multiFiles;

	function groupTemplate(groupID, files) {
		detachObject = $(".dropzone .help-message").detach();
		var html = [];
		multiFiles = new Array();

		var file = files[0];
		multiFiles.push(file);
		var id = "group_" + groupID + "_file_" + file.extra.fileID;
		html.push("<div id='" + id + "' data-fileid='" + file.extra.fileID + "' data-groupid='"	+ groupID + "' class='profile-image-item'><div class='delete-button'></div></div>");
		console.log("프로필 사진을 하나만 등록 할 수 있다!");
		return html.join('');
	}

	var opts = {
		on : {
			load : function(e, file) {
				var fileDiv = $("#group_" + file.extra.groupID	+ "_file_" + file.extra.fileID)
				fileDiv.addClass("done");

				var ms = file.extra.ended - file.extra.started;
				if (file.type.match(/image/)) {

					var img = new Image();
					img.onload = function() {
						fileDiv.prepend($(img).clone());
					};
					img.src = e.target.result;
				} else {
					
				}
			},
			error : function(e, file) {
				$("#group_" + file.extra.groupID	+ "_file_" + file.extra.fileID)	.addClass("error");
			},
			groupstart : function(group) {
				$(filelist).empty();
				$(filelist).append(groupTemplate(group.groupID,group.files));

			},
			groupend : function(group) {
				
			}
		}
	};

	$(".dropzone").fileReaderJS(opts);
	$(".profile-image-edit-button").on('click', function(){
		$("#profileImageForm").submit();
	});

	$("#profileImageForm").submit(function(event){
		if(multiFiles == null ){
			alert("사진을 등록해주세요.");
			return false;
		}
		var requestMapping = "/profile/profileImageUpdate";
		var requestContextPath = getContextPath() + requestMapping;
		
		event.preventDefault();
		//console.log("INFO : Skein-T543 - HistoryForm Submit 처리");
		var data = new FormData();
		
		//사용자가 올린 파일을 FormData에 등록한다.
		$.each(multiFiles, function(count, file) {
			console.log(count);
			data.append("files[" + count + "]", file);
		});
		
		//console.log("INFO : Skein-T543 - Serialize된 Form Data");
		
		//Form Data를 serialize 한다.
		var historyForm = $(this).serializeArray();
		$.each(historyForm, function(i, field) {
			//console.log("[name : " + field.name	+ ", value : "	+ field.value + "]");
			data.append(field.name, field.value);
		});
		
		$.ajax({
			url : requestContextPath,
			type : 'post',
			dataType : "JSON",
			data : data,
			// cache: false,
			processData : false,
			contentType : false,
			success : function(data, textStatus, jqXHR) {
				var msg = data.result;

				if (data.result == 'success') {
					location.reload();
				} else if (data.result == 'not file') {
					alert("이미지 업로드 실패");
					location.reload();
				}
			},
			error : function(jqXHR,
					textStatus,
					errorThrown) {

			}
		});
		return false;
	});
	//프로필사진 설정 End //////////////////////////////////////////////////////////////////////////
		
	//프로필 설정(프로필사진 제외) Start

	//프로필 등록/수정
	$(".inform_edit").not(".profileImage").on("click",".profile_editBtn",function(){
		var requestMapping = "/profile/profileUpdate";
		var requestContextPath = getContextPath() + requestMapping;
		
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
				url : requestContextPath,
				cache : false,
				data :'profileInfo='+ profileInfo + '&profileCode='+ profileCode + '&publicLevelCode='+ publicLevelCode + '&email='+ email,
				success : function(data) {
					/*alert("정보가 수정되었습니다!");*/
					profileName = $("input:hidden[value=" + profileCode + "]").attr("name");
					$("input:hidden[name=" + profileName + "Public]").val(publicLevelCode);
					$(".informdata."+profileName).html(profileInfo);
					$(".inform_databox."+profileName).parent().css("background", $("#menu2").css("background-color")).css("opacity", "0.5");
					setTimeout(function(){
						$(".inform_databox."+profileName).parent().css("background", "").css("opacity", "");
					}, 300);
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
		var requestMapping = "/profile/profileUpdate";
		var requestContextPath = getContextPath() + requestMapping;
		
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
				url : requestContextPath,
				cache : false,
				data : 'profileCode='+ profileCode + '&publicLevelCode='+ publicCode + '&email='+ email,
				success : function(data) {
					/*alert("정보가 수정되었습니다!");*/
					$("input:hidden[name=" + profileName + "Public]").val(publicCode);
					$("div.has-sub").css("display", "none").css("z-index", "");
					$(".inform_databox."+profileName).parent().css("background", $("#menu2").css("background-color")).css("opacity", "0.5");
					setTimeout(function(){
						$(".inform_databox."+profileName).parent().css("background", "").css("opacity", "");
					}, 300);
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
				$(".inform_databox."+profileName).parent().css("background", $("#menu2").css("background-color")).css("opacity", "0.5");
				setTimeout(function(){
					$(".inform_databox."+profileName).parent().css("background", "").css("opacity", "");
				}, 300);
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
			$(this).find("div.inform_button .openImg").css("display", "");
			$(this).find("div.inform_button").css("display", "block").find("img").css("background", $("#menu2").css("background-color"));
			if($(this).find("div.informdata").html().trim() == ""){
				$(this).find("div.inform_button .editImg").siblings().css("display", "none");
			}else{
			}
		}
	});
	//버튼 숨기기
	$(".inform_elem").mouseleave(function(){
		$(this).find("div.inform_button").css("display","none");
	});
	

	//edit form 열기
	$(".editImg").click( function(){
		$(this).parent().parent().parent().find("div.inform_edit").siblings().css("display","none");
		$(this).parent().parent().parent().find("div.inform_edit").css("display", "block").find("img").css("background", $("#menu2").css("background-color"));;
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
	
	

	
	$(".openImg").click(function(){
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
	
	
	if($(".informdata.profileImage").html().indexOf("profile-img") != -1){
		$(".profileImage font").css("display", "none");
	}
	
	
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

	
