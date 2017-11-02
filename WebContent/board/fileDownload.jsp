<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.net.URLDecoder"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<%@ include file="setting.jsp" %>
	<script src="${project}board/script.js"></script>
	
	<jsp:include page="header.jsp" flush="false"/>
	
	<jsp:include page="menu.jsp" flush="false"/>


<h2> 파일 다운로드 </h2>

파일이름 : ${originName} <br>
저장이름 : ${systemName} <br>

