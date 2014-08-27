$(document).ready(function(){

	//게시물 타임라인 설정 Start //////////////////////////////////////////////////////////////////////////
	Highcharts.setOptions({
		lang: {
			months: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			shortMonths : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			weekdays: ['일', '월', '화', '수', '목', '금', '토'],
			rangeSelectorFrom : '시작',
			rangeSelectorTo : '종료'
		}
	});
	
	$.getJSON("board/getBoardGroup" , function(data){
				
		
		var obj = data.listSource;
		var source = new Array();
		var flagSource = new Array();
		
		$.each(obj, function(key, value){
			var board = value;
			source.push([
					 value.groupStartDate, value.groupCount
			]
			)		
			flagSource.push(
				{
					x:value.groupStartDate,
					title:"P",
					text:value.content
				}
			);
		});
		
		
		
		$('#boardListTimelineContainer').highcharts('StockChart', {

            rangeSelector: {
                inputEnabled: $('#container').width() > 480,
                selected: 1
            },

            title: {
                text: '전체 게시물'
            },

            series: [{
                //type:'column',
                name: '게시물 수',
                data: source,
                tooltip: {
                    valueDecimals: 0
                },
                id : 'dataseries'
                }, {
				type : 'flags',
				data : flagSource,
				onSeries : 'dataseries',
				shape : 'squarepin',
				width : 16,
				events: {
	                click: function(event) {
	                	console.log(event);
	                	console.log(event.point.text);
	                }
	            }
            }]
        });
	});
	//게시물 타임라인 설정 End //////////////////////////////////////////////////////////////////////////
	
	
	//글쓰기 탭
	$( "#writeTabs" ).tabs({
		collapsible: true
	});
	
	
	//이미지 삭제 버튼
	$(document).on('mouseover','.image-item',function(){
		//console.log($(this).find('div.delete-button'));
		//$(this).find('.delete-button').css('display', 'block');
		$(this).find('.delete-button').show();
	}).on('mouseleave', '.image-item', function(){
		//$(this).find('.delete-button').remove();
		$(this).find('.delete-button').hide();
	});
	
	$(document).on('click', '.delete-button', function(){
		var li = $(this).parents('li');
		var index = $(this).parents('#file-list').find('li').index(li);
		
		var startIndex = index;
		var endIndex = index;
		if(index == 0){
			endIndex = 1;
		}
		multiFiles.splice(startIndex, endIndex);
		li.remove();
	});
	
	
	
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
	
	
	$(document).on('mouseout', ".imgBtn", function(){
		$(this).css("opacity", "0.4");
		$(this).css("cursor", "pointer");
	});

	$(document).on('mouseover', ".imgBtn", function() {
		$(this).css("opacity", "1");
		$(this).css("cursor", "pointer");
	});


	/*$(document).on(	'click', '.members', function() {
		var result = confirm($(this).data("name") + "(" + $(this).data("uri") + ") 님께 친구를 신청하시겠습니까?");
		if (result) {
			$.ajax({
				type : 'POST',
				url : 'friendship/add/' + $(	this).data("uri"),
				success : function(data) {
					alert(data.result);
				},
				error : function() {
					alert('Error while request..');
				}
			});
		} else {
			console.log("친구 추가취소");
		}
	});

	$('#search .textbox').on('keyup', function() {
		if ($("#search .textbox").val().length > 0) {
			$.ajax({
				type : 'POST',
				url : 'search/members',
				data : "fullName=" + $("#search .textbox").val(),
				success : function(data) {
					console.log(data);
					console.log(data.list);
					var obj = data.list;
					var msg = "";
					
					for (var i = 0; i < obj.length; i++) {
						msg += "<div class='members' data-name='"	+ obj[i].fullName + "' data-uri='"	+ obj[i].personalURI + "'>" + obj[i].fullName + "/" + obj[i].personalURI + "</div>";
					}
					
					$("#searchMembers").html(msg);
				},
				error : function() {
					alert('Error while request..');
				}
			});
		}
	});*/

	$(document).on('click',".imgBtn", function(){
		var imgBtn = "#imgBtn" + $(this).find("input").val();
		var detailImg = "#detailImg"	+ $(this).find("input").val();
		var j = $(this).find("input").val();
		for (var i = 0; i < 9; i++) {
			if (i == j) {
				$("#detailImg" + i).css("display", "block");
			} else {
				$("#detailImg" + i).css("display", "none");
			}
		}
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
	
	
	var boardSeq = 0;
	
	// modal- 기능 구현
	$(document).on("click","#modal-launcher,#modal-close, #modal-background",function(){
		var groupSeq = $(this).find("input").val();
		boardSeq = $(this).data("boardseq");
	
		$(".modalShare").find("input").val(groupSeq);
		if ($(this).attr("id") == "modal-launcher") {
			$("html").css("overflow-y", "hidden");
			$('.content-wrapper').on('wheel.modal mousewheel.modal', 	function() {
				return false;
			});

			$.ajax({
				type : 'post',
				url : 'board/detailView',
				cache : false,
				data : 'groupSeq=' + groupSeq,
				success : function(data) {
					$(".modal-content-view").css("display","block");
					$(".modalcontent").append("<div style='width:100%;height:50px;' class='modalViewcontent'>"+ data.detailView[0].fullname + "<br>"
							+ data.detailView[0].writeDate + "</div>    <div style='clear:both;width:380px; margin-top:15px;margin-bottom:15px;'  class='modalViewcontent'>" + data.detailView[0].content + "</div>");

					detail = data.detailView.length;
					$("#imglength").val(data.detailView.length);
					
					for (var i = 0; i < data.detailView.length; i++) {
						$("#imgBtnList").append("<div class='imgBtn' data-boardSeq='"+data.detailView[i].boardSeq+"'>" + "<input type='hidden' value='" + i + "'>"
								+ "<img class='imgbtn' data-imgBtnNumber = '"	+ i 	+ "'  src='./resources/upload/" + data.detailView[i].filename
								+ "' style='width: 40px; height: 40px; padding-left:15px;padding-top:10px;opacity:0.4;'></div>" + "</div>");
						$("#detailImg"+ i).attr("src",'./resources/upload/'+ data.detailView[i].filename);
					
					}
					
					$.ajax({
						type : 'post',
						url : 'reply/select',
						cache : false,
						data : 'boardSeq=' + boardSeq,
						success : function(data) {
							
							for(var j =0;j<data.replylist.length;j++){
								/*alert(data.replylist[j].replyContent);	
								*/
								
			$(".replyList").append("<div class='replymodalList modal-bubble'>"+data.replylist[j].replyContent+"</div>");
							}
						
						
						},
						error : function() {
							alert('indexlogged 354 : Error while request..');
						}
						
						
					});
				},
				error : function() {
					alert('indexlogged 354 : Error while request..');
				}
			});
		} else {
			
			$('.content-wrapper').off('wheel.modal mousewheel.modal');
			$("html").css("overflow-y", "auto");
			$("#modal-detile-view").remove();
			$(".imgBtn").remove();
			$(".modalViewcontent").remove();
			$(".replyList").empty();
			
		}

		$("#modal-content, #modal-background").toggleClass("active");	
		
		
		
	});

		


	/*$("#writeTextarea").focus();*/
	//개인기록 메뉴 
	$("#historyWriteMenu1").click(function() {
		if($("#historyImg").css("display") == "block"){
			$("#historyImg").css("display","none");
		}else{
	$("#historyImg").css("display","block");
	$("#historyDate").css("display","none");
	$("#historyemoticon").css("display","none");
	$("#historymap").css("display","none");
		}
		});

	$("#historyWriteMenu2").click(function() {
		
		if($("#historyDate").css("display") == "block"){
			$("#historyDate").css("display","none");
		}else{
		$("#historyImg").css("display","none");
		$("#historyDate").css("display","block");
		$("#historymap").css("display","none");
		$("#historyemoticon").css("display","none");
		
		}
		});

	$("#historyWriteMenu3").click(function() {
		
		if($("#historymap").css("display") == "block"){
			$("#historymap").css("display","none");
		}else{
		$("#historyImg").css("display","none");
		$("#historyDate").css("display","none");
		$("#historymap").css("display","block");
		$("#historyemoticon").css("display","none");
		
		}
		});

	
	
	$("#historyWriteMenu4").click(function() {
		if($("#historyemoticon").css("display") == "block"){
			$("#historyemoticon").css("display","none");
		}else{
		$("#historyImg").css("display","none");
		$("#historyDate").css("display","none")
		$("#historyemoticon").css("display","block");
		$("#historymap").css("display","none");
		}
		
	});
	
	//다이어리 메뉴
	
	
	$("#diaryWriteMenu1").click(function() {
		if($("#diaryImg").css("display") == "block"){
			$("#diaryImg").css("display","none");
		}else{
	$("#diaryImg").css("display","block");
	$("#diaryemoticon").css("display","none");
	$("#diarymap").css("display","none");
		}
		});

	$("#diaryWriteMenu3").click(function() {
		
		if($("#diarymap").css("display") == "block"){
			$("#diarymap").css("display","none");
		}else{
		$("#diaryImg").css("display","none");
		$("#diarymap").css("display","block");
		$("#diaryemoticon").css("display","none");
		
		}
		});

	$("#diaryWriteMenu4").click(function() {
		
		if($("#diaryemoticon").css("display") == "block"){
			$("#diaryemoticon").css("display","none");
		}else{
		$("#diaryImg").css("display","none");
		$("#diarymap").css("display","none");
		$("#diaryemoticon").css("display","block");
		
		}
		});

	
	

	
	

	//이모티콘 추가
	$(".emoticon").click(function(){
		$("#writeTextarea").append($(this).clone());	
		$("#writeTextarea").focus();
	
	});
	
	
	//모달 댓글 리스트 출력
	$(document).on('click',".imgBtn", function(){
		$(".replyList").empty();
		var imgBtn = "#imgBtn" + $(this).find("input").val();
		var detailImg = "#detailImg"	+ $(this).find("input").val();
		boardSeq = $(this).data("boardseq");
		
		var j = $(this).find("input").val();
		for (var i = 0; i < 9; i++) {
			if (i == j) {
				$("#detailImg" + i).css("display", "block");
			} else {
				$("#detailImg" + i).css("display", "none");
			}
		}
		
		$.ajax({
			type : 'post',
			url : 'reply/select',
			cache : false,
			data : 'boardSeq=' + boardSeq,
			success : function(data) {
				
				for(var j =0;j<data.replylist.length;j++){
					
					
					
					$(".replyList").append("<div class='replymodalList modal-bubble' >"+data.replylist[j].replyContent+"</div>");
									
				}
			
			
			},
			error : function() {
				alert('indexlogged 354 : Error while request..');
			}
			
			
		});
		
	
		
		
		
		
		
		
	});
		
	
	//모달 댓글
	$(document).on('keydown',".modalreplyWrite",function(e){
		if (e.keyCode === 13) {
		
			
		 var replyContent =  $(this).val();
		
				
		$.ajax({
			type : 'post',
			url : 'reply/insert',
			cache : false,
			data : 'boardSeq=' + boardSeq +"&replyContent="+replyContent,
			success : function(data) {
				$(".replyList").append("<div class='replymodalList modal-bubble'>"+replyContent+"</div>");
				
				
				},
			error : function() {
				alert('indexlogged 354 : Error while request..');
			}
		});
	}

});
	
	
	
  //댓글
	$(document).on('keydown',".replyWrite",function(e){
		if (e.keyCode === 13) {
			
		 var boardSeq = $(this).parent().find("input[type=hidden]").val();
		 var replyContent = $(this).val();
		
		 //var reply = $(".group-item-reply-secition ul");
		 var reply = $(this).parent().siblings().eq(1).find("ul");
		 console.log(reply);
			
		$.ajax({
			type : 'post',
			url : 'reply/insert',
			cache : false,
			data : 'boardSeq=' + boardSeq +"&replyContent="+replyContent ,
			success : function(data) {
				reply.append("<li><div class='group-item-reply-container'>" +
						
						"<div class='group-item-reply-content-container bubble'>"+replyContent+"</div></div></li>");	
				
			},
			error : function() {
				alert('indexlogged 354 : Error while request..');
			}
		});
	
	
	
	
	}
	
	
});
//엔터키 처리
$("#writeTextarea").on('keydown', function(e) {
	
	// trap the return key being pressed
	if (e.keyCode === 13) {
		// insert 2 br tags (if only one br tag is inserted the cursor won't go to the next line)
		document.execCommand('insertHTML', false, '<br><br>');
		// prevent the default behaviour of return key pressed
		return false;
	}
}).on('keyup', function(){
	if($("#writeTextarea").text().length > 0){
		$("#dropzone .placeholder").css('display', 'none');
	}else{
		$("#dropzone .placeholder").css('display', 'block');
	}
});
//지역 정보 수정 시 

$("#historyplace").click(function(){
	$("#historyplace").val('');
	
});

//메인 더보기 
function lastPostFunc(pictureCount){ 
 
    $.ajax({
          type:'get',
       url:"mainMoreBoard",
       data:"pictureCount="+ pictureCount,
       dataType : "html",
       success : function(data) {
    	
        if(data.trim()==""){
        }else{
           $('#boardListContainer').append(data);  
        }  
       },
       error: function(){
          alert('스크롤 에러 인덱스-로그드 :error while request..'   );
       }
    });
 }; 
 
 $(window).scroll(function(){ 
    if ($(window).scrollTop() == $(document).height() - $(window).height()){ 
      var pictureCount = $('.group-item-container').size();
     
       lastPostFunc(pictureCount); 
    }      
 });
 
 
 
//submit
	$("#hitstoryWriteBtn").click(function(){
		$("#content").val($("#writeTextarea").html());
		$("#hitstoryForm").submit();
	});
	
	//*************************************************************************************************
	//*************************************************************************************************
	//공유하기 버튼 클릭시 공유목록 출력!
	var ShowOrHide=true ;
	
	
	
	$(document).on('click', '.share-btn', function(){
		//alert($(this).find("input[type='hidden']").val());
		var parent = $(this).parent();
		parent.find(".share-img-list").empty();
		var groupSeq = $(this).parent().find("input").val();
	
		parent.find('.share-info-div').toggle(ShowOrHide);
		if(ShowOrHide === true){
			$.ajax({
				type : 'post',
				url : 'board/shareView',
				cache : false,
				data : 'groupSeq=' + groupSeq,
				success : function(data) {
					//alert(data);
					var boardsharedetail = data.boardshare.length;
					//$("#imglength").val(data.detailView.length);
					//alert("a"+boardsharedetail);
					if(boardsharedetail==0){
						//alert('이미지 없음');
						parent.find(".share-img-list").append("<div style='background-color : white;border-radius:10px 10px 10px 10px;'>"
															+ "<div style='float:left;'>" 
															+ "<input type='radio' value=1 checked='checked'></div>"
															+ "<div class='share_imgbtn'style='float:left;width:135px;'>"
															+ "<input type='hidden' value='1'><p style='margin-left: -27px;'>현재 글 공유</p></div></div>");
					}else{	
						for (var j=0; j<boardsharedetail; j++) {
							//alert("b"+data.boardshare.length);
							console.log($(this).parent());
							parent.find(".share-img-list").append("<div style='background-color : white;border-radius:10px 10px 10px 10px;'>" 
																	+ "<div style='float:left;margin-top:10px'>" 
																		+ "<input type='checkbox' name='shareCheckBoxGroup' value="+j+"></div>" 
																	+ "<div class='share_imgbtn'style='float:left;width:135px;'>"
																		+ "<input type='hidden' value='"+j+"'>"
																	+ "<img class='imgbtn2' data-imgBtnNumber = '"+ j + "'  src='./resources/upload/" + data.boardshare[j].filename
																	+ "'style='clear:both; width: 40px; height: 40px; opacity:0.9;margin-left: -100px;'></div></div>");
						}
					}
					
				},
				error : function() {
					alert('indexlogged : Error while request..');
				}
			});
			
			
			parent.find('.share-info-div').slideDown();
			ShowOrHide= false;
		}else if(ShowOrHide === false ){
			parent.find('.share-info-div').slideUp();
			
			ShowOrHide= true;
		}
	
	});
	
	$(document).on('click', '.modalShare', function(){
		alert($(this).find("input[type='hidden']").val());
		
	});

	
	//*************************************************************************************************
		//공유하기 상세 마우스 올렸을때!
	
	$(document).on('mouseover','.share_imgbtn',function(){
		//alert('상세보기 들어옴');
		//alert($(this).attr("src"));
		
		//alert($('#share-detail-preview-imgtag').attr("src",$(this).attr("src")));
		$('#share-detail-preview').css("display","block");
		$('#share-detail-preview-imgtag').attr("src",$(this).attr("src"));
/*		
		$('#share-detail-preview-imgtag').attr("src",$(this).css("src"));
		alert('상세보기 들어옴3');
		$('#share-detail-preview').css("display","block");
		alert('상세보기 들어옴4');
*/
	});
	$(document).on('mouseout','.share_imgbtn',function(){
		//alert('상세보기 나감');
		$('#share-detail-preview').css("display","none");
	
	});
	//*************************************************************************************************
	//*************************************************************************************************

	$(document).on('click','.detailImg',function(){
		/*alert($(this).find("img").attr("src"));
	*/	$("#modal-content-view").css("display","none");
		$('#modal-content').append("<div id='modal-detile-view'style='width: 960px; height: 540px; display: block;z-index:1000;position:absolute;'>	<img style='z-index:10' src='"+$(this).find("img").attr("src")+"'></div>");
	});
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////
	//사용자가 선택한 공유 목록 가져오기 (수정중........................)
	$("#share-detail-form").submit(function(event) {
		alert('사용자 공유하기 확인 버튼 클릭!!');
		$.ajax({
			
		});
		
		/*
		event.preventDefault();
		console.log("INFO : Skein-T543 - ShareForm Submit 처리");
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
		*/
	});
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////////	
	
});



