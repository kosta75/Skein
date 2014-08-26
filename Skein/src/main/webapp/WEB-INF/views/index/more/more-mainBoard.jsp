<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="list" items="${groupList}" varStatus="groupStep">

	<%-- <c:forEach var="list" items="${boardList}"> --%>
	<div id="group-item-container" class="group-item-container">
		<%-- ${groupStep.count} 번째 그룹 <br /> --%>
		<div id="list" style="border-radius: 6px 6px 6px 6px;">


			<div style="float: left;">
				<img
					src="${pageContext.request.contextPath}/resources/media/image/20100107221109605_2R2EJLGPV_raw.jpg"
					style="width: 50px; height: 50px;">
			</div>

			<div style="float: left;">
				${list.fullName}<br> ${list.writeDate}
			</div>
			<div class="share" style="float: right;">
				<input type="hidden" value="${list.groupSeq}"
					id="boardSeq${list.boardSeq}"> 공유하기
			</div>
			<div style="clear: both;">
				${list.content}
				<c:if test="${list.fileName != null}">
					<div id="modal-launcher" class="boardSeq" data-boardSeq="${list.boardSeq}">
						<div id="imghover" >
								<input type="hidden" value="${list.groupSeq}"id="boardSeq${list.boardSeq}" > <img
								id="imghover${list.boardSeq}"
								src="${pageContext.request.contextPath}/resources/upload/${list.fileName}"
								style="width: 100%; height: 250px;">
						</div>
					</div>
				</c:if>
			</div>
		</div>
					<div class="replyList">
								
			<c:forEach items="${list.replyList}" var="replyList">
			<div class="replyMainList bubble" >
			<div style=" background: #fff">${replyList.fullName}<br> ${replyList.replyContent}</div>
			
			
			
			</div>
			</c:forEach>  
						
							</div>
						<div id="reply"
							style="background: #e4e4e4; width: 99%; height: 50px; border: 1px solid; border-color: #e4e4e4;">
							
								<div style="float: left; padding: 5px; padding-left: 10px;">
									<img
										src="${pageContext.request.contextPath}/resources/media/image/20100107221109605_2R2EJLGPV_raw.jpg"
										style="width: 35px; height: 35px;">
										<input type="hidden" value="${list.boardSeq}" id="boardSeq"
											name="boardSeq"> <input name="replyWrite" class="replyWrite" type="text"
											style="width: 480px; height: 20px;">
								
									</div>
									
							</div>
	</div>

	<%-- </c:forEach> --%>

</c:forEach>