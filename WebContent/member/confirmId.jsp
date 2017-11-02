<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <%@ include file="setting.jsp" %>
	<link href="${project}member/style.css" rel="stylesheet" type="text/css">
	<script src="${project}member/script.js"></script>
	
	<h2> ${page_confirm} </h2> 
	
		<c:if test="${result == 0}">
			<!-- // 아이디가 없다 -->
			<table border="1">
				<tr>
					<th>
						<span>${id}</span>${msg_id_x}
					</th>
				</tr>
				<tr>
					<td align="center">
						  <input class="inputbutton" type="button" value="${btn_ok}" onclick="setid('${id}')">
					</td>
				</tr>
			</table>
		</c:if> 
		<c:if test="${result == 1}">
			<!-- // 아이디가 있다 -->
			<body onload="confirmfocus()">
				<form method="post" name="confirmform" action="Band_Logon_confirmId.do" onsubmit="return confirmcheck()">
					<table border="1">
						<tr>
							<th colspan="2">
								<span>${id}</span>${msg_id_o} 
							</th>
						</tr>
						<tr>
							<th> ${str_id} </th>
							<td>
								<input class="input" type="text" name="id" maxlength="15">
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<input class="inputbutton" type="submit" value="${btn_ok}">
								<input class="inputbutton" type="button" value="${btn_ok_cancel}" onclick="self.close()">
							</th>
						</tr>
					</table>
				</form>
			</body>
		</c:if>
