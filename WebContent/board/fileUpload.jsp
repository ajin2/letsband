<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<%@ include file="setting.jsp" %>
	<script src="${project}board/script.js"></script>
	
	<jsp:include page="header.jsp" flush="false"/>
	
	<jsp:include page="menu.jsp" flush="false"/>
	
	<h2> 파일업로드 - 처리 페이지 </h2>
	
	경로 : ${path} <br>
	
	파일이름 1 : ${originName1} <br>
	저장이름 1 : ${systemName1} <br>
	<br>
	
	<h2> 파일 다운로드 </h2>
	
	파일 : <a href="BandBoard_fileDownload.do?originName=${originName11}&systemName=${systemName11}">
			${originName1}</a> <br>
















