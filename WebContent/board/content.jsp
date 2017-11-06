<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="setting.jsp"%>
<script src="${project}board/script.js"></script>

<jsp:include page="header.jsp" flush="false" />
<jsp:include page="menu.jsp" flush="false" />

<h2>${page_content}</h2>


<table width="700" border="1">
	<tr>
      <th> ${str_subject} </th>
      <td colspan="3">
         &nbsp;&nbsp;&nbsp;&nbsp;${boardDto.subject}
      </td>
   </tr>
	<tr>
      <th style="width:5%"> ${str_writer} </th>
      <td style="width:10%" align="center"> 
         ${boardDto.a_id }${boardDto.m_id }
      </td>
      <th> ${str_reg_date} </th>
      <td colspan="3" align="center">
         <fmt:formatDate value="${boardDto.reg_date}" 
            type="both" pattern="yyyy-MM-dd HH:mm"/>
      </td>
   </tr>

	<tr>
      <th > ${str_img} </th>
      <td ></td>
      <th style="width:5%"> ${str_readcount} </th>
      <td style="width:10%" align='center'> ${boardDto.readcount} </td>
   </tr>
	<tr>
      <th> ${str_content} </th>
      <td colspan="3">
         <pre>&nbsp;&nbsp;&nbsp;&nbsp;${boardDto.content}</pre>
      </td>
   </tr>	
</table>

<!-- 작성자 == 사용자 -->
<c:if test="${sessionScope.memId == boardDto.m_id}">
 <tr>
      <th colspan='3'>
         <input class='inputbutton' type='button' value="${btn_modify}"
            onclick="location='BandBoard_contentModifyForm.do?num=${boardDto.num}'">		
          <input class='inputbutton' type='button' value="${btn_delete}"
            onclick="location='BandBoard_contentDeletePro.do?num=${boardDto.num}'">
         <input class='inputbutton' type='button' value="${btn_list}"
            onclick="location='BandBoard_gatherPro.do?pageNum=${pageNum}'">
      </th>
</tr>
</c:if>
<br><br><br><br><br>

<!-- 작성자 != 사용자 -->
<c:if test="${sessionScope.memId != null or SessionScope.memId == ''}">
	<c:if test="${boardDto.m_id != sessionScope.memId}">
	 <tr>
	      <th colspan='3'>
	         <input class='inputbutton' type='button' value="${btn_list}"
	            onclick="location='BandBoard_gatherPro.do?pageNum=${pageNum}'">
	      </th>
	</tr>
	</c:if>
</c:if>
<!-- 관리자 -->
<c:if test="${sessionScope.adId != null}">
 <tr>
      <th colspan='2'>
         <input class='inputbutton' type='button' value="${btn_delete}"
            onclick="location='BandBoard_contentDeletePro.do?num=${boardDto.num}'">
         <input class='inputbutton' type='button' value="${btn_list}"
            onclick="location='BandBoard_gatherPro.do?pageNum=${pageNum}'">
      </th>
   </tr>
</c:if>

