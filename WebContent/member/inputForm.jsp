<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@ include file="setting.jsp" %>
   <script src="${project}member/script.js"></script>
   
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   
       <style type="text/css">
			div #a{
			margin-left:13%;}
		</style>
		
    <body onload="inputfocus()">
   
        <div class="col-md-12">
        <div class="page-header">
           <h1 align="center">${page_input}<small>LetsBand</small></h1>
        </div>
        
        <form class="form-horizontal" method="post" action="Band_Logon_inputPro.do" name="inputform" onsubmit="return inputcheck()">
       <input type="hidden" name="confirm" value="0">
       <input type="hidden" name="emailconfirm_value" value="0">
   
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputId" id="a">*${str_id}</label>
              <div class="col-sm-3">
                <div class="input-group">
                  <input type="text" class="form-control" name="id" placeholder="아이디" />
                  <span class="input-group-btn">
                    <button class="btn btn-primary" type="button" name="confirmbtn" onclick="confirmid()">${btn_confirm}<i class="fa fa-mail-forward spaceLeft"></i></button>
                  </span>
                </div>
              </div>
        </div>
        
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputPassword" id="a">*${str_passwd}</label>
        <div class="col-sm-3">
          <input class="form-control" name="passwd" type="password" placeholder="비밀번호">
        </div>
        </div>
        
          <div class="form-group">
              <label class="col-sm-3 control-label" for="inputPasswordCheck" id="a"></label>
             <div class="col-sm-3">
              <input class="form-control" type="password" name="repasswd" placeholder="비밀번호 확인">
                <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
             </div>
          </div>
          
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName" id="a">*${str_name}</label>
          <div class="col-sm-3">
            <input class="form-control" type="text" name="name" placeholder="이름">
          </div>
        </div>
        
         <div class="form-group">
            <label class="col-sm-3 control-label" for="inputpostcode" id="a">*${str_postcode}</label>
              <div class="col-sm-3">
                <div class="input-group">
                  <input class="form-control" type="text" id="sample2_postcode" name="postcode" placeholder="우편번호" readonly style="width:200px">
                  <span class="input-group-btn">
                    <button class="btn btn-primary" type="button" onclick="sample2_execDaumPostcode()">우편번호 찾기<i class="fa fa-mail-forward spaceLeft"></i></button>
                  </span>
                </div>
              </div>
        </div>
        
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputpostcode" id="a"></label>
        <div class="col-sm-3">
          <input class="form-control" type="text" id="sample2_address" name="address" placeholder="주소" readonly style="width:390px">
        </div>
        </div>
        
         <div id="layer" style="display:none;position:absolute;right:-3px;top:-3px;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
       <img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" 
                style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
         </div>
          <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
                  <script>
                      // 우편번호 찾기 화면을 넣을 element
                      var element_layer = document.getElementById('layer');
                  </script>
        
          <div class="form-group">
              <label class="col-sm-3 control-label" for="inputpostcode" id="a">${str_detail_add}</label>
             <div class="col-sm-3">
              <input class="form-control" type="text" name="detail_add" style="width:390px" placeholder="상세주소">
             </div>
          </div>
        
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputEmail" id="a">${str_email} </label>
              <div class="col-sm-3">
                <div class="input-group">
                  <input class="form-control" type="text" name="email1" placeholder="이메일" style="width:130px">
                   <label class="col-sm-0 control-label" for="inputEmail" >@ </label> 
					
                   <select class="custom-select" name="email2" style="width:130px">
                  <option value="0"> 직접입력 </option>
                      <option value="naver.com"> 네이버 </option>
                      <option value="daum.net"> 다음 </option>
                      <option value="gmail.com"> 구글 </option>
                      <option value="nate.com"> 네이트 </option>
                 </select> 
                               
                  <span class="input-group-btn">
                    <button class="btn btn-primary" type="button" name="emailconfirm"
                   onclick="emailcheck(inputform.email1.value, inputform.email2.value, 0)">${btn_email}<i class="fa fa-mail-forward spaceLeft"></i></button>
                  </span>
                </div>
              </div>
        </div>

        <div class="form-group">
          <div class="col-sm-12 text-center">
            <button class="btn btn-primary" type="submit">${btn_in}<i class="fa fa-check spaceLeft"></i></button>
             <button class="btn btn-primary" type="reset">${btn_cancel}<i class="fa fa-check spaceLeft"></i></button>
            <button class="btn btn-primary" type="reset" onclick="location='BandBoard_main.do'">${btn_in_cancel}<i class="fa fa-times spaceLeft"></i></button>
          </div>
        </div>
   
        </form>
       <hr>
 </div>

    