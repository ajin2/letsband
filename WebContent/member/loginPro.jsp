<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	 <%@ include file="setting.jsp" %>
	<script src="${project}member/script.js"></script>
	
    <h2> ${page_login} </h2>
    	
    	<!-- // 비밀번호가 같은가 다른가만 확인 -->
    	
    	<c:if test="${result == 1}">
    		<!--  아이디가 있음 + 비밀번호 맞음 -->
    		${sessionScope.memId = id}
    		<c:redirect url="BandBoard_main.do"/>
    	</c:if> 
    	
    	<c:if test="${aresult == 1}">
    		<!--  아이디가 있음 + 비밀번호 맞음 -->
    		${sessionScope.adId = id}
    		<c:redirect url="BandBoard_main.do"/>
    	</c:if> 
    	
    	<c:if test="${result == -1 or aresult == -1}">
    		<!-- 아이디가 있음 + 비밀번호 틀림 --> 
    		<script type="text/javascript">
    		<!--
    			erroralert(loginpasserror);
    		//-->
    		</script>
    	</c:if>
    	
    	<c:if test="${result == 0 or aresult == 0}">
    		<!-- 아이디가 없음  --> 
    		<script type="text/javascript">
    		<!--
    			erroralert(loginiderror);
    		//-->
    		</script>
    	</c:if>
