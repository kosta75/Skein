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
					text:value.content,
					groupSeq:value.groupSeq
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
	                	//console.log(event);
	                	//console.log(event.point.text);
	                	var groupSeq = event.point.groupSeq;
	                	var target_id = 'groupItem[' + groupSeq + ']';
	                	//$('body, html').css('scrollTop', $(target_id).offset().top);
	                	var obj = $(target_id);
	                	var posY = 0;

	                	try{
	                		posY = document.getElementById(""+target_id).offsetTop;
	                	}catch(e){
	                		console.log(jQuery(window).height());
	                		posY = jQuery(window).height();
	                	}
	                		                	
	                	window.scrollTo(0, posY);
	                }
	            }
            }]
        });
	});
	//게시물 타임라인 설정 End //////////////////////////////////////////////////////////////////////////
	
	//위치 구하는 함수
	function findPos(obj){
	    var curLeft = curTop = 0;

	    if (obj.offsetParent) {
	        do {
	            curLeft += obj.offsetLeft;
	            curTop += obj.offsetTop;
	        } while (obj = obj.offsetParent);
	    }
	    return {'left': curLeft, 'top': curTop};
	}
	
	
	//글쓰기 탭
	$( "#writeTabs" ).tabs({
		collapsible: true
	});
	
	
	//이미지 삭제 버튼
	$(document).on('mouseover','.image-item',function(){
		$(this).find('.delete-button').show();
	}).on('mouseleave', '.image-item', function(){
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
		var html = [];
		for (var i = 0; i < files.length; i++) {
			var file = files[i];
			multiFiles.push(file);
			var id = "group_" + groupID + "_file_" + file.extra.fileID;
			html.push("<li><div id='" + id + "' data-fileid='" + file.extra.fileID + "' data-groupid='"	+ groupID + "' class='image-item'><div class='delete-button'></div></div></li>");
		}
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
				$(filelist).append(groupTemplate(group.groupID,group.files));
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
				/*$("#group_" + group.groupID).append(	"<div style='display:none;'>(Time to load: "	+ (group.ended - group.started)	+ "ms)</div>");*/
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
		$.each(multiFiles, function(count, file) {
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
			success : function(data, textStatus, jqXHR) {
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
		$("#modalemoticon").css("display","none");
		var imgBtn = "#imgBtn" + $(this).find("input").val();
		var detailImg = "#detailImg"	+ $(this).find("input").val();
		var j = $(this).find("input").val();
		 $(".modal-edit-Div").css("display","none");
		    $(".modalcontent").css("display","block");
		  $("#modal-EditTextarea").empty();
			 $("#modaleditcontent").val('');
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
	
	    $(".modal-edit-Div").css("display","none");
	    $(".modalcontent").css("display","block");
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
					$(".modalcontent").append("<div style='width:100%;height:50px;' class='modalViewinfo'>"
							+"<div class='modal-user-profile-image' style='float: left;'><img src='${pageContext.request.contextPath}/resources/user-profile-image/${sessionScope.BASE_MEMBER_INFO.profileImageFileName}' /></div>"
							+ data.detailView[0].fullname + "<br>"
							+ data.detailView[0].writeDate + "</div>    <div style='clear:both;width:380px; margin-top:15px;margin-bottom:15px;'  class='modalViewcontent'><div class='detailContent'>" + data.detailView[0].content + "</div></div>");

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
			$(".modalViewinfo").remove();
			$(".modalViewcontent").remove();
			$(".replyList").empty();
			 $("#modal-EditTextarea").empty();
			 $("#modaleditcontent").val('');
			 $("#modalemoticon").css("display","none");
			 $(".modalcontent").empty();
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
		
		
		
		alert();
		$("#writeTextarea").append("<img class='emoticonImg' src="+$(this).attr("src")+">");	
		$("#writeTextarea").focus();
	
	});
	//수정이모티콘 추가
	
	$(document).on("click",".edit-emoticon-icon",function(){
		
		
		$(this).parent().siblings().first().append("<img class='emoticonImg' src="+$(this).attr("src")+">");
		
	});
	//모달 수정 이모티콘 추가
	$(document).on("click",".modal-edit-emoticon",function(){
		
		$(this).parent().siblings().first().children().first().append("<img class='emoticonImg' src="+$(this).attr("src")+">");
		
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
			url : 'board/DetailViewBoardSeq',
			cache : false,
			data : 'boardSeq=' + boardSeq,
			success : function(data) {
				$(".modalcontent").empty();
				$(".modal-content-view").css("display","block");
				$(".modalcontent").append(
				"<div style='float: right'>" +
				"<div class='modal-Edit'style='float: left;margin-right: 10px'>수정</div>"	
				+"<div class='modal-Delete'style='float: left;margin-right: 10px'>삭제</div>"		
				+"</div>"
				+"<div class='modal-user-profile-image' style='float: left;'>"
				+"<img src='./resources/user-profile-image/${sessionScope.BASE_MEMBER_INFO.profileImageFileName}' />"
				+"</div>"
				+"<div style='width:100%;height:50px;' class='modalViewinfo'>"+ data.detailView.fullname + "<br>"
						+ data.detailView.writeDate + "</div>    <div style='clear:both;width:380px; margin-top:15px;margin-bottom:15px;'  class='modalViewcontent'><div class='detailContent'>"  + data.detailView.content + "</div></div>");
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
		 var reply = $(this).parent().siblings().next().next().next().find("ul");
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
 
 //삭제
 $(document).on('click',".group-item-delete",function(){
	var groupSeq = $(this).data("groupseq"); 	 
	var groupCount = $(this).data("groupcount");
	var result = confirm(groupCount+"개의 사진이 존재합니다 모두 삭제 하시겠습니까?");
	var remove =  $(this).parent().parent().parent().parent().parent();
	 if(result) 
	 {
		 $.ajax({
				type : 'post',
				url : 'board/deleteGroup',
				cache : false,
				data : 'groupSeq=' + groupSeq,
				success : function(data) {
				if(data.result >= 1){
					alert("삭제 성공했습니다");
					remove.remove();
				}else{
					
					alert("삭제 실패했습니다");
				}
				
				},
				error : function() {
					alert('groupDelete 354 : Error while request..');
				}

			});		
	 } 
	 else 
	 {
	 alert("취소");
	 }
		

 });
// modal 게시물 삭제
 $(document).on('click',".modal-Delete",function(){
	 
	 $.ajax({
			type : 'post',
			url : 'board/deleteBoard',
			cache : false,
			data : 'boardSeq=' + boardSeq,
			success : function(data) {
			if(data.result >= 1){
				alert("삭제 성공했습니다");
				window.location.reload();
			}else{
				
				alert("삭제 실패했습니다");
			}
			
			},
			error : function() {
				alert('groupDelete 354 : Error while request..');
			}

		});	
	 
	 
 });

 
 //수정
 var editcontent
 $(document).on('click','.group-item-edit',function(){
	 var boardSeq = $(this).data("boardSeq"); 	 
		
	 editcontent = $(this).parent().parent().parent().parent();
	
	 editcontent.css("display","none");
	 editcontent.siblings().first().css("display","block");
 });
 $(document).on('click','.edit-cancle',function(){
	
	 editcontent.css("display","block");
	 editcontent.siblings().first().css("display","none");

	 
 });
 $(document).on('click','.edit-emoticon',function(){
	
	 if( $(this).parent().siblings().first().next().next().css('display') == "none"){
		 
		 $(this).parent().siblings().first().next().next().css('display',"block"); 
		 
	 }else{
		 
		 $(this).parent().siblings().first().next().next().css('display',"none"); 
	 }
	 
	 
 });
 
 
 $(".edit-Btn").click(function(){

	 
 $(this).parent().siblings().first().next().val($(this).parent().siblings().first().html());
 var editContent =  $(this).parent().siblings().first().next().val();
 var boardSeq = $(this).parent().siblings().first().next().data("boardseq");

 boardSeq
 $.ajax({
	type : 'post',
	url : 'board/editBoard',
	cache : false,
	data : 'boardSeq='+boardSeq +'&editContent=' + editContent,
	success : function(data) {
	
		if(data.result >= 1){
			
			alert("수정완료");
			location.reload();
		}
		
		
	},
	error : function() {
		alert('indexlogged : Error while request..');
	}
});
	
	
	 
	});
 
 
 
 
 
 //modal 수정
 $(document).on("click",".modal-Edit",function(){
	 $(".modal-EditTextarea").empty();
	 $(this).parent().parent().css("display","none");
	 
	 $(this).parent().parent().siblings().first().css("display","block"); 
	 $(this).parent().parent().siblings().first().children().first().html( $(".modalViewcontent").html());
/*	$(this).parent().parent().siblings().first().children().append($(this).parent().parent().children().last().text());
*/	 
	 
	 
 });
 //modal 수정취소
 $(document).on("click",".modaleditCancleBtn",function(){
	 $(".modal-EditTextarea").empty();
	 $(this).parent().css("display","none");
	 $(this).parent().siblings().first().css("display","block"); 
 });
//modal 이모티콘
 $(document).on("click",".modaleditEmoticon",function(){
	
	 $("#modalemoticon").toggle("display");
	 
	 
	 
 });
 
//modal 수정
 $(document).on("click",".modaleditBtn",function(){
	 

	 $(this).siblings().first().next().val( $(this).siblings().first().html());
	 var editContent =$(this).siblings().first().next().val();
 
 $.ajax({
	type : 'post',
	url : 'board/editBoard',
	cache : false,
	data : 'boardSeq='+boardSeq +'&editContent=' + editContent,
	success : function(data) {
	
		if(data.result >= 1){
			
			alert("수정완료");
			location.reload();
		}
		
		
	},
	error : function() {
		alert('indexlogged : Error while request..');
	}
});
	
	
	 
	});
 
 
//submit
	$("#hitstoryWriteBtn").click(function(){
		$("#content").val($("#writeTextarea").html());
		$("#hitstoryForm").submit();
	});
	
	$("#diaryWriteBtn").click(function(){
		$("#content").val($("#writeTextarea").html());
		/*$("#diaryForm").submit();*/
		alert($("#content").val());
	});
	
	
	//*************************************************************************************************
	//*************************************************************************************************
		//공유하기 버튼 클릭시 공유목록 출력!
		$(document).on('click', '.icon-box', function(){

			var parents = $(this).parents('.group-item-wrapper');

			parents.find(".share-img-list ").empty();
			var groupSeq = parents.find(".share-info-div .share-input").val();
			//alert(groupSeq);

			$('.share-info-div').hide(function(){
				//해체 목록
				$(document).find('input[type=checkbox]').attr("checked",false);
			});
			
			
			parents.find('.share-info-div').show("slide", {direction : "left"}, function(){
				$.ajax({
					type : 'post',
					url : 'board/shareView',
					cache : false,
					data : 'groupSeq=' + groupSeq,
					success : function(data) {
						//alert(data);
						
						var boardsharedetail = data.boardshare.length;
						//alert(boardsharedetail);
						//console.log(data);
						//console.log(data.boardshare);
						//console.log(parents.find(".share-img-list"));
						//alert(boardsharedetail);
						if(boardsharedetail == 0 || boardsharedetail == 1){
							parents.find(".share-img-list").append("<div class='share-data-boardSeq' data-boardSeq='"+data.boardshare[0].boardSeq +"' style='background-color : white;border-radius:10px 10px 10px 10px;'>"
																+ "<div style='float:left;'>" 
																+ "<input type='checkbox' checked disabled name='shareCheckBoxGroup' value="+data.boardshare[0].boardSeq+" data-boardSeq="+data.boardshare[0].boardSeq+"></div>" 
																+ "<div class=''style='float:left;width:211px;'>"
																+ "<input type='hidden' value='1'><p style='margin-left: -100px;'>현재 글 공유</p></div></div>");
						}else{	
							for (var j=0; j<boardsharedetail; j++) {
								parents.find(".share-img-list").append("<div class='share-data-boardSeq' data-boardSeq='"+data.boardshare[j].boardSeq +"'style='background-color : white;border-radius:10px 10px 10px 10px;' >" 
																		+ "<div style='float:left;margin-top:10px'>" 
																			+ "<input type='checkbox' name='shareCheckBoxGroup' value="+data.boardshare[j].boardSeq+" data-boardSeq="+data.boardshare[j].boardSeq+"></div>" 
																		+ "<div class='shareimgBtn'style='float:left;width:211px;'>"
																			+ "<input type='hidden' value='"+j+"'>"
																		+ "<img class='shareimgBtn' data-imgBtnNumber = '"+ j + "'  src='./resources/upload/" + data.boardshare[j].filename
																		+ "'style='border:1px black solid;clear:both; width: 40px; height: 40px; opacity:0.9;margin-left: -100px;'></div></div>");
							}
						}
					},
					error : function() {
						alert('indexlogged : Error while request..');
					}
				});
			});
		
		});
		//*************************************************************************************************
		//공유하기 상세 마우스 올렸을때!
		$(document).on('mouseover','.shareimgBtn',function(){
			$('#share-detail-preview').css("display","block");
			$('#share-detail-preview-imgtag').attr("src",$(this).attr("src"));
		});
		$(document).on('mouseout','.shareimgBtn',function(){
			$('#share-detail-preview').css("display","none");
		});
		//*************************************************************************************************
		//*************************************************************************************************
		$(document).on('click','.detailImg',function(){
			alert($(this).find("img").attr("src"));
			$("#modal-content-view").css("display","none");
			$('#modal-content').append("<div id='modal-detile-view'style='width: 960px; height: 540px; display: block;z-index:1000;position:absolute;'>	<img style='z-index:10' src='"+$(this).find("img").attr("src")+"'></div>");
		});
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////////////////
		//사용자가 선택한 공유 목록 가져오기 (수정중........................)
		$(document).on('click','#share-confirm-btn',function(){
			
			var checked = new Array();
			$(document).find("input[name=shareCheckBoxGroup]:checked").each(function(i,j){
				checked[i]= j.value;
			});
			//if(chked_val!="")chked_val = chked_val.substring(1);
			var checkedLength = $(document).find("input[name=shareCheckBoxGroup]:checked").length;
			
			//alert(checkedLength);
			for(var j=0;j<checkedLength;j++){
				alert(checked[j]);
			}
			
			if(checkedLength==0){
				alert("게시물을 선택 해주세요.");
			}else{
				$.ajax({
					type : 'POST',
					url : 'share/shareDo',
					data:"checked="+ checked,
					success : function(data) {
						
						
						alert(data);
					},
					error : function() {
						alert('Error while request..');
					}
				});
				$('.share-info-div').hide("slide", {direction : "left"});
			}
			
			return false;
		});
		//----------------------------------------------------------------------
		function get_chked_values(){
			var chked_val = "";
			$(document).find("input[name=shareCheckBoxGroup]:checked").each(function(pi,po){
			chked_val += ","+po.value;
			});
			if(chked_val!="")chked_val = chked_val.substring(1);
			return chked_val;
			}
		//----------------------------------------------------------------------
		$(document).on('click','#share-cancel-btn',function(){
			alert("취소 버튼");
			$('.share-info-div').hide("slide", {direction : "left"});
			return false;
		});
		
		
		$(document).on('click','#share-ALL-choice-btn',function(){
			console.log("dd");
			$('input[name=shareCheckBoxGroup]').prop("checked",true);
			return false;
		});
		
		$(document).on('click','#share-ALL-clear-btn',function(){
			console.log("zz");;
			$(document).find('input[type=checkbox]').prop("checked",false);
			return false;
		});
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		//////////////////////////////////////////////////////////////////////////////////////////////////////	
	
});



