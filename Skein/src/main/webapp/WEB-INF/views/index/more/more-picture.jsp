<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 

<c:forEach var="list" items="${list}">
   <c:if test="${list.fileName!= null}">
      <div class="list"
         style="border-radius: 6px 6px 6px 6px; width: 174px; height: 174px;">
         <div class="img-list">
            <img src="${pageContext.request.contextPath}/resources/upload/${list.fileName}"
               style="width: 155px; height: 155px;">
         </div>
      </div>
   </c:if>
</c:forEach> 
 