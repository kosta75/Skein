$(document).ready(function() {

	
	
	
	
	
	
	

	$('#sidemenu1').click(function() {

		$('#sidemenu1').append($('#mon').toggle("display"));

	});

	$('#sidemenu2').click(function() {

		$('#sidemenu2').after($('#mon').toggle("display"));

	});

	$('#sidemenu3').click(function() {

		$('#sidemenu3').after($('#mon').toggle("display"));

	});

	//modal- 기능 구현
	$("#modal-launcher,#modal-close, #modal-background").click(function() {

		var boardSeq = $(this).find("input").val();

		if ($(this).attr("id") == "modal-launcher") {

			$("html").css("overflow-y", "hidden");
			$('body').on('wheel.modal mousewheel.modal', function() {
				return false;
			});

			$.ajax({
				type : 'post',
				url : 'board/detailView',
				cache : false,
				data :

				'boardSeq=' + boardSeq,

				success : function(data) {

					$("#modalfullName").html(data.fullName);
					$("#modalwriteDate").html(data.writeDate);
					$("#modalcontent").html(data.content);

				},
				error : function() {
					alert('Error while request..');
				}
			});

		} else {
			$('body').off('wheel.modal mousewheel.modal');
			$("html").css("overflow-y", "auto");

		}

		$("#modal-content, #modal-background").toggleClass("active");

	});

	if($("#imghover").find("input").val() != null){
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
	
	 });
	}
	//상단 메뉴 고정
	 var menupos = $("#menu").offset().top; 
	   $(window).scroll(function(){ 
	      if($(window).scrollTop() >= menupos) { 
	         
	         $("#menu2").fadeIn('slow');
	         $("#menu2").css("position","fixed"); 
	         $("#menu2").css("top","0"); 
	         } else { 
	         $("#menu2").css("display","none"); 
	         $("#menu2").css("top",""); 
	      } 
	   }); 
	
	//글쓰기 메뉴 
	   $("#writememnu1").click(function(){
		   $("#demo").toggle("display");
		   
		   
	   });
	   
	   
	   
	   
	var filelist = document.getElementById("file-list");
	var multiFiles = new Array();
	 
	function groupTemplate(groupID, files) {
		console.log("function groupTemplate start");
		var html = [];
		for (var i = 0; i < files.length; i++) {
			var file = files[i];
			multiFiles.push(file);
			var id = "group_" + groupID + "_file_"	+ file.extra.fileID;
			/* html.push("<li id='" + id + "' data-fileid='" + file.extra.fileID + "' data-groupid='"+ groupID +"'>"
					+ "<span class='filename'>"+ file.name	+ "</span> "
					+ "<div><span class='not-done'><em>Loading...</em></span><span class='on-done'><span class='time-to-load'></span> ms</span></div>"
					+ "<span class='details'><a href='#' class='btn'>details</a></span> "
					+ "<div class='modal hide'>"	+ file.name + "<br />"	+ file.type 	+ "<br /></div>"
					+ "<pre>" + JSON.stringify(file, null,	'\t')+ "</pre>" + "</li>");*/
				html.push("<div id='" + id + "' data-fileid='" + file.extra.fileID + "' data-groupid='"+ groupID +"'></div></li>");
			} 
			
		var start = "<li><div id='group_" + groupID + "' class='group' style='display:none;'>Group: " + groupID + " ("	+ files.length + " files)</div>";
		console.log("function groupTemplate end");
		return start + html.join('');
	}

	var opts = {
		on : {
			load : function(e, file) {
				var fileDiv = $("#group_" + file.extra.groupID + "_file_" + file.extra.fileID)
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
				$("#group_" + file.extra.groupID 	+ "_file_" 	+ file.extra.fileID).addClass("error");
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
				$("#group_" + group.groupID).append(	"<div style='display:none;'>(Time to load: " + (group.ended - group.started)	+ "ms)</div>");
				console.log(multiFiles);
			}
		}
	};

	$("#file-input, #dropzone").fileReaderJS(opts);
	$("body").fileClipboard(opts);
	
	$("#hitstoryForm").submit(function( event ) {
		event.preventDefault();
		console.log("INFO : Skein-T543 - HistoryForm Submit 처리");
		var data = new FormData();
		
		//사용자가 올린 파일을 FormData에 등록한다.
        $.each(multiFiles, function(count, file) {
        	console.log(count);
            data.append("files["+count+"]", file);
        });

		console.log("INFO : Skein-T543 - Serialize된 Form Data");
		//Form Data를 serialize 한다.
        var historyForm = $(this).serializeArray();
        $.each(historyForm, function(i, field){
        	console.log("[name : " + field.name + ", value : " + field.value + "]");
        	data.append(field.name, field.value);
        });
		
		$.ajax({
			url: 'board/historyReg',
            type: "post",
            dataType: "JSON",
            data: data,
            // cache: false,
            processData: false,
            contentType: false,
            success: function(data, textStatus, jqXHR) {
                var msg = data.result;
            	
                if(data.result == 'success'){
                	location.reload();
                }else if(data.result == 'not file'){
                	alert("이미지 업로드 안했음요");
                	location.reload();
                }
            },
            error: function(jqXHR, textStatus, errorThrown){
            	
            }    
		});
		return false;
	});

});
