<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="setting.jsp" %>
   <script src="${project}member/script.js"></script>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <style type="text/css">
div #a{
margin-left:15%;}
</style>
   
   <div class="col-md-12">
        <div class="page-header">
           <h1 align="center"> ${page_login} <small>LetsBand</small></h1>
        </div>
        <form class="form-horizontal" method="post" name="mainform" action="Band_Logon_loginPro.do" onsubmit="return maincheck()">
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputId" id="a">${str_id}</label>
        <div class="col-sm-2">
          <input type="text" class="form-control" name="id"  placeholder="아이디" autofocus>
        </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputPassword" id="a">${str_passwd}</label>
        <div class="col-sm-2">
          <input type="password" class="form-control" name="passwd" placeholder="비밀번호">
      </div>
      <br>
      <br>
      <br>
      <div class="form-group">
          <div class="col-sm-12 text-center">
            <button class="btn btn-primary" type="submit">로그인</button>
            <button class="btn btn-primary" type="reset" onclick="location='BandBoard_main.do'">로그인 취소</button>
          </div>
        </div>
        </div>
        </form>
        </div>