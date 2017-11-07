<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="setting.jsp" %>
<script src="${project}board/script.js"></script>

	<c:if test="${result == 0}">
		<script type="text/javascript">
    	<!--
    		erroralert(replyerror);
    	//-->
    	</script>
    </c:if>
    
    <c:if test="${result == 1}">
    	<c:redirect url="BandBoard_gatherContent.do?num=${num}&pageNum=${pageNum}" />
    </c:if>