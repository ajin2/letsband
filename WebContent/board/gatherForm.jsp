<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="setting.jsp" %>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<jsp:include page="header.jsp" flush="false"/>
<jsp:include page="menu.jsp" flush="false"/>

<!-- value = 1 = 밴드모집 게시판 -->
<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
${page_gather} (${str_count} : ${count}) </h2>

<div class="container">
      <div class="row">
         <div class="panel panel-primary">
            <div class="panel-heading">
               <h3 class="panel-title">
                  <span class="glyphicon glyphicon-tag"></span> 
                     &nbsp;&nbsp;밴드모집
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <a href="BandBoard_gatherWritePro.do">글쓰기</a>
               </h3>
            </div>
            <div>
               <table class="table table-hover">
                  <thead>
                     <tr>
                        <th class="text-center">${str_num}</th>
                        <th class="text-center">${str_writer}</th>
                        <th class="text-center">${str_subject}</th>
                        <th class="text-center">${str_reg_date}</th>
                        <th class="text-center">${str_readcount}</th>
                     </tr>
                  </thead>
                  <tbody>
                  <c:if test="${count == 0}">
                     <tr>
                        <td colspan="5" align="center">${msg_list_x}</td>
                     </tr>
                  </c:if>
                  <c:if test="${count != 0}">
      <c:forEach var="article" items="${articles}">
      <tr>
         <td align="center">
            ${number+1}
            <c:set var="number" value="${number - 1 }"/>
         </td>
         <td align="center">
            <c:if test="${article.a_id == null or article.a_id == ''}">
            ${article.m_id}
            </c:if>
            <c:if test="${article.m_id == null or article.m_id == ''}">
            ${article.a_id}
            </c:if>            
         </td>
         <td>
            <a href="BandBoard_gatherContent.do?num=${article.num}&pageNum=${pageNum}">
            ${article.subject}</a>
         </td>
         <td align="center">
            <fmt:formatDate value="${article.reg_date}"
                  type="both" pattern="yyyy-MM-dd HH:mm"/>
         </td>
         <td align="center">
            ${article.readcount}
         </td>
      </tr>
      </c:forEach>
   </c:if>
</table>

   		<a href="BandBoard_gatherWritePro.do">글쓰기</a>
   
<br>
<c:if test="${count > 0 }">
   <c:if test="${startPage > pageBlock }">
      <a href="BandBoard_gatherForm.do">[처음]</a>
      <a href="BandBoard_gatherForm.do?pageNum=${startPage-pageBlock}">[이전]</a>
   </c:if>
   <c:forEach var="i" begin="${startPage}" end="${endPage}">
      <c:if test="${i == currentPage}">
         <b>[${i}]</b>
      </c:if>
      <c:if test="${i != currentPage}">
         <a href="BandBoard_gatherForm.do?pageNum=${i}">[${i}]</a>
      </c:if>
   </c:forEach>
   <c:if test="${pageCount > endPage}">
      <a href="BandBoard_gatherForm.do?pageNum=${startPage + pageBlock}">[다음]</a>
      <a href="BandBoard_gatherForm.do?pageNum=${pageCount}">[끝]</a>
   </c:if>
</c:if>
<table style="border-style: none; width: 1135px">
   <tr align="right">
      <td style="border-style: none">
         <select name="select" style="height: 30px">
            <option value="제목+내용"> 제목+내용 </option>
            <option value="제목만"> 제목만 </option>
            <option value="작성자"> 작성자 </option>
         </select>
         <input class="input" type="text" name="search" style="width: 150px">
         <input class="inputbutton" type="submit" value="검색" onclick="location='qnaSearch.jsp'">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
      </td>
   </tr>
                  
               </tbody>
               </table>
            </div>
         </div>         
      </div>
   </div>

<jsp:include page="footer.jsp" flush="false"/>