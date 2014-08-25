$(document).ready(function(){
	
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
				
		console.log(data.listSource);
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
		
		console.log(flagSource);
		
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

	$('#sidemenu1').click(function() {
		$('#sidemenu1').append($('#mon').toggle("display"));
	});
	$('#sidemenu2').click(function() {
		$('#sidemenu2').after($('#mon').toggle("display"));
	});
	$('#sidemenu3').click(function() {
		$('#sidemenu3').after($('#mon').toggle("display"));
	});
	// modal- 기능 구현
	
	
	
	$(document).on("click","#modal-launcher,#modal-close, #modal-background",function(){
		var groupSeq = $(this).find("input").val();
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
					$(".modalcontent").append("<div style='width:100%;height:50px;' class='modalViewcontent'>"+ data.detailView[0].fullname + "<br>"
							+ data.detailView[0].writeDate + "</div>    <div style='clear:both;width:380px; margin-top:15px;margin-bottom:15px;'  class='modalViewcontent'>" + data.detailView[0].content + "</div>");

					detail = data.detailView.length;
					$("#imglength").val(data.detailView.length);
					
					for (var i = 0; i < data.detailView.length; i++) {
						$("#imgBtnList").append("<div class='imgBtn'>" + "<input type='hidden' value='" + i + "'>"
								+ "<img class='imgbtn' data-imgBtnNumber = '"	+ i 	+ "'  src='./resources/upload/" + data.detailView[i].filename
								+ "' style='width: 40px; height: 40px; padding-left:15px;padding-top:10px;opacity:0.4;'></div>" + "</div>");
						$("#detailImg"+ i).attr("src",'./resources/upload/'+ data.detailView[i].filename);
					}
				},
				error : function() {
					alert('indexlogged 354 : Error while request..');
				}
			});
		} else {
			$('.content-wrapper').off('wheel.modal mousewheel.modal');
			$("html").css("overflow-y", "auto");
			$(".imgBtn").remove();
			$(".modalViewcontent").remove();
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
		$("#historyemoticon").css("display","none");
		$("#historymap").css("display","none");
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
		$("#diaryImg").css("display","block");
			});

	//이모티콘 추가
	$(".emoticon").click(function(){
		$("#writeTextarea").append($(this).clone());	
		$("#writeTextarea").focus();
	
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
           $('.content-wrapper').append(data);  
        }  
       },
       error: function(){
          alert('스크롤 에러 :error while request..'   );
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
	
	
	//공유
	$(document).on('click', '.share', function(){
		alert($(this).find("input[type='hidden']").val());
	});
	$(document).on('click', '.modalShare', function(){
		alert($(this).find("input[type='hidden']").val());
	});
});
