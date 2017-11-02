<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="setting.jsp" %>
<script src="${project}board/script.js"></script>

<jsp:include page="header.jsp" flush="false"/>
<jsp:include page="menu.jsp" flush="false"/>

<h2> ${page_content}</h2>

<table border="1">
	<tr>
		<th style="width:5%"> ${str_writer} </th>
		<td style="width:10%" align="center"> 
			writer <!-- 작성자 관리자랑 유저랑 비교해야함 -->
		</td>
		<th style="width:5%"> ${str_readcount} </th>
		<td style="width:10%" align='center'> ${boardDto.readcount} </td>
	</tr>
	<tr>
		<th> ${str_reg_date} </th>
		<td colspan="3">
			<fmt:formatDate value="${boardDto.reg_date}" 
				type="both" pattern="yyyy-MM-dd HH:mm"/>
		</td>
	</tr>
	
	<tr>
		<th > ${str_img} </th>
		<td colspan="3">
			
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
	
	<tr>
		<th colspan='4'>
			<input class='inputbutton' type='button' value="${btn_modify}"
				onclick="location=''">
			<input class='inputbutton' type='button' value="${btn_delete}"
				onclick="location=''">
			<input class='inputbutton' type='button' value="${btn_list}"
				onclick="location=''">
		</th>
	</tr>
</table>