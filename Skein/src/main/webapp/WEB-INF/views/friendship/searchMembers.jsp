<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	<h2>친구검색(전체 사용자중에서)</h2>
	<div>
		<form action="requestFriend" method="post">
			<input id="searchMembersInput" type="text" />
			<input type="submit" value="친구신청" />
		</form>
	</div>
	<div id="searchMembers">
	</div>
</div>
<script>
	$(document).ready(function(){
				
		$("#searchMembersInput").on('keyup', function(){
			//console.log($("#searchMembersInput").val());
			
			if($("#searchMembersInput").val().length > 0){
				$.ajax({
					type:'POST',
					url:'searchMembers',
					data:"friendName=" + $("#searchMembersInput").val(),
					success:function(data){
						//alert('sd');
						//console.log(data);
						var obj = data.list;
						//console.log(obj);
						//var list = obj.length;
						//console.log(list);
						var msg = "";
						for(var i=0;i<obj.length;i++){
							msg += obj[i].fullName + "<br />";
							//console.log(obj[i].fullName);
						}
						$("#searchMembers").html(msg);
						
					},
					error: function(){						
						alert('Error while request..'	);
					}
				});
			}
			
		});
		

	});
</script>