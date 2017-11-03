<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<%@ include file="setting.jsp" %>
	<script src="${project}board/script.js"></script>
	
	<jsp:include page="header.jsp" flush="false"/>
	<jsp:include page="menu.jsp" flush="false"/>
	
	<table border="1" align="center" style="width:95%; height:80%;"> 
		<tr align="center" style="width:60%; height:50%">
			<td align="center">
				<jsp:include page="remain.jsp" flush="false"/>
			</td>
		</tr>
	</table>
	
	<jsp:include page="footer.jsp" flush="false"/>