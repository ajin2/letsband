<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="setting.jsp" %>
<script src="${project}board/script.js"></script>

<h2> gatherWritePro </h2>

<!-- memId -->
<c:if test="${sessionScope.memId != null}">
	<c:redirect url="BandBoard_gatherWritePro.do"/>
</c:if>

<!-- adminId -->
<c:if test="${sessionScope.adminId != null}">
	<c:redirect url="BandBoard_gatherWritePro.do"/>
</c:if>

<!-- null -->
<c:if test="${sessionScope.memId == null or sessionScope.memId == ''
	or sessionScope.adminId == null or sessionScope.adminId == ''}">
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
