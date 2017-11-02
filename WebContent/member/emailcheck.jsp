<%@page import="member.EmailConfirm"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ include file="setting.jsp" %>
	<script src="${project}member/script.js"></script>

	<c:if test="${authNum != null && authNum != '' }">
		<script type="text/javascript">
		<!--
			alert(senderror);
		//-->
		</script>
	</c:if>
	<c:if test="${authNum == null || authNum == '' }">
		<script type="text/javascript">
		<!--
			alert(emailerror);
			history.back();
		//-->
		</script>
	</c:if>

	<form method="post" action="" name="emailcheck">
		<table border="1">
			<tr>
				<th colspan="2">인증번호를 입력하세요.</th>
			</tr>
			<tr>
				<td>
					<input class="input" type="text" name="emailconfirm">
				</td>
				<td>
					<input class="inputbutton" type="button" value="${btn_ok}" 
	                 onclick="confirmemail(emailcheck.emailconfirm.value, ${authNum},${emailvalue})">
				</td>
			</tr>
		</table>
	</form>
