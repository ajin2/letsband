<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <%@ include file="setting.jsp" %>
	<link href="${project}member/style.css" rel="stylesheet" type="text/css">
	<script src="${project}member/script.js"></script>
	
	<h2> ${page_modify}</h2><hr>
	
		<c:if test="${result == 0}">
    		<script type="text/javascript">
    		<!--
    			alert(moderror);
    		//-->
    		</script>
    		<meta http-equiv="refresh" content="0; url=BandBoard_main.do"/>
    	</c:if>
    	<c:if test="${result == 1}">
    		${sessionScope.memId = null} 
    		<c:redirect url="BandBoard_main.do" />
    	</c:if>
 