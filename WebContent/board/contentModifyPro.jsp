<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="setting.jsp" %>
<script src="${project}board/script.js"></script>


<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		erroralert(modifyerror);
		//-->
	</script>
	<meta http-equiv="refresh" content="0; BandBoard_contentModifyForm.do?num=${num}">
</c:if>

<c:if test="${result == 1}">
	<!-- memId and adId -->
	<c:if test="${sessionScope.memId != null or sessionScope.adId != null}">
		<c:redirect url="BandBoard_gatherContent.do?num=${num}&pageNum=${pageNum}"/>
	</c:if>
</c:if>

<!-- null -->
<c:if test="${(sessionScope.memId == null or sessionScope.memId == '')
	and (sessionScope.adId == null or sessionScope.adId == '')}">
	<script type="text/javascript">
        <!--
           var returnValue = confirm(loginpleaseerror);
           if(returnValue == true){
              window.location.href = "BandBoard_main.do";
           } else {
              window.location.href = "BandBoard_main.do";
           }
        -->
        </script>
</c:if>

 
   