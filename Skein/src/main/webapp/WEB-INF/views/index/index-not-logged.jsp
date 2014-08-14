<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- <video id="videobcg" loop="loop" preload="auto" style="margin-top: -5px; position: fixed; width: 100%; height:70% opacity: 1" autoplay="autoplay" src="video/videoplayback.mp4" type="video/mp4 "	>
	poster="./img/20100107221109605_2R2EJLGPV_raw.jpg "
</video> -->

<section class="content-container">
	<div id="Sil">
		<a href="index.jsp">Sil</a>
	</div>
	
	<div id="login">
		<table>
			<tr>
				<td>
					<form action="${pageContext.request.contextPath}/security"	 method="post">
						이메일:<input type="text" name="email" />
						비밀번호:<input	type="password" name="password" />
						<input type="submit" value="Login" />
					</form>
				</td>
			</tr>
			<tr>
				<td style="float: right; margin-right: 140px;">
					<div>
						<a href="${pageContext.request.contextPath}/joinus/refind">계정찾기</a>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<!--  -->
	
	<div align="center">
		<table style="width: 960px;">
			<tr>
				<td></td>
				<td style="float: right; padding-right: 50px;"><h1>가입하기</h1>
					<br>
					<h3>회원가입</h3>
					<div id="memberRegistryForm">
						<form action="${pageContext.request.contextPath}/joinus/registerMember" method="post">	 
						<fieldset>
							<legend>기본 계정 정보</legend>
							이메일(name="email")<input type="email" name="email" /><br />
							비밀번호(name="password")<input type="password" name="password" /><br />
						</fieldset>
						
						<fieldset>
							<legend>기본 사용자 정보</legend>
							성(name="lastName")<input type="text" name="lastName" /><br />
							이름(name="firstName")<input type="text" name="firstName" /><br />
						</fieldset>
						
						<fieldset>
							<legend>생년월일</legend>
							<input type="date" name="birthday" />
						</fieldset>
					
						<input type="submit" value="Reg">
						</form>
					</div>
					
					
					<%-- <div>
						<form
							action="${pageContext.request.contextPath}/joinus/registerMember"
							method="post">
							<fieldset>
								<legend>기본 계정 정보</legend>
								이메일:<input type="text" name="email" value="abc@abc.com" /><br />
								비밀번호:<input type="password" name="password" value="1004" /><br />
							</fieldset>

							<fieldset>
								<legend>기본 사용자 정보</legend>
								성:<input type="text" name="lastName" value="Chang" /><br />
								이름:<input type="text" name="firstName" value="Sungsil" /><br />
							</fieldset>

							<fieldset>
								<legend>생년월일</legend>
								년:<input type="text" name="year" value="1985" /><br /> 월: <select
									name="month">
									<c:forEach var="month" begin="1" end="13" step="1">
										<option value="month"
											<c:if test="${month ==7}" >selected="selected"</c:if>>${month}</option>
									</c:forEach>
								</select> <br /> 년:<input type="text" name="date" value="20" /><br />
							</fieldset>
							<fieldset>
								<legend>자동가입방지</legend>
								<%
								ReCaptcha c = ReCaptchaFactory.newReCaptcha("6LedCfgSAAAAANXE1N6vs_WLC0otH2jJkc4cXida", "6LedCfgSAAAAAKFaVC8NM209qL-CFiOWd0C7ICXV", false);
								out.print(c.createRecaptchaHtml(null, null));
								%>
							</fieldset>
							<input type="submit" value="Reg">
						</form>
					</div> --%>
				</td>
			</tr>
		</table>
	</div>
	
	
<!-- 	
	///////////////////////dock 왼쪽//////////////////////////////////////////// 
	<div id="dockContainer">
		<ul id="jqDock" style="display: block;">
			<div
				style="position: relative; margin: 0px; padding: 0px; border: 0px none; background-color: transparent;">
				<div class="jqDock"
					style="position: absolute; top: 0px; left: 0px; padding: 0px; margin: 52px 0px 0px; overflow: visible; height: 480px; width: 48px;">
					<li><div
							style="position: relative; margin: 0px; padding: 0px; border: 0px none; background-color: transparent;">
							<a class="dockItem" href="index.html"
								style="position: relative; border-width: 0px; border-style: none; vertical-align: top; display: block;"><img
								src="img/dock/home-sm.png" alt="" class="jqDockMouse0_0"
								style="position: relative; border-width: 0px; border-style: none; vertical-align: top; display: block; width: 48px; height: 48px; margin-right: 0px;"></a>
						</div></li>
					<li><div
							style="position: relative; margin: 0px; padding: 0px; border: 0px none; background-color: transparent;">
							<a class="dockItem" href="example2.html"
								style="position: relative; border-width: 0px; border-style: none; vertical-align: top; display: block;"><img
								src="img/dock/email-sm.png" alt="" class="jqDockMouse0_1"
								style="position: relative; border-width: 0px; border-style: none; vertical-align: top; display: block; width: 48px; height: 48px; margin-right: 0px;"></a>
						</div></li>
					<li><div
							style="position: relative; margin: 0px; padding: 0px; border: 0px none; background-color: transparent;">
							<a class="dockItem" href="example3.html"
								style="position: relative; border-width: 0px; border-style: none; vertical-align: top; display: block;"><img
								src="img/dock/portfolio-sm.png" alt="" class="jqDockMouse0_2"
								style="position: relative; border-width: 0px; border-style: none; vertical-align: top; display: block; width: 48px; height: 48px; margin-right: 0px;"></a>
						</div></li>
					<li><div
							style="position: relative; margin: 0px; padding: 0px; border: 0px none; background-color: transparent;">
							<a class="dockItem" href="all-examples.html"
								style="position: relative; border-width: 0px; border-style: none; vertical-align: top; display: block;"><img
								src="img/dock/music-sm.png" alt="" class="jqDockMouse0_3"
								style="position: relative; border-width: 0px; border-style: none; vertical-align: top; display: block; width: 48px; height: 48px; margin-right: 0px;"></a>
						</div></li>
					<li><div
							style="position: relative; margin: 0px; padding: 0px; border: 0px none; background-color: transparent;">
							<a class="dockItem" href="#"
								style="position: relative; border-width: 0px; border-style: none; vertical-align: top; display: block;"><img
								src="img/dock/video-sm.png" alt="" class="jqDockMouse0_4"
								style="position: relative; border-width: 0px; border-style: none; vertical-align: top; display: block; width: 48px; height: 48px; margin-right: 0px;"></a>
						</div></li>
					<li><div
							style="position: relative; margin: 0px; padding: 0px; border: 0px none; background-color: transparent;">
							<a class="dockItem" href="#"
								style="position: relative; border-width: 0px; border-style: none; vertical-align: top; display: block;"><img
								src="img/dock/history-sm.png" alt="" class="jqDockMouse0_5"
								style="position: relative; border-width: 0px; border-style: none; vertical-align: top; display: block; width: 48px; height: 48px; margin-right: 0px;"></a>
						</div></li>
					<li><div
							style="position: relative; margin: 0px; padding: 0px; border: 0px none; background-color: transparent;">
							<a class="dockItem" href="#"
								style="position: relative; border-width: 0px; border-style: none; vertical-align: top; display: block;"><img
								src="img/dock/calendar-sm.png" alt="" class="jqDockMouse0_6"
								style="position: relative; border-width: 0px; border-style: none; vertical-align: top; display: block; width: 48px; height: 48px; margin-right: 0px;"></a>
						</div></li>
					<li><div
							style="position: relative; margin: 0px; padding: 0px; border: 0px none; background-color: transparent;">
							<a class="dockItem" href="#"
								style="position: relative; border-width: 0px; border-style: none; vertical-align: top; display: block;"><img
								src="img/dock/link-sm.png" alt="" class="jqDockMouse0_7"
								style="position: relative; border-width: 0px; border-style: none; vertical-align: top; display: block; width: 48px; height: 48px; margin-right: 0px;"></a>
						</div></li>
					<li><div
							style="position: relative; margin: 0px; padding: 0px; border: 0px none; background-color: transparent;">
							<a class="dockItem" href="#"
								style="position: relative; border-width: 0px; border-style: none; vertical-align: top; display: block;"><img
								src="img/dock/rss-sm.png" alt="" class="jqDockMouse0_8"
								style="position: relative; border-width: 0px; border-style: none; vertical-align: top; display: block; width: 48px; height: 48px; margin-right: 0px;"></a>
						</div></li>
					<li><div
							style="position: relative; margin: 0px; padding: 0px; border: 0px none; background-color: transparent;">
							<a class="dockItem" href="#"
								style="position: relative; border-width: 0px; border-style: none; vertical-align: top; display: block;"><img
								src="img/dock/rss2-sm.png" alt="" class="jqDockMouse0_9"
								style="position: relative; border-width: 0px; border-style: none; vertical-align: top; display: block; width: 48px; height: 48px; margin-right: 0px;"></a>
						</div></li>
					<div class="jqDockLabel jqDockMouse0_00 jqDockLabelLink"
						style="position: absolute; margin: 0px; display: none; width: 60px; height: 18px; top: 96px; left: -16px;">Example&nbsp;3</div>
				</div>
			</div>
		</ul>
	</div>
	//////////////////////dock 아래쪽////////////////////////////////////////////// 
	<div id="dock">
		<div class="dock-container" style="left: 503px; width: 500px;">
			<a class="dock-item" href="index.html" style="width: 50px; left: 0px;"><span style="display: none;">Example&nbsp;1</span><img src="img/dock/home.png" alt="home"></a> 
			<a class="dock-item" href="example2.html" style="width: 50px; left: 50px;"><span style="display: none;">Example&nbsp;2</span><img src="img/dock/email.png" alt="contact"></a> 
			<a class="dock-item" href="example3.html" style="width: 50px; left: 100px;"><span style="display: none;">Example&nbsp;3</span><img src="img/dock/portfolio.png" alt="portfolio"></a> 
			<a class="dock-item" href="all-examples.html" style="width: 50px; left: 150px;"><span style="display: none;">All&nbsp;Examples</span><img src="img/dock/music.png" alt="music"></a> 
			<a class="dock-item" href="#" style="width: 50px; left: 200px;"><span style="display: none;">Video</span><img src="img/dock/video.png" alt="video"></a> 
			<a class="dock-item" href="#" style="width: 50px; left: 250px;"><span style="display: none;">History</span><img src="img/dock/history.png" alt="history"></a> 
			<a class="dock-item" href="#" style="width: 50px; left: 300px;"><span style="display: none;">Calendar</span><img src="img/dock/calendar.png" alt="calendar"></a> 
			<a class="dock-item" href="#" style="width: 50px; left: 350px;"><span style="display: none;">Links</span><img src="img/dock/link.png" alt="links"></a> 
			<a class="dock-item" href="#" style="width: 50px; left: 400px;"><span style="display: none;">RSS</span><img src="img/dock/rss.png" alt="rss"></a> 
			<a class="dock-item" href="#" style="width: 50px; left: 450px;"><span style="display: none;">RSS2</span><img src="img/dock/rss2.png" alt="rss"></a> 
		</div>end div .dock-container
	</div>
	//////////////////////////////////////////////////////////////////////////////// 

 -->
	
	
	<!--  -->
	<%-- <h3>회원가입</h3>
	<div id="memberRegistryForm">
		<form action="${pageContext.request.contextPath}/joinus/registerMember" method="post">	 
		<fieldset>
			<legend>기본 계정 정보</legend>
			이메일(name="email")<input type="email" name="email" /><br />
			비밀번호(name="password")<input type="password" name="password" /><br />
		</fieldset>
		
		<fieldset>
			<legend>기본 사용자 정보</legend>
			성(name="lastName")<input type="text" name="lastName" /><br />
			이름(name="firstName")<input type="text" name="firstName" /><br />
		</fieldset>
		
		<fieldset>
			<legend>생년월일</legend>
			<input type="date" name="birthday" />
		</fieldset>
	
		<input type="submit" value="Reg">
		</form>
	</div>
	<hr />
	<br />
	<h3>로그인</h3>
	<div>
		<form action="${pageContext.request.contextPath}/security" method="post">
			<fieldset>
				<legend>로그인 정보</legend>
				이메일(name="email")<input type="email" name="email" /><br />
				비밀번호(name="password")<input type="password" name="password" /><br />
			</fieldset>
			<input type="submit" value="Login" />
		</form>
	</div>
	<hr />
	<br />
	<h3>아이디/비밀번호 찾기</h3>
	<div>
		<a href="${pageContext.request.contextPath}/joinus/refind"></a>
	</div> --%>
</section>

<!-- 푸터 없어도 됨 -->
<div id="footer">
	<table style="width: 960px;">
	</table>
</div>