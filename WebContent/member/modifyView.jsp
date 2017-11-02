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
	
	<h2> ${page_modify} </h2><hr>
	
		<c:if test="${result == 1}">
			<!-- // 비밀번호가 같다 -->
				<body onload="viewfocus()">
					<form name="viewform" method="post" action="Band_Logon_modifyPro.do" onsubmit="return viewcheck('${viewemail1}','${viewemail2}')">
					<input type="hidden" name="emailconfirm_value" value="-1">
						<table border="1">
							<tr>
								<th colspan="2">
									${msg_modifyview}
								</th>
							</tr>
							<tr>
								<th> ${str_id} </th>
								<td> <input class="input" type="text" value="${memberDto.m_id}" readonly> </td>
							</tr>
							<tr>
								<th rowspan="2"> ${str_passwd} </th>
								<td>
									<input class="input" type="password" name="passwd" maxlength="15" value="${memberDto.passwd}"> 
								</td>
							</tr>
							<tr>
								<td>
									<input class="input" type="password" name="repasswd" maxlength="15" value="${memberDto.passwd}"> 
								</td>
							</tr>
							<tr>
								<th> ${str_name}</th>
								<td> <input class="input" type="text" value="${memberDto.name}" readonly> </td>
							</tr>
							<tr>
								<th> ${str_postcode} </th>
								<td>
									<input class="input" type="text" id="sample2_postcode" name="postcode" value="${memberDto.postcode}"
									placeholder="우편번호" readonly style="width:110px">
									&nbsp;&nbsp; 
									<input class="inputbutton" type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
									<input class="input" type="text" id="sample2_address" name="address" value="${memberDto.address}"
									placeholder="주소" readonly style="width:250px">
									
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
			    					<input class="input" type="text" name="detail_add" value="${memberDto.detail_add}" style="width:250px">
			    				</td>
			    			</tr>
							<tr>
								<th> ${str_email}</th>
								<td> 
									<c:if test="${memberDto.email == null || memberDto.email == ''}">
											<input class="input" type="text" name="email1" maxlength="15" style="width:70px"> 
					    						@
					    					<input class="input" type="text" name="email2" maxlength="15" style="width:90px"> 
									</c:if> 
									<c:if test="${memberDto.email != null && memberDto.email != ''}">
										<c:set var="e" value="${fn:split(memberDto.email, '@')}"/>
											<input class="input" type="text" name="email1" maxlength="15" style="width:70px" value="${e[0]}"> 
					    						@
					    					<input class="input" type="text" name="email2" maxlength="15" style="width:90px" value="${e[1]}">
					    					<input class="inputbutton" type="button" value="${btn_email}" 
    										onclick="emailcheck(viewform.email1.value,viewform.email2.value,1)">
					    			</c:if> 
								</td>
							</tr>
							<tr>
								<th> ${str_reg_date} </th>
								<td>
									<fmt:formatDate value="${memberDto.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm"/>
								</td>
							</tr>
							<tr>
								<th colspan="2">
									<input class="inputbutton" type="submit" value="${btn_mod}">
									<input class="inputbutton" type="reset" value="${btn_cancel}">
									<input class="inputbutton" type="button" value="${btn_mod_cancel}" onclick="location='BandBoard_main.do'">
								</th>
							</tr>
						</table>
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