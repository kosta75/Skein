<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
/* ================ DOCK 1 ================ */
#dock { position: relative; top:25px; left:210px;}
.dock-container { position: relative; top: -8px; height: 50px; padding-left: 20px; }
a.dock-item { display: block; width: 50px; position: absolute; bottom: 0; text-align: center; text-decoration: none; color: #333; }
.dock-item span { display: none; padding-left: 20px; }
.dock-item img { border: 0; margin: 5px 10px 0px; width: 100%; }
div p{
	text-align: center;
}
div p b{
	font-size: 20px;
}
</style>	
<section class="content-container">
	<div class="notification-content-wrapper"
		style="height: 600px; width: 760px; background-color: white; border-radius: 8px 8px 8px 8px;">
		<p>
			<b>!Alram Page!</b>
		<p>
		<div id="dock">
				<div class="dock-container" style=" left: 503px; width: 400px; ">
					<a class="dock-item" href="#" style="width: 50px; left: 0px;"><span style="display: none;"></span><input type="hidden" value="1"><img data-dataSeq="1" src="${pageContext.request.contextPath}/resources/media/image/dock/all.gif" alt="home"></a> 
					<a class="dock-item" href="#" style="width: 50px; left: 50px;"><span style="display: none;">Notice</span><input type="hidden" value="2"><img data-dataSeq="2" src="${pageContext.request.contextPath}/resources/media/image/dock/notice.gif" alt="contact"></a> 
					<a class="dock-item" href="#" style="width: 50px; left: 100px;"><span style="display: none;">Friend</span><input type="hidden" value="3"><img data-dataSeq="3" src="${pageContext.request.contextPath}/resources/media/image/dock/friend.gif" alt="portfolio"></a> 
					<a class="dock-item" href="#" style="width: 50px; left: 150px;"><span style="display: none;">Board</span><input type="hidden" value="4"><img data-dataSeq="4" src="${pageContext.request.contextPath}/resources/media/image/dock/board.gif" alt="music"></a> 
					<a class="dock-item" href="#" style="width: 50px; left: 200px;"><span style="display: none;">Reply</span><input type="hidden" value="5"><img data-dataSeq="5" src="${pageContext.request.contextPath}/resources/media/image/dock/reply.gif" alt="video"></a> 
				</div><!-- end div .dock-container -->
			</div>
		
		<div class="notification-top-menu" style="border-bottom: 4px solid red; clear: both; background-color: white; height:30px;">
		</div>
		<div class="notification-middle-menu" style="clear: both; background-color: yellow; height: 100px;">
		</div>
		<div class="notification-bottom-menu" style="clear: both; background-color: skyblue; height: 100px;widht:100%;">
			
		</div>
		
	</div>
</section>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/alram/fisheye-iutil.min.js"></script> 

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/alram/dock-example1.js"></script> 

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/alram/jquery.jqDock.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/notificationView.js"></script>


