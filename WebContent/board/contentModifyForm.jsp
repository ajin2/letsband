<html lang="en">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDBBean"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<%@ include file="setting.jsp" %>

    <title>LetsBand</title>
<script src="${project}board/script.js"></script>
    <link href="${project}board/style.css" rel="stylesheet" type="text/css">


	<!-- Bootstrap core CSS -->
    <link href="${project}board/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

	<!-- 게시판 폼 -->
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>	

<body onload="gatherwritefocus()"/>

<jsp:include page="header.jsp" flush="false"/>

<jsp:include page="menu.jsp" flush="false"/>

<div class="container">
	<div class="bg-faded p-4 my-4">

<!-- if session died -->
<c:if test="${(sessionScope.memId == null or sessionScope.memId == '') 
      and (sessionScope.adId == null or sessionScope.memId == '')}">
   <c:redirect url="BandBoard_gatherForm.do?pageNum=${pageNum}"/>
</c:if>

<c:if test="${(sessionScope.memId != null) or (sessionScope.adId != null)}">
   <div class="container">

      <form method="post" action="BandBoard_contentModifyPro.do" name="gathermodifyform" 
         onsubmit="return gathermodifycheck()">
   
         <input type="hidden" name="num" value="${num}">
         <input type="hidden" name="pageNum" value="${pageNum}">
         <input type="hidden" name="value" value="1">
         <h2>${page_modify}</h2>
   
         <div class="form-group">
            <label for="subject">${str_writer}</label> &nbsp;
         <c:if test="${sessionScope.memId != null or sessionScope.memId != ''}">
              ${sessionScope.memId}   
           </c:if>
         <c:if test="${sessionScope.adId != null or sessionScope.adId != ''}">
              ${sessionScope.adId}   
           </c:if>
         </div>
         
         <div class="form-group">
            <label for="subject">${str_subject}</label> 
            <input type="text" class="form-control" id="subject" name="subject" 
               value="${boardDto.subject}">
         </div>
            
         <div class="form-group">
            <label for="content">${str_content}</label>
            <textarea class="form-control" id="content" name="content" 
               value="${boardDto.content}" rows="3"></textarea>
         </div>
         
         <!-- ToDo -->
         <label for="subject">첨부파일</label> 
         <input type="file" class="form-control" id="load1" name="load1" value="">
         <br>
         
         <!-- Daum 지도 API -->
         <div class="form-group">
            <label for="subject">${str_location}</label> 
            <input type="text" class="form-control" id="location" name="location" 
               value="${boardDto.location}">
         </div>
         
         <button type="submit" class="btn btn-primary">${btn_modify}</button>
         <button type="reset" class="btn btn-primary">${btn_cancel}</button>
         <button type="button" class="btn btn-primary" onclick="location='BandBoard_gatherPro.do?pageNum=${pageNum}'">${btn_back}</button>
      </form>
 
   </div>
</c:if>

   </div>
</div>

<jsp:include page="footer.jsp" flush="false"/>
   
 <!-- Bootstrap core JavaScript -->
    <script src="${project}board/vendor/jquery/jquery.min.js"></script>
    <script src="${project}board/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	</body>
	</html>