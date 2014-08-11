<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<section class="content-container">
	<nav class="gnb">
		<ul>
			<li><a href="${pageContext.request.contextPath}">타임라인</a></li>
			<li><a href="${pageContext.request.contextPath}/${personalURI}">프로필</a></li>
			<li><a href="${pageContext.request.contextPath}/notifications/list">알림리스트</a></li>
			<li><a href="${pageContext.request.contextPath}/friendship/list">친구리스트</a></li>
		</ul>
	</nav>
	<div>
		<p><a href="${pageContext.request.contextPath}/friendship/searchMembers">사용자검색</a></p>
	</div>
	<div class="content-registry-form-container">
		<form id="postReg" action="${pageContext.request.contextPath}/board/registry" method="post">
			<select name="publicLevelCode">
			<c:forEach var="publicLevelList" items="${publicLevelList}">
				<option value="${publicLevelList.publicLevelCode}">${publicLevelList.publicLevelDescription}</option>
			</c:forEach>
				
			</select>
			<textarea name="content" id="content" cols="30" rows="10">
			</textarea>
			
			<input type="file" id="file-input" />
			<div id="dropzone">
			Drag file here
			</div>
			
			<input type="submit" value="Registry" />
		</form>
		
		
	</div>
	
	
	<div id="messages">
		<p>Status Messages</p>
	</div>
	<ul id="file-list"></ul>
	<script>
		$(document).ready(function(){
			
			/* FileReaderJS.setupInput(document.getElementById('file-input'), options);
			FileReaderJS.setupDrop(document.getElementById('dropzone'), options);
			FileReaderJS.setupClipboard(document.body, options); */
			
			
			var filelist = document.getElementById("file-list");

			  function groupTemplate(groupID, files) {
			    var html = [];
			    for (var i = 0; i < files.length; i++) {
			      var file = files[i];
			      var id = "group_" + groupID + "_file_" + file.extra.fileID;

			      html.push(
			        "<li id='" + id + "' data-fileid='" + file.extra.fileID + "' data-groupid='"+ groupID +"'>" +
			          "<span class='filename'>" + file.name + "</span> " +
			          "<div><span class='not-done'><em>Loading...</em></span><span class='on-done'><span class='time-to-load'></span> ms</span></div>" +
			          "<span class='details'><a href='#' class='btn'>details</a></span> " +
			          "<div class='modal hide'>" + file.name + "<br />" + file.type + "<br /></div>" +
			          "<pre>" + JSON.stringify(file, null, '\t') + "</pre>" +
			        "</li>"
			      );
			    }

			    var start = "<li id='group_" + groupID + "' class='group'>Group: " + groupID + " (" + files.length + " files) </li>";

			    return  start + html.join('');
			  }

			  var opts = {
			    on: {
			      load: function(e, file) {
			        var fileDiv = $("#group_" + file.extra.groupID + "_file_" + file.extra.fileID)
			        fileDiv.addClass("done");

			        var ms = file.extra.ended - file.extra.started;
			        fileDiv.find(".time-to-load").text(ms);
			        if (file.type.match(/image/)) {
			          // Create a thumbnail and add it to the output if it is an image
			          var img = new Image();
			          img.onload = function() {
			            fileDiv.find(".modal").append(img);

			            fileDiv.prepend($(img).clone());
			          };
			          img.src = e.target.result;
			        }
			        else {
			          //fileDiv.find(".modal").append($("<div />").text(e.target.result));
			        }

			      },
			      error: function(e, file) {
			        $("#group_" + file.extra.groupID + "_file_" + file.extra.fileID).addClass("error");
			      },
			      groupstart: function(group) {
			        $(filelist).append(groupTemplate(group.groupID, group.files));

			        $(filelist).find(".details a:not(.initialized)").click(function() {
			            $(this).closest("li").find(".modal").modal('show');
			        })

			        $(filelist).find(".modal:not(.initialized)").addClass("initialized").modal({ show: false }).on("show", function() {

			        });
			      },
			      groupend: function(group) {
			        $("#group_" + group.groupID).append(
			          "<div>(Time to load: " + (group.ended - group.started) + "ms)</div>"
			        );
			      }
			    }
			  };
			
			$("#file-input, #dropzone").fileReaderJS(opts);
			$("body").fileClipboard(opts);
			
			var HistoryCommand = new Object();
			HistoryCommand.groupSeq = 1;
			HistoryCommand.groupName = "Test";
			HistoryCommand.histories = new Array();
			
			var History = new Object();
			History.historySeq = 1;
			History.BoardSeq = 1;
			History.content = "Text01";
			
			HistoryCommand.histories.push(History);
			
			console.log(HistoryCommand);
			
			$("#postReg").on("submit", function(){
				console.log();
				return false;
			});
			
			
			
		});
	</script>
	
  
	<div id="post-container">
		<div>
			<table>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>글내용</th>
				<th>작성일</th>
				<th>공개범위</th>
			</tr>
			<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.boardSeq}</td>
				<td>${list.fullName}</td>
				<td>${list.content}</td>
				<td>${list.writeDate}</td>
				<td>${list.publicLevelCode}</td>
			</tr>	
			</c:forEach>
		</table>
		</div>
		<div id="response-message">
		</div>
	</div>
	
	<script>
		$(document).ready(function(){
			$("#searchFriendsInput").on('keyup', function(){
				console.log($("#searchFriendsInput").val());
				if($("#searchFriendsInput").val().length > 0){
					$.ajax({
						type:'post',
						url:'friendship/searchFriends',
						data:"email=${LoginUser}&friendName=" + $("#searchFriendsInput").val(),
						datatype:'json',
						success:function(data){
							//alert('sd');
							console.log(data);
							var obj = data.list;
							console.log(obj);
							var list = obj.length;
							console.log(list);
							var msg = "";
							for(var i=0;i<obj.length;i++){
								msg += obj[i].fullName + "<br />";
								//console.log(obj[i].fullName);
							}
							$("#searchFriends").html(msg);
							
						},
						error: function(){						
							alert('Error while request..'	);
						}
					});
				}
				
			});
			
			
			
			
			/* $("#postReg").on('submit', function(){
				$.ajax({
					type:'post',
					url:'post/postReg',
					cache: false,				
					data:'content=' + $("#content").val(),
				    success:function(data){ //callback
				    	var post = data.post;
				    	historyPost.setBoardSeq(1);
						historyPost.setContent(content);
						historyPost.setBoardKindSeq(1);
						historyPost.setHistorySeq(1);
						historyPost.setFeeling("기분 좋음");
						historyPost.setWeather("비오는날");
						historyPost.setIsImportant(0);
						historyPost.setIsShare(0);
						historyPost.setKeyword("키워드");
						historyPost.setPlace("장소");
						historyPost.setGroupSeq(1);
				    	var msg = post.boardSeq + " / " + post.content + " / "+ post.boardKindSeq + " / ";
						msg += post.historySeq + " / " + post.feeling + " / "+ post.weather + " / ";
				        $("#response-message").empty();
				        $("#response-message").html(msg);
				     },
					error: function(){						
						alert('Error while request..'	);
					}
				});
				return false;
			}) */
			
			/* $("#notificationList").on('click', function(){
				$.ajax({
					type:'post',
					url:'notifications/list',
					cache: false,				
					data:'personalURI='+${sessionScope.personalURI},
				    success:function(data){ //callback
				    	
				        $("#response-message").empty();
				        $("#response-message").html();
				     },
					error: function(){						
						alert('Error while request..'	);
					}
				});
			}); */
			
			
				
		});
	</script>
	
	
</section>