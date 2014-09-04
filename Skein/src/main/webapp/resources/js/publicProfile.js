$(document).ready(function(){
	
	//기본 사용자 정보
	var email = $(".public-profile-content-container").data("email");
	var profileImg = $(".public-profile-content-container").data("profileImg");
	if (profileImg == null || profileImg == '') {
		profileImg = "default-profile-image.png";

	}
	
	//헤더 Bar 색상
	var color = $(".public-profile-content-container").data("color");
	

	$(document).on('mouseout', ".imgBtn", function(){
		$(this).css("opacity", "0.4");
		$(this).css("cursor", "pointer");
	});

	$(document).on('mouseover', ".imgBtn", function() {
		$(this).css("opacity", "1");
		$(this).css("cursor", "pointer");
	});



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
	

	
	var boardSeq = 0;
	var fullname =$(".replyWrite").data("fullname");
	// modal- 기능 구현
	$(document).on("click","#modal-launcher,#modal-close, #modal-background",function() {
						var groupSeq = $(this).find("input")
								.val();

						var publicLevel;

						boardSeq = $(this).data("boardseq");
					
						$(".modalcontent").css("display",
								"block");
						$(".modalShare").find("input").val(
								groupSeq);
						if ($(this).attr("id") == "modal-launcher") {
							$("html").css("overflow-y",
									"hidden");
							$('.content-wrapper').on('wheel.modal mousewheel.modal',function() {
												return false;
											});

							$.ajax({type : 'post',
										url : 'profileDetailView',
										cache : false,
										data : 'groupSeq='
												+ groupSeq,
										success : function(data) {
											if (data.detailView[0].publicLevelCode == 5) {
												publicLevel = "전체공개";
											} else if (data.detailView[0].publicLevelCode == 4) {
												publicLevel = "사용자";
											} else if (data.detailView[0].publicLevelCode == 3) {
												publicLevel = "친구공개(모두)";
											} else if (data.detailView[0].publicLevelCode == 2) {
												publicLevel = "친구공개(공유)";
											} else {
												publicLevel = "나만보기";
											}
											if(data.detailView[0].profileinfo == null || data.detailView[0].profileinfo == ''){
												
												profileimg	 = "default-profile-image.png";
											}else{
												profileimg = data.detailView[0].profileinfo;
											}
											
											var date = data.detailView[0].writeDate;
											var writeday = new Date(date);
											var writedate = writeday.getFullYear()+"년"+(writeday.getMonth()+1)+"월"+writeday.getDay()+"일";
											
											
											$(".modal-content-view").css("display","block");
											$(".modalcontent").append("<div style='width:100%;height:50px;' class='modalViewinfo'>"
																	+ "<div class='modal-user-profile-image' style='float: left;'><img src='./resources/user-profile-image/"
																	+ profileimg
																	+ "' /></div>"
																	+ data.detailView[0].fullname
																	+ "<br>"
																	+ "<div style='float:left'>"+writedate+"</div><div style='font-family: 맑은 고딕;font-size: 12px;float: left'>("+publicLevel+")</div>"
																	+ "</div>    <div style='clear:both;width:380px; margin-top:15px;margin-bottom:15px;'  class='modalViewcontent'><div class='detailContent'>"
																	+ data.detailView[0].content
																	+ "</div></div>");

											detail = data.detailView.length;
											$("#imglength").val(data.detailView.length);

											for (var i = 0; i < data.detailView.length; i++) {
												$("#imgBtnList").append("<div class='imgBtn' data-boardSeq='"
																		+ data.detailView[i].boardSeq
																		+ "'>"
																		+ "<input type='hidden' value='"
																		+ i
																		+ "'>"
																		+ "<img class='imgbtn' data-imgBtnNumber = '"
																		+ i
																		+ "'  src='./resources/upload/"
																		+ data.detailView[i].filename
																		+ "' style='width: 40px; height: 40px; padding-left:15px;padding-top:10px;opacity:0.4;'></div>"
																		+ "</div>");
												$("#detailImg"+ i).attr("src",'./resources/upload/'
																		+ data.detailView[i].filename);

											}

											$.ajax({
														type : 'post',
														url : 'reply/select',
														cache : false,
														data : "Count=0&boardSeq="
																+ boardSeq,
														success : function(data) {

															for (var j = 0; j < data.replylist.length; j++) {
																/*
																 * alert(data.replylist[j].replyContent);
																 */
																var	replyContent	= "<div style='clear:both;'>" +
																		"<div class='modal-reply-profile-image-wrapper'>" +
																		"<img class='modal-reply-profile-img'src='./resources/user-profile-image/"+data.replylist[j].profileinfo+"' />"
																		+"</div><div class='reply-linker'>"+data.replylist[j].fullName+"</div>"
														replyContent += "<div class='replymodalList modal-bubble'>"
														replyContent += data.replylist[j].replyContent
														  if (email == data.replylist[j].email) {
															replyContent += "<div class='reply-edit-container' style='float: right;margin-bottom: 5px;' >"
															replyContent += "<img class='icon-box reply-Edit' src='./resources/media/image/modal-editImg.jpg' data-replySeq='"+ data.replylist[j].replySeq+"'style='margin-right:10px;float: left;'>	"
															replyContent += "<img class='icon-box reply-Delete 'src='./resources/media/image/modal-deleteImg.jpg' data-replySeq='"+ data.replylist[j].replySeq+"' style='float: right;'>"
															replyContent += "</div>"
															replyContent += "</div>"
															replyContent += "<div class='modal-bubble'style='display: none;'>"
															replyContent += "<div class='reply-Edit-Textarea' contenteditable='true' data-replySeq='"
																	+ data.replylist[j].replySeq
																	+ "'></div>"
															replyContent += "<input type='hidden' name='reply-Edit-Content' id='reply-Edit-Content' />"
															replyContent += "</div>"

														}
														replyContent += "</div>"
																$(".replyList").append(replyContent);

															}

															$.ajax({
																		type : 'post',
																		url : "reply/replyCountSelect",
																		data : "Count=0&boardSeq="
																				+ boardSeq,
																		success : function(
																				data) {

																			if (data.count > 0) {
																				$(".replyList").append("<div class='modal-reply-more-btn'>더보기("
																										+ data.count
																										+ ")</div>");

																			}
																		},
																		error : function() {
																			alert('댓글 더보기 error :error while request..');
																		}

																	});

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
							$(".modalcontent").empty();
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
							$(".modal-user-profile-image").remove();
						}

						$("#modal-content, #modal-background")
								.toggleClass("active");

					});
	/* 댓글 수정 */
	$(document).on("click",".reply-Edit",function() {

				$(this).parent().parent()
						.css("display", "none");
				$(this).parent().parent().siblings().last()
						.css("display", "block");

			});
	$(document).on('keydown',".reply-Edit-Textarea",
					function(e) {
						var replySeq = $(this).data("replyseq");

						$(this).parent().find(
								"input[type=hidden]").val(
								$(this).text());
						var replyeditform = $(this).parent();
						if (e.keyCode === 13) {
							replyeditBtn = replyeditform
									.siblings().first().next()
									.children().clone();
							var replyEditContent = $(this)
									.parent()
									.find("input[type=hidden]")
									.val();
							$.ajax({
										type : 'post',
										url : "reply/replyUpdate",
										data : "replySeq="
												+ replySeq
												+ "&replyEditContent="
												+ replyEditContent,
										success : function(data) {

											if (data.result > 0) {
												/* replyEditContent += */
												replyeditform.css("display","none");
												replyeditform.siblings().first().next().css("display","block");

												replyeditform.siblings().first().next().html(replyEditContent);
												replyeditform.siblings().first().next().prepend(replyeditBtn);

											}
										},
										error : function() {
											alert('댓글 수정 error :error while request..');
										}

									});
						}
					});
	/* 댓글 삭제 */
	$(document).on("click", ".reply-Delete", function() {

		replySeq = $(this).data("replyseq");
		replyContainer = $(this).parent().parent().parent();
		alert(replySeq);
		$.ajax({
			type : 'post',
			url : "reply/replyDelete",
			data : "replySeq=" + replySeq,
			success : function(data) {
				replyContainer.remove();

			},
			error : function() {
				alert('댓글 삭제 error :error while request..');
			}
		});
	});

		

	
	
	// 모달 댓글 리스트 출력
	$(document).on('click',".imgBtn",function() {

						$(".replyList").empty();
						var publicLevel;
						var imgBtn = "#imgBtn"
								+ $(this).find("input").val();
						var detailImg = "#detailImg"
								+ $(this).find("input").val();
						boardSeq = $(this).data("boardseq");

						var j = $(this).find("input").val();
						for (var i = 0; i < 9; i++) {
							if (i == j) {
								$("#detailImg" + i).css(
										"display", "block");
							} else {
								$("#detailImg" + i).css(
										"display", "none");
							}
						}
						var profileimg;
						$.ajax({
									type : 'post',
									url : 'board/DetailViewBoardSeq',
									cache : false,
									data : 'boardSeq='
											+ boardSeq,
									success : function(data) {
										if (data.detailView.publicLevelCode == 5) {
											publicLevel = "전체공개";
										} else if (data.detailView.publicLevelCode == 4) {
											publicLevel = "사용자";
										} else if (data.detailView.publicLevelCode == 3) {
											publicLevel = "친구공개(모두)";
										} else if (data.detailView.publicLevelCode == 2) {
											publicLevel = "친구공개(공유)";
										} else {
											publicLevel = "나만보기";
										}
										
										if(data.detailView.profileinfo == null || data.detailView.profileinfo == ''){
											
											profileimg	 = "default-profile-image.png";
										}else{
											profileimg = data.detailView.profileinfo;
										}
										var date = data.detailView.writeDate;
										var writeday = new Date(date);
										var writedate = writeday.getFullYear()+"년"+(writeday.getMonth()+1)+"월"+writeday.getDay()+"일";
										
										$(".modalcontent").empty();
										$(".modal-content-view").css("display","block");
										$(".modalcontent").append(
												"<div style='width:100%;height:50px;' class='modalViewinfo'>"
												+ "<div style='float:right;margin-right:25px;margin-top:5px;'>"
												+ publicLevel
												+ "</div>"
												+ "<div class='modal-user-profile-image' style='float: left;'><img src='./resources/user-profile-image/"+profileimg+"'></div>"
												+ data.detailView.fullname
												+ "<br>"
												+ "<div style='float:left'>"+writedate+"</div><div style='font-family: 맑은 고딕;font-size: 12px;float: left'>("+publicLevel+")</div>"
												+ "</div>    <div style='clear:both;width:380px; margin-top:15px;margin-bottom:15px;'  class='modalViewcontent'><div class='detailContent'>"
												+ data.detailView.content
												+ "</div></div>");

										$.ajax({type : 'post',
													url : 'reply/select',
													cache : false,
													data : 'Count=0&boardSeq='
															+ boardSeq,
													success : function(
															data) {

														for (var j = 0; j < data.replylist.length; j++) {
													var	replyContent	= "<div style='clear:both;'><div class='modal-reply-profile-image-wrapper' style='width:50px;float:left'><img class='modal-reply-profile-img' src='./resources/user-profile-image/"+data.replylist[j].profileinfo+"' />"
																+"</div><div class='reply-linker'>"+data.replylist[j].fullName+"</div>";
																
													replyContent += "<div class='replymodalList modal-bubble'>"
														replyContent += data.replylist[j].replyContent
														  if (email == data.replylist[j].email) {
															replyContent += "<div class='reply-edit-container' style='float: right;margin-bottom: 5px;' >"
															replyContent += "<img class='icon-box reply-Edit' src='./resources/media/image/modal-editImg.jpg' data-replySeq='"+ data.replylist[j].replySeq+"' style='margin-right:10px;float: left;'>	"
															replyContent += "<img class='icon-box reply-Delete 'src='./resources/media/image/modal-deleteImg.jpg' data-replySeq='"+ data.replylist[j].replySeq+ "' style='float: right;'>"
															replyContent += "</div>"
															replyContent += "</div>"
															replyContent += "<div class='modal-bubble'style='display: none;'>"
															replyContent += "<div class='reply-Edit-Textarea' contenteditable='true' data-replySeq='"
																	+ data.replylist[j].replySeq
																	+ "'></div>"
															replyContent += "<input type='hidden' name='reply-Edit-Content' id='reply-Edit-Content' />"
															replyContent += "</div>"

														}
														replyContent += "</div>"
															
															
																
															$(".replyList").append(replyContent);
														}
														$.ajax({
																	type : 'post',
																	url : "reply/replyCountSelect",
																	data : "Count=0&boardSeq="
																			+ boardSeq,
																	success : function(
																			data) {

																		if (data.count > 1) {
																			$(".replyList").append("<div style='margin-top:10px;width:100%;clear:both;background: #e4e4e4;color: darkgrey;text-align: center;padding: 8px 0;' class='modal-reply-more-btn'>더보기("
																									+ data.count
																									+ ")</div>");

																		}
																	},
																	error : function() {
																		alert('댓글 더보기 error :error while request..');
																	}

																});

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

	// 모달 댓글
	$(document)
			.on(
					'keydown',
					".modalreplyWrite",
					function(e) {
						if (e.keyCode === 13) {

							replywrite = $(this);
							
							var replyContent = $(this).val();

							if ($(this).val() != null&& $(this).val() != '') {
								$.ajax({
											type : 'post',
											url : 'reply/insert',
											cache : false,
											data : 'boardSeq='
													+ boardSeq
													+ "&replyContent="
													+ replyContent,
											success : function(
													data) {
												$(".replyList").prepend("<div style='clear:both;'><div class='modal-reply-profile-image-wrapper' style='width:50px;float:left'><img class='modal-reply-profile-img' src='"+$(".replyImg").attr("src")+ "'>"
														
																		+ "</div><div class='reply-linker'>"+ fullname +"</div><div class='replymodalList modal-bubble'>"
																		+ replyContent
																		+ "</div>");

												replywrite.val('');
											},
											error : function() {
												alert('indexlogged 354 : Error while request..');
											}
										});
									}
								} else {

							$(this).focus();
								}
					});
	
	$(document).on("mouseover",".replymodalList",function(){
		
		$(this).children().css("display","block");
	});
	$(document).on("mouseout",".replymodalList",function(){
		
		$(this).children().css("display","none");
	});
	// 댓글
	$(document).on('keydown',".replyWrite",	function(e) {
						if (e.keyCode === 13) {

							if ($(this).val() != null&& $(this).val() != '') {

								var boardSeq = $(this).parent().find("input[type=hidden]").val();
								var replyContent = $(this).val();

								// var reply =
								// $(".group-item-reply-secition
								// ul");
								var reply = $(this).parent().siblings().next().next().next().find("ul");
								console.log(reply);
								$(this).val('');
								$.ajax({
											type : 'post',
											url : 'reply/insert',
											cache : false,
											data : 'boardSeq='
													+ boardSeq
													+ "&replyContent="
													+ replyContent,
											success : function(data) {
												/*
												 * reply.prepend( "<li><div
												 * class='group-item-reply-container'>" +"<div
												 * class='group-item-reply-info-container'>" +"<div
												 * class='group-item-reply-profile-image'>" +"<a
												 * href='${pageContext.request.contextPath}/'>" +"<img
												 * src='./resources/user-profile-image/"+profileImg+"'
												 * alt='"+fullname+"'
												 * title='"+fullname+"'
												 * />" +"<span>"+fullname+"</span></a>" +"</div>" +"<div>"+fullname+"</div>" +"</div>" +"<div
												 * class='group-item-reply-content-container
												 * bubble'>"
												 * +replyContent +"<div
												 * class='reply-edit-container'
												 * style='float:
												 * right;margin-bottom:
												 * 5px;' >" +"<img
												 * class='icon-box
												 * reply-Edit
												 * "+color+"'
												 * src='./resources/media/image/editImg.jpg'
												 * style='margin-right:10px;float:
												 * left;'> " +"<img
												 * class='icon-box
												 * reply-Delete
												 * "+color+"'src='./resources/media/image/deleteImg.jpg'
												 * data-replySeq='${replyItem.replySeq}'
												 * style='float:
												 * right;'>" +"</div>" +"</div>" +"<div
												 * class='bubble'style='display:
												 * none;'>" +"<div
												 * class='reply-Edit-Textarea'
												 * contenteditable='true'
												 * data-replySeq=></div>" +"<input
												 * type='hidden'
												 * name='reply-Edit-Content'
												 * id='reply-Edit-Content'
												 * />" +"</div>" );
												 */

												location.reload();

											},
											error : function() {
												alert('indexlogged 354 : Error while request..');
											}
										});
							} else {

								alert("댓글을 입력해주세요");

								$(this).focus();

							}

						}

					});
	// 엔터키 처리
	$("#writeTextarea").on('keydown',function(e) {

				// trap the return key being pressed
				if (e.keyCode === 13) {
					// insert 2 br tags (if only one br tag is
					// inserted the cursor won't go to the next
					// line)
					document.execCommand('insertHTML', false,
							'<br><br>');
					// prevent the default behaviour of return
					// key pressed
					return false;
				}
			}).on('keyup',function() {
				if ($("#writeTextarea").text().length > 0) {
					$("#dropzone .placeholder").css('display',
							'none');
				} else {
					$("#dropzone .placeholder").css('display',
							'block');
				}
			});
	// 지역 정보 수정 시

	$("#historyplace").click(function() {
		$("#historyplace").val('');

	});

	// 댓글 더보기

	$(document).on("click",
					".reply-more-btn",
					function() {
						var replymorebtn = $(this);
						var replySize = $(this).parent()
								.siblings().size();
						var boardSeq = $(this).data("boardseq");
						var reply = $(this).parent().parent();
						replymorebtn.parent().remove();

						$.ajax({
									type : 'post',
									url : "reply/select",
									data : "boardSeq="
											+ boardSeq
											+ "&Count="
											+ replySize,
									success : function(data) {
										var replyContent;

										console.log(data);
										if (data.replylist.length > 0) {
											for (var i = 0; i < data.replylist.length; i++) {
												replyContent = "<li><div class='group-item-reply-container'>"
												replyContent += "<div class='group-item-reply-info-container'>"
												replyContent += "<div class='group-item-reply-profile-image'>"
												replyContent += "<a href='./" + data.replylist[i].personalURI + "'>"
												replyContent += "<img src='./resources/user-profile-image/"+data.replylist[i].profileinfo+"' alt='"
														+ data.replylist[i].fullName
														+ "' title='"
														+ data.replylist[i].fullName
														+ "' />"
												replyContent += "<span>"
														+ data.replylist[i].fullName
														+ "</span></a>"
														replyContent +="</div><div class='reply-linker'><a href='/skein/"+data.replylist[i].personalURI+"'>"
														+ data.replylist[i].fullName
														+ "</a></div>"
												replyContent += "</div>"
												replyContent += "<div class='group-item-reply-content-container bubble'>"
												replyContent += data.replylist[i].replyContent
												if (email == data.replylist[i].email) {
													replyContent += "<div class='reply-edit-container' style='float: right;margin-bottom: 5px;' >"
													replyContent += "<img class='icon-box reply-Edit "+color+"'     src='./resources/media/image/editImg.jpg' data-replySeq='"+ data.replylist[i].replySeq+ "' style='margin-right:10px;float: left;'>	"
													replyContent += "<img class='icon-box reply-Delete "+color+"'   src='./resources/media/image/deleteImg.jpg' data-replySeq='"+ data.replylist[i].replySeq+ "' style='float: right;'>"
													replyContent += "</div>"
													replyContent += "</div>"
													replyContent += "<div class='bubble'style='display: none;'>"
													replyContent += "<div class='reply-Edit-Textarea' contenteditable='true' data-replySeq='"
															+ data.replylist[i].replySeq
															+ "'></div>"
													replyContent += "<input type='hidden' name='reply-Edit-Content' id='reply-Edit-Content' />"
													replyContent += "</div>"

												}
												replyContent += "</div></li>"

												reply
														.append(replyContent);

											}
										$.ajax({

														type : 'post',
														url : "reply/replyCountSelect",
														data : "Count="
																+ replySize
																+ "&boardSeq="
																+ boardSeq,
														success : function(data) {
															console.log(data);
															if (data.count > 1) {

																reply.append("<li><div class='reply-more-btn "
																				+ data.baseMemberInfo.colorTheme
																				+ "' data-boardSeq="
																				+ boardSeq
																				+ ">더보기("
																				+ data.count
																				+ ")</div></li>"

																		);

															}

														},
														error : function() {
															alert('댓글 더보기 error :error while request..');
														}

													});
										}

									},
									error : function() {
										alert('댓글 더보기 error :error while request..');
									}
								});

					});


$(document).on("mouseover",".group-item-reply-content-container",function(){
	$(this).children().css("display","block");
	
});
$(document).on("mouseout",".group-item-reply-content-container",function(){
	$(this).children().css("display","none");
	
});


//modal 댓글 더보기

$(document).on("click",".modal-reply-more-btn",function() {
					var reply = $(this).parent();
					var replymorebtn = $(this);
					var replySize = $(this).siblings()
							.size();
					replymorebtn.remove();

					$.ajax({
								type : 'post',
								url : "reply/select",
								data : "boardSeq="
										+ boardSeq
										+ "&Count="
										+ replySize,
								success : function(data) {
									console.log(data);
									if (data.replylist.length > 0) {
										for (var i = 0; i < data.replylist.length; i++) {
											
											var	replyContent	= "<div style='clear:both;'><div class='modal-reply-profile-image-wrapper'><img class='modal-reply-profile-img'src='./resources/user-profile-image/"+data.replylist[i].profileinfo+"'>"
														+"</div><div class='reply-linker'>"+data.replylist[i].fullName+"</div>";
																
											
								replyContent += "<div class='replymodalList modal-bubble'>"
									replyContent += data.replylist[i].replyContent
									  if (email == data.replylist[i].email) {
										replyContent += "<div class='reply-edit-container' style='float: right;margin-bottom: 5px;' >"
										replyContent += "<img class='icon-box reply-Edit "
												+ color
												+ "' src='./resources/media/image/modal-editImg.jpg' data-replySeq='"
												+ data.replylist[i].replySeq
												+ "' style='margin-right:10px;float: left;'>	"
										replyContent += "<img class='icon-box reply-Delete "
												+ color
												+ "'src='./resources/media/image/modal-deleteImg.jpg' data-replySeq='"
												+ data.replylist[i].replySeq
												+ "' style='float: right;'>"
										replyContent += "</div>"
										replyContent += "</div>"
										replyContent += "<div class='modal-bubble'style='display: none;'>"
										replyContent += "<div class='reply-Edit-Textarea' contenteditable='true' data-replySeq='"
												+ data.replylist[i].replySeq
												+ "'></div>"
										replyContent += "<input type='hidden' name='reply-Edit-Content' id='reply-Edit-Content' />"
										replyContent += "</div>"

									}
									replyContent += "</div>"
											
											
											reply.append(replyContent);

										}
										$.ajax({
													type : 'post',
													url : "reply/replyCountSelect",
													data : "Count="
															+ replySize
															+ "&boardSeq="
															+ boardSeq,
													success : function(data) {

														if (data.count > 0) {
															reply
																	.append("<div style='margin-top:10px;width:100%;clear:both;' class='modal-reply-more-btn'>더보기("
																			+ data.count
																			+ ")</div>");

														}
													},
													error : function() {
														alert('댓글 더보기 error :error while request..');
													}

												});
									}

								},
								error : function() {
									alert('댓글 더보기 error :error while request..');
								}
							});

				});


//메인 더보기 
function lastPostFunc(pictureCount){ 
   var personalURI = $(".group-item-wrapper").data("personaluri");
  if(pictureCount >0){
    $.ajax({
          type:'get',
       url:"moreMemberBoard",
       data:"personalURI="+personalURI+"&pictureCount="+ pictureCount,
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
  }
 }; 
 
 $(window).scroll(function(){ 
    if ($(window).scrollTop() == $(document).height() - $(window).height()){ 
      var pictureCount = $('.group-item-container').size();
     
       lastPostFunc(pictureCount); 
    }      
 });
 //댓글 숨김 
 
 $(document).on("click",".reply-show-hide-btn",function(){
	if( $(this).parent().siblings().last().css("display") == "none"){
	 $(this).parent().siblings().last().show("slide", {direction : "up"});	
	}else{
	 $(this).parent().siblings().last().hide("slide", {direction : "up"});
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
 
 $(document).on("click",".edit-Btn",function(){
	 
	 $(this).parent().siblings().first().next().val($(this).parent().siblings().first().html());
	 var editContent =  $(this).parent().siblings().first().next().val();
	 var boardSeq = $(this).parent().siblings().first().next().data("boardseq");
	 var publicLevelCode = $(".publicLevelCode").val();

	 $.ajax({
		type : 'post',
		url : 'board/editBoard',
		cache : false,
		data :'editContent='+editContent+'&publicLevelCode='+publicLevelCode+'&boardSeq='+boardSeq,
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
			
			$("#modal-content-view").css("display","none");
			$('#modal-content').append("<div id='modal-detile-view'style='width: 960px; height: 540px; display: block;z-index:1000;position:absolute;'>	<img style='z-index:10;width: 960px; height: 540px; ' src='"+$(this).find("img").attr("src")+"'></div>");
		});
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////////////////
		//사용자가 선택한 공유 목록 가져오기 (수정중........................)
		$(document).on('click','#share-confirm-btn',function(){
			
			var share_board_list = new Array();
			$(document).find("input[name=shareCheckBoxGroup]:checked").each(function(i,j){
				share_board_list[i]= j.value;
				//share_board_list.push({"boardSeq" : j.value})
			});
			var boardCheckedLength = $(document).find("input[name=shareCheckBoxGroup]:checked").length;
			
			
			var obj = new Object();
			
			obj.board = share_board_list;
			
			//obj.friend=
			var friendURI = $(this).parents('.group-item-wrapper').data("personaluri");
			//var friendURI =  $(document).find('#group-item-wrapper').data("personaluri");
			alert("송광효"+friendURI);
			
			obj.friend= friendURI;
			
			
			var jsonData = JSON.stringify(obj);
			console.log(jsonData);
			
			if(boardCheckedLength==0){
				alert("게시물을 선택 해주세요.");
			}else{
				$.ajax({
					type : 'POST',
					url : 'share/publicShareDo',
					data : { json : jsonData },
					dataType :"json",
					success : function(data) {
						//alert(data);
						//console.log(data);
						alert(data.resultMessage);
					},
					error : function() {
						alert(' public share 확인 버튼 : Error while request..');
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



