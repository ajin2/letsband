<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ include file="setting.jsp" %>
	<script src="${project}member/script.js"></script>

    <h2> ${page_findId} </h2><hr>
    
    <c:if test="${result == 1}">
    	<table border="1">
    		<tr>
				<th> ${str_id} </th>
				<td> <input class="input" type="text" value="${memberDto.m_id}" readonly> </td>
    		</tr>
    		<tr> 
    			<td> <input class="inputbutton" type="button" value="${btn_ok}" onclick="location='BandBoard_main.do'" /> </td>
    		</tr>
    	</table>
	</c:if>    
	
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
    
    