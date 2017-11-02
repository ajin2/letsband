<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="setting.jsp" %>
	<script src="${project}member/script.js"></script>

    <h2> ${page_findPasswd}</h2>
	
	<body onload="findpfocus()">
		<form method="post" name="findform" action="Band_Logon_findPasswdView.do" onsubmit="return findpcheck()">
			<table border="1">
				<tr>
					<th colspan="2"> ${msg_find} </th>
				</tr>
				<tr>
					<th> ${str_id} </th>
					<td>
						<input class="input" type="text" name="id" maxlength="15">  
					</td>
				</tr>
				<tr>
					<th> ${str_name} </th>
					<td>
						<input class="input" type="text" name="name" maxlength="30">
					</td>
				</tr>
				<tr>
					<th> ${str_email} </th>
					<td>
						<input class="input" type="text" name="email" maxlength="30">  
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input class="inputbutton" type="submit" value="${btn_find}">
						<input class="inputbutton" type="reset" value="${btn_cancel}">
						<input class="inputbutton" type="button" value="${btn_find_cancel}" onclick="location='BandBoard_main.do'">
					</th>
				</tr>
			</table>
		</form>
	</body>