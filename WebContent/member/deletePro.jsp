<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <%@ include file="setting.jsp" %>
	<script src="${project}member/script.js"></script>

    <h2> ${page_delete} </h2><hr>
  	
  		<c:if test="${resultCheck == 1}">
    		<!-- // 비밀번호 맞음  -->
    		<c:if test="${result == 0}">
    			<!-- // 삭제 실패 -->
        		<script type="text/javascript">
        		<!--
        			erroralert(deleteerror);
        		//-->
        		</script>
    		</c:if>
    		<c:if test="${result == 1}">
    			<!-- // 삭제 성공 -->
    			${sessionScope.memId = null}
    			<c:redirect url="BandBoard_main.do" />
    		</c:if>
    	</c:if>
    	
    	<c:if test="${resultCheck == -1}">
    		<!-- // 비밀번호 틀림 -->
    		<script type="text/javascript">
    		<!--
    			erroralert(loginpasserror);
    		//-->
    		</script>
		</c:if>    	
