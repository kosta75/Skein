<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<script>
$(document).ready(function(){
	
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
				html.push("<div id='" + id + "' data-fileid='" + file.extra.fileID + "' data-groupid='"+ groupID +"'>"+file.name+"</div></li>");
			} 
			
		var start = "<li><div id='group_" + groupID + "' class='group'>Group: " + groupID + " ("	+ files.length + " files)</div>";
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
				$("#group_" + group.groupID).append(	"<div>(Time to load: " + (group.ended - group.started)	+ "ms)</div>");
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
</script>
<se:authentication property="name" var="LoginUser"/>
<section class="content-container">
	<form id="hitstoryForm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="email" value="${LoginUser}">
		내용 : <input type="text" name="content" /><br />
		발생일자 : <input type="date" name="startDate"><br />
		종료일자 : <input type="date" name="endDate"><br />
		공개범위
		<select name="publicLevelCode">
			<option value="1">비공개</option>
			<option value="2">비공개</option>
			<option value="3">비공개</option>
			<option value="4">비공개</option>
			<option value="5">비공개</option>
		</select>
		
		<ul id="demo" class="offset2 arrow_box">
			<li class="">
				<h3>Drop Zone</h3>
	
				<p id="dropzone" class="">
					Drag and drop files from your desktop here (or select them from the
					input above).<br> They will be read in browser.<br>
				</p>
				<ul id="file-list"></ul>
	
			</li>
		</ul>
		<input type="submit" value="Send" />
	</form>
</section>
