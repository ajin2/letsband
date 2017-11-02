<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ include file="setting.jsp" %>
	<script src="${project}member/script.js"></script>

    <h2> ${page_input} </h2><hr>
    
	<c:if test="${result == 0}">
    	<script type="text/javascript">
    	<!--
    		erroralert(finderror);
    	//-->
    	</script>
    </c:if>
    
    <c:if test="${result == -1}">
    	<script type="text/javascript">
    	<!--
    		erroralert(finderror);
    	//-->
    	</script>
    </c:if>
    
    <c:if test="${result == 1}">
    <body onload="findpfocus()">
    <form name="findform" onsubmit="return findpasswdcheck()" action="Band_Logon_findPasswdPro.do">
    <input type="hidden" name="id" value="${id}">
    	<table border="1">
    		<tr>
    			<th> ${msg_re_passwd} </th>
    			<td> <input type="password" name="passwd" maxlength="15"/> </td>
    			<td> <input type="password" name="repasswd" maxlength="15"/> </td>
    		</tr>
    		<tr>
				<th> <input type="submit" value="${btn_ok}"/> </th>    		
    		</tr>
    	</table>
    </form>
    </body>
	</c:if>    