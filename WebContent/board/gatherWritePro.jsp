<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="setting.jsp" %>
<script src="${project}board/script.js"></script>

<h2> gatherWritePro </h2>

<c:if test="${result == 0}">
result == 0
	<script type="text/javascript">
		
		erroralert(modifyerror);
		
	</script>
	<meta http-equiv="refresh" content="0; BandBoard_gatherForm.do?pageNum=${pageNum}">
</c:if>
<c:if test="${result == 1}">
	<!-- memId -->
	<c:if test="${sessionScope.memId != null}">
		<c:redirect url="BandBoard_gatherForm.do"/>
	</c:if>
	
	<!-- adminId -->
	<c:if test="${sessionScope.adId != null}">
		<c:redirect url="BandBoard_gatherForm.do"/>
	</c:if>
</c:if>
<!-- null -->
<c:if test="${(sessionScope.memId == null or sessionScope.memId == '')
	and (sessionScope.adId == null or sessionScope.adId == '')}">
null 값
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
