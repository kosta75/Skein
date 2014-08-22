$(document).ready(function() {
	//상단 메뉴 고정
	var menupos = $("#menu").offset().top;
	
	$(window).scroll(function() {
		if ($(window).scrollTop() >= menupos) {

			$("#menu2").fadeIn('slow');
			$("#menu2").css("position", "fixed");
			$("#menu2").css("top", "0");

		} else {
			$("#menu2").css("display", "none");
			$("#menu2").css("top", "");
		}
	});
	
	//프로필 이미지 수정
	//파일업로드 설정 Start //////////////////////////////////////////////////////////////////////////
	var filelist = document.getElementById("file-list");
	var multiFiles = new Array();
	

	function groupTemplate(groupID, files) {
		console.log("function groupTemplate start");
		var html = [];
		for (var i = 0; i < files.length; i++) {
			var file = files[i];
			multiFiles.push(file);
			var id = "group_" + groupID + "_file_" + file.extra.fileID;
			/* html.push("<li id='" + id + "' data-fileid='" + file.extra.fileID + "' data-groupid='"+ groupID +"'>"
					+ "<span class='filename'>"+ file.name	+ "</span> "
					+ "<div><span class='not-done'><em>Loading...</em></span><span class='on-done'><span class='time-to-load'></span> ms</span></div>"
					+ "<span class='details'><a href='#' class='btn'>details</a></span> "
					+ "<div class='modal hide'>"	+ file.name + "<br />"	+ file.type 	+ "<br /></div>"
					+ "<pre>" + JSON.stringify(file, null,	'\t')+ "</pre>" + "</li>");*/
			html.push("<li><div id='" + id + "' data-fileid='" + file.extra.fileID + "' data-groupid='"	+ groupID + "' class='image-item'><div class='delete-button'></div></div></li>");
		}

		/*var start = "<li><div id='group_" + groupID + "' class='group' style='display:none;'>Group: " + groupID + " (" + files.length + " files)</div>";*/
		var start = "<li>";
		console.log("function groupTemplate end");
		return html.join('</li>');
	}

	var opts = {
		on : {
			load : function(e, file) {
				var fileDiv = $("#group_" + file.extra.groupID	+ "_file_" + file.extra.fileID)
				fileDiv.addClass("done");

				var ms = file.extra.ended - file.extra.started;
				fileDiv.find(".time-to-load").text(ms);
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
				$("#group_" + file.extra.groupID	+ "_file_" + file.extra.fileID)	.addClass("error");
			},
			groupstart : function(group) {
				console.log("function groupstart");
				$(filelist).append(groupTemplate(group.groupID,group.files));

				console.log("function find");
				/* $(filelist).find(	".details a:not(.initialized)")	.click(function() {
					console.log("function find in");
					$(this).closest("li").find(".modal").modal('show');
				}) */
				/* $(filelist).find(".modal:not(.initialized)").addClass("initialized").modal({
					show : false
				}).on("show", function() {
					console.log("여기에 뭘 쓰지?");
				}); */
			},
			groupend : function(group) {
				console.log("groupEnd");
				/*$("#group_" + group.groupID).append(	"<div style='display:none;'>(Time to load: "	+ (group.ended - group.started)	+ "ms)</div>");*/
				console.log(multiFiles);
			}
		}
	};

	$("#file-input, #dropzone").fileReaderJS(opts);
	$("body").fileClipboard(opts);

	$("#hitstoryForm") .submit(	function(event) {
		event.preventDefault();
		console.log("INFO : Skein-T543 - HistoryForm Submit 처리");
		var data = new FormData();
		
		//사용자가 올린 파일을 FormData에 등록한다.
		$.each(multiFiles, 	function(count, file) {
			console.log(count);
			data.append("files[" + count + "]", file);
		});
		
		console.log("INFO : Skein-T543 - Serialize된 Form Data");
		
		//Form Data를 serialize 한다.
		var historyForm = $(this).serializeArray();
		$.each(historyForm, function(i, field) {
			console.log("[name : " + field.name	+ ", value : "	+ field.value + "]");
			data.append(field.name, field.value);
		});
		
		$.ajax({
			url : 'board/historyReg',
			type : "post",
			dataType : "JSON",
			data : data,
			// cache: false,
			processData : false,
			contentType : false,
			success : function(data,
					textStatus, jqXHR) {
				var msg = data.result;

				if (data.result == 'success') {
					location.reload();
				} else if (data.result == 'not file') {
					alert("이미지 업로드 안했음요");
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
	//파일업로드 설정 End //////////////////////////////////////////////////////////////////////////
	
	
	
	
	
	
	
	
	
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
	
	
	
	//alert($(".A").data("phonenumberpublic"));
});
	function edit_ajax(){
		/*여기 ajax */
		
	}
