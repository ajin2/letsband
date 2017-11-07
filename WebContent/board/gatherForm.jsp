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

<!-- value = 1 = 밴드모집 게시판 -->
<h2> ${page_gather} (${str_count} : ${count}) </h2>

     
         <div class="panel panel-primary">
            <div class="panel-heading">
             <div class="row">
               <h3 class="panel-title">
                  <span class="glyphicon glyphicon-tag"></span> 
                     &nbsp;&nbsp;밴드모집
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;&nbsp;
                     <a href="BandBoard_gatherWriteForm.do">글쓰기</a>
               </h3>
            </div>
            <div>
               <table class="table table-striped">
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
								<td colspan="6" align="center">${msg_list_x}</td>
							</tr>
						</c:if>
						<c:if test="${count != 0}">
							<c:forEach var="article" items="${articles}">
								<tr>
									<td align="center">${number} 
									<c:set var="number" value="${number - 1 }" />
									</td>
									<td align="center">
										<c:if test="${article.a_id == null or article.a_id == ''}">
							            ${article.m_id}
							            </c:if> 
							            <c:if test="${article.m_id == null or article.m_id == ''}">
							            ${article.a_id}
							            </c:if>
									</td>
									<td align="center">
										<a href="BandBoard_gatherContent.do?num=${article.num}&pageNum=${pageNum}">
											${article.subject}</a> &nbsp;&nbsp;&nbsp; 
											<!-- 댓글 갯수 아직 미구현 -->
											<%-- ${article.replycount} --%>
									</td>
									<td align="center">
									<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
									</td>
									<td align="center">${article.readcount}</td>
								
									<c:if test="${sessionScope.adId != null }">
									<td>
										<input class="inputbutton" type="button" value="${btn_del}"
											onclick="location='BandBoard_contentDeletePro.do?num=${article.num}'">
									</td>
									</c:if>
								</tr>
							</c:forEach>
						</c:if>
				</table>                 


<c:if test="${count > 0 }">
					<c:if test="${startPage > pageBlock }" >
						<a href="BandBoard_gatherForm.do">[처음]</a>
						<a href="BandBoard_gatherForm.do?pageNum=${startPage-pageBlock}">[이전]</a>
					</c:if>
					
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<b>[${i}]</b>
						</c:if>
						
						<c:if test="${i != currentPage}">
							<a href="BandBoard_gatherForm.do?pageNum=${i}" >[${i}]</a>
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
							<option value="제목+내용">제목+내용</option>
							<option value="제목만">제목만</option>
							<option value="작성자">작성자</option>
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
</div>

<jsp:include page="footer.jsp" flush="false"/>
   
 <!-- Bootstrap core JavaScript -->
    <script src="${project}board/vendor/jquery/jquery.min.js"></script>
    <script src="${project}board/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	</body>
	</html>
