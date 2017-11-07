<%@page import="java.text.SimpleDateFormat"%>
<%@page import="member.LogonDataBean"%>
<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <%@ include file="setting.jsp" %>
   <link href="${project}member/style.css" rel="stylesheet" type="text/css">
   <script src="${project}member/script.js"></script>
   
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   
    <style type="text/css">
         div #a{
         margin-left:13%;}
      </style>
     
   
<c:if test="${result == 1}">
   <!-- // 비밀번호가 같다 -->
      <body onload="viewfocus()">
         <div class="page-header">
            <h1 align="center"> ${page_modify} <small> LetsBand </small> </h1>
         </div>
         <form class="form-horizontal" name="viewform" method="post" action="Band_Logon_modifyPro.do" onsubmit="return viewcheck('${viewemail1}','${viewemail2}')">
            <input type="hidden" name="emailconfirm_value" value="-1">
         <div class="form-group">
            <label class="col-sm-3 control-label" for="inputId" id="a">${str_id}</label>
              <div class="col-sm-3">     
                  <input style="width:200px" type="text" class="form-control" name="id" value="${memberDto.m_id}" readonly>
                </div>
              </div>
        
        
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputPassword" id="a">${str_passwd}</label>
        <div class="col-sm-3">
          <input class="form-control" name="passwd" type="password" placeholder="비밀번호" value="${memberDto.passwd}">
        </div>
        </div>
        
          <div class="form-group">
              <label class="col-sm-3 control-label" for="inputPasswordCheck" id="a"></label>
             <div class="col-sm-3">
              <input class="form-control" type="password" name="repasswd" placeholder="비밀번호 확인" value="${memberDto.passwd}">
                <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
             </div>
          </div>
          
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName" id="a">${str_name}</label>
          <div class="col-sm-3">
            <input class="form-control" type="text" name="name" placeholder="이름" readonly value="${memberDto.name}">
          </div>
        </div>
        
         <div class="form-group">
            <label class="col-sm-3 control-label" for="inputpostcode" id="a">${str_postcode}</label>
              <div class="col-sm-3">
                <div class="input-group">
                  <input class="form-control" type="text" id="sample2_postcode" name="postcode" placeholder="우편번호" readonly style="width:200px" value="${memberDto.postcode}">
                  <span class="input-group-btn">
                    <button class="btn btn-primary" type="button" onclick="sample2_execDaumPostcode()">우편번호 찾기<i class="fa fa-mail-forward spaceLeft"></i></button>
                  </span>
                </div>
              </div>
        </div>
        
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputpostcode" id="a"></label>
        <div class="col-sm-3">
          <input class="form-control" type="text" id="sample2_address" name="address" placeholder="주소" readonly style="width:360px" value="${memberDto.address}">
        </div>
        </div>
        
         <div id="layer" style="display:none; position:fixed; overflow:hidden; z-index:1; -webkit-overflow-scrolling:touch;">
       <img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" 
                style="cursor:pointer; position:absolute; right:-3px; top:-3px; z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
         </div>
          <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
                  <script>
                      // 우편번호 찾기 화면을 넣을 element
                      var element_layer = document.getElementById('layer');
                  </script>
        
          <div class="form-group">
              <label class="col-sm-3 control-label" for="inputpostcode" id="a">${str_detail_add}</label>
             <div class="col-sm-3">
              <input class="form-control" type="text" name="detail_add" style="width:360px" placeholder="상세주소" value="${memberDto.detail_add}">
             </div>
          </div>
        
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputEmail" id="a">${str_email} </label>
              <div class="col-sm-3">
              <div class="input-group">
              
                           <c:if test="${memberDto.email == null || memberDto.email == ''}">
                                
                                 <input type="text" class="form-control" name="email1" style="width:130px" > 
                                 <input type="text" class="form-control" value ="@" name="email2" style="width:130px"> 

                           </c:if>   
                                           
                           <c:if test="${memberDto.email != null && memberDto.email != ''}">
                              <c:set var="e" value="${fn:split(memberDto.email, '@')}"/>
                                 <input class="form-control" type="text" name="email1"  style="width:130px" value="${e[0]}">
                                 <input class="form-control" type="text" readonly name="@"  style="width:40px" value="@">
                                 <input class="form-control" type="text" name="email2" style="width:130px" value="${e[1]}">
                                 <span class="input-group-btn">
				                  <button class="btn btn-primary" type="button" name="emailconfirm"
				                   onclick="emailcheck(viewform.email1.value,viewform.email2.value,1)">${btn_email}<i class="fa fa-mail-forward spaceLeft"></i></button>
				                  </span>
                                            
                            </c:if>
                		 </div>
                 	</div>
                 </div>
                 
                
                <div class="form-group">
                   <label class="col-sm-3 control-label" id="a"> ${str_reg_date} </label>
                  <div class="col-sm-2">
                    <input class="form-control" type="text" value="${memberDto.reg_date}" pattern="yyyy-MM-dd HH:mm" readonly>
                    <!-- 
                    <fmt:formatDate value="${memberDto.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm"/>
                    -->
                   </div>
                </div>
            
           
      
        <div class="form-group">
          <div class="col-sm-12 text-center">
            <button class="btn btn-primary" type="submit">${btn_mod}<i class="fa fa-check spaceLeft"></i></button>
             <button class="btn btn-primary" type="reset">${btn_cancel}<i class="fa fa-check spaceLeft"></i></button>
            <button class="btn btn-primary" type="reset" onclick="location='BandBoard_main.do'">${btn_mod_cancel}<i class="fa fa-times spaceLeft"></i></button>
          </div>
        </div>
               </form>
      
            </body>
      </c:if>
      <c:if test="${result == -1}">
         <script type="text/javascript">
         <!--
            erroralert(loginpasserror);
         //-->
         </script>
      </c:if>