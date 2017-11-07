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

<body>

<jsp:include page="header.jsp" flush="false"/>

<jsp:include page="menu.jsp" flush="false"/>

<div class="container">
   <div class="bg-faded p-4 my-4">
   
<h2>${page_content}</h2>
<form method="post" action="BandBoard_replyInsert.do">
<table width="700" border="1">
   <tr>
      <th> ${str_subject} </th>
      <td colspan="3">
         &nbsp;&nbsp;&nbsp;&nbsp;${boardDto.subject}
      </td>
   </tr>
   <tr>
      <th style="width:5%"> ${str_writer} </th>
      <td style="width:10%" align="center"> 
         ${boardDto.a_id }${boardDto.m_id }
      </td>
      <th> ${str_reg_date} </th>
      <td colspan="3" align="center">
         <fmt:formatDate value="${boardDto.reg_date}" 
            type="both" pattern="yyyy-MM-dd HH:mm"/>
      </td>
   </tr>

   <tr>
      <th > ${str_img} </th>
      <td ></td>
      <th style="width:5%"> ${str_readcount} </th>
      <td style="width:10%" align='center'> ${boardDto.readcount} </td>
   </tr>
   <tr>
      <th> ${str_content} </th>
      <td colspan="3">
         <pre>&nbsp;&nbsp;&nbsp;&nbsp;${boardDto.content}</pre>
      </td>
   </tr>   
   <c:if test="${result == 1}">
      <tr>
      <th> ${btn_reply} </th>
      <td colspan="3">
         <table>
         <c:forEach var="reply" items="${replys}">
            <tr>
               <td align="letf"> ${reply.m_id} ${reply.a_id} </td>
               <td align="letf" > ${reply.reply} </td>
               <td align="right" > <fmt:formatDate value="${reply.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm"/> </td>
               <td> <input type="button" name="re_mod" value="${btn_mod}" onclick="location=''"> </td>
               <td> <input type="button" name="re_del" value="${btn_del}" onclick="location=''"> </td>
            </tr>
         </c:forEach>
         </table>
      </td>
   </tr>
    </c:if>
    
   <tr>
      <th> ${btn_reply} </th>
      <td colspan="2" align="center">
         <textarea rows="3" cols="110" style="resize:none;" name="reply"></textarea>
         <input type="hidden" name="m_id" value="${sessionScope.memId}"/>
         <input type="hidden" name="a_id" value="${sessionScope.adId}"/>
         <input type="hidden" name="num" value="${num}"/>
         <input type="hidden" name="pageNum" value="${pageNum}"/>
      </td>
      <td align="center">
         <input type="submit" value="${btn_reply}" >
      </td>
   </tr>
</table>
</form>

<!-- 작성자 == 사용자 -->
<c:if test="${sessionScope.memId == boardDto.m_id}">
 <tr>
      <th colspan='3'>
         <input class='inputbutton' type='button' value="${btn_modify}"
            onclick="location='BandBoard_contentModifyForm.do?num=${boardDto.num}'">      
          <input class='inputbutton' type='button' value="${btn_delete}"
            onclick="location='BandBoard_contentDeletePro.do?num=${boardDto.num}'">
         <input class='inputbutton' type='button' value="${btn_list}"
            onclick="location='BandBoard_gatherPro.do?pageNum=${pageNum}'">
      </th>
</tr>
</c:if>
<br><br><br><br><br>

<!-- 작성자 != 사용자 -->
<c:if test="${sessionScope.memId != null or SessionScope.memId == ''}">
   <c:if test="${boardDto.m_id != sessionScope.memId}">
    <tr>
         <th colspan='3'>
            <input class='inputbutton' type='button' value="${btn_list}"
               onclick="location='BandBoard_gatherPro.do?pageNum=${pageNum}'">
         </th>
   </tr>
   </c:if>
</c:if>
<!-- 관리자 -->
<c:if test="${sessionScope.adId != null}">
 <tr>
      <th colspan='2'>
         <input class='inputbutton' type='button' value="${btn_delete}"
            onclick="location='BandBoard_contentDeletePro.do?num=${boardDto.num}'">
         <input class='inputbutton' type='button' value="${btn_list}"
            onclick="location='BandBoard_gatherPro.do?pageNum=${pageNum}'">
      </th>
   </tr>
</c:if>

   </div>
</div>

<jsp:include page="footer.jsp" flush="false"/>
   
 <!-- Bootstrap core JavaScript -->
    <script src="${project}board/vendor/jquery/jquery.min.js"></script>
    <script src="${project}board/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

   </body>
   </html>