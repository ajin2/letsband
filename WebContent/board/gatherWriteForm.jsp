<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
   <%@ include file="setting.jsp" %>
<%@ include file="setting.jsp" %>
<jsp:include page="header.jsp" flush="false"/>
<jsp:include page="menu.jsp" flush="false"/>

   <script src="${project}board/script.js"></script>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<div class="container">
    <form action="" method="post">

    <h2>${page_write }</h2>

      <div class="form-group">
        <label for="subject">${str_writer}</label>
        &nbsp;${memberDto.id}	
      </div>
      <div class="form-group">
        <label for="subject">${str_subject}</label>
        <input type="text" class="form-control" id="subject" name="subject" value="">
      </div>
      <div class="form-group">
        <label for="content">${str_content}</label>
        <textarea class="form-control" id="content" name="content" rows="3"></textarea>
      </div>
      <label for="subject">첨부파일</label>
        
        <input type="file" class="form-control" id="laod" name="load" value="">
      <!--<input type="hidden" name="bno" value=""/> --><br>
      <button type="submit" class="btn btn-primary">글쓰기</button>
      <button type="reset" class="btn btn-primary">${btn_cancel}</button>

    </form>
</div>