<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<script>
$(document).ready(function(){
	
	var filelist = document.getElementById("file-list");
	function groupTemplate(groupID, files) {
		console.log("function groupTemplate start");
		var html = [];
		for (var i = 0; i < files.length; i++) {
			var file = files[i];
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
			}
		}
	};

	$("#file-input, #dropzone").fileReaderJS(opts);
	$("body").fileClipboard(opts);
});
</script>
<section class="content-container">
	<ul id="demo" class="offset2 arrow_box">
		<li class="">
			<h3>File Input</h3>

			<p>You can access files that users select via an
				input[type=file]. Try it out below:</p>
			<form id="file-form" method="post" enctype="multipart/form-data">
				<input type="hidden" name="extra-data" multiple="">
				<input type="file" id="file-input" name="file-input" multiple="" maxlength="10">
			</form>

		</li>
		<li class="">
			<h3>Drop Zone</h3>

			<p id="dropzone" class="">
				Drag and drop files from your desktop here (or select them from the
				input above).<br> They will be read in browser.<br>
			</p>
			<ul id="file-list"></ul>

		</li>
		<li class="">
			<h3>Clipboard</h3>
			<p>In some browsers, you can paste images onto a page. Go ahead
				and 'print screen' then press Ctrl+V to try that out!</p>
			<p>
				Doesn't work in Firefox (as of version 30). Follow <a
					href="https://bugzilla.mozilla.org/show_bug.cgi?id=891247">this
					Firefox bug</a> for progress on implementation.
			</p>
		</li>
	</ul>
	
</section>