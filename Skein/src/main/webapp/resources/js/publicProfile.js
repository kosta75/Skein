$(document).ready(function() {
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
	
	//*************************************************************************************************
	//*************************************************************************************************
		//공유하기 버튼 클릭시 공유목록 출력!
		$(document).on('click', '.share-btn', function(){
			

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

