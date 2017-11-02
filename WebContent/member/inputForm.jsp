<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@ include file="setting.jsp" %>
	<script src="${project}member/script.js"></script>

    <h2>${page_input}</h2>
		
    <body onload="inputfocus()">
    	<form method="post" action="Band_Logon_inputPro.do" name="inputform" onsubmit="return inputcheck()">
    	<input type="hidden" name="confirm" value="0">
    	<input type="hidden" name="emailconfirm_value" value="0">
    		<table border="1">
    			<tr>
    				<th colspan="2">
    					${msg_input}
    				</th>
    			</tr>
    			<tr>
    				<th> *${str_id} </th>
    				<td>
    					<input class="input" type="text" name="id" maxlength="15">
    					<input class="inputbutton" type="button" value="${btn_confirm}" name="confirmbtn" onclick="confirmid()">
    				</td>
    			</tr>
    			<tr>
    				<th rowspan="2"> *${str_passwd} </th>
    				<td>
    					<input class="input" type="password" name="passwd" maxlength="15" style="width:250px">
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<input class="input" type="password" name="repasswd" maxlength="15" style="width:250px">
    				</td>
    			</tr>
    			<tr>
    				<th> *${str_name} </th>
    				<td>
    					<input class="input" type="text" name="name" maxlength="30" style="width:250px">
    				</td>
    			</tr>
    			<tr>
					<th> *${str_postcode} </th>
					<td>
						<input class="input" type="text" id="sample2_postcode" name="postcode" placeholder="우편번호" readonly style="width:110px">
						&nbsp;&nbsp; <input class="inputbutton" type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
						<input class="input" type="text" id="sample2_address" name="address" placeholder="주소" readonly style="width:250px">
						
						<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
						<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
						<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" 
						style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
						</div>
						
						<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
						<script>
						    // 우편번호 찾기 화면을 넣을 element
						    var element_layer = document.getElementById('layer');
						</script>
					</td>
				</tr>
    			<tr>
    				<th> ${str_detail_add} </th>
    				<td>
    					<input class="input" type="text" name="detail_add" style="width:250px">
    				</td>
    			</tr>
    			<tr>
    				<th> ${str_email} </th>
    				<td>
    					<input class="input" type="text" name="email1" maxlength="15" style="width:140px"> @
    					<select name="email2">
    						<option value="0"> 직접입력 </option>
    						<option value="naver.com"> 네이버 </option>
    						<option value="daum.net"> 다음 </option>
    						<option value="gmail.com"> 구글 </option>
    						<option value="nate.com"> 네이트 </option>
    					</select><br>
    					<input class="inputbutton" type="button" name="emailconfirm" value="${btn_email}" 
    					onclick="emailcheck(inputform.email1.value, inputform.email2.value, 0)" />
    				</td>
    			</tr>
    			<tr>
    				<th colspan="2">
    					<input class="inputbutton" type="submit" value="${btn_in}">
    					<input class="inputbutton" type="reset" value="${btn_cancel}">
    					<input class="inputbutton" type="reset" value="${btn_in_cancel}" onclick="location='BandBoard_main.do'">
    				</th>
    			</tr>
    		</table>
    	</form> 
    </body>
    