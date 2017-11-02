<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="setting.jsp" %>
<script src="${project}board/script.js"></script>

<jsp:include page="header.jsp" flush="false"/>
<jsp:include page="menu.jsp" flush="false"/>

<h2> ${page_content}</h2>

<table>
	<tr>
		<th> ${str_writer} </th>
		<td align="center"> 
			writer <!-- 작성자 관리자랑 유저랑 비교해야함 -->
		</td>
		<th> ${str_readcount} </th>
		<td> ${boardDto.readcount} </td>
	</tr>
	<tr>
		<th> ${str_reg_date} </th>
		<td align="center">
			<fmt:formatDate value="${boardDto.reg_date}" 
				type="both" pattern="yyyy-MM-dd HH:mm"/>
		</td>
	</tr>
	<tr>
		<th> ${str_subject} </th>
		<td colspan="3">
			${boardDto.subject}
		</td>
	</tr>
	<tr>
		<th> ${str_content} </th>
		<td colspan="3">
			<pre>${boardDto.content}</pre>
		</td>
	</tr>
</table>