<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
	<%@ include file="setting.jsp" %>

	<c:if test="${sessionScope.adId != null and sessionScope.adId != ''}">
	<sql:query var="rs" dataSource="jdbc/kh">
			select * from Band_member
	</sql:query>
	
	<table border="1">
		<tr>
			<c:forEach var="name" items="${rs.columnNames}">
				<th>${name}</th>
			</c:forEach>
			<th>${str_delete}</th>
		</tr>
		<c:forEach var="row" items="${rs.rowsByIndex}">
			<tr>
				<c:forEach var="cols" items="${row}" varStatus="i">
					<td>${cols}</td>
					<c:if test="${i.count == 1}">
						<c:set var="m_id" value="${cols}" />
					</c:if>
				</c:forEach>
				<td><input type="button" value="${btn_del}" onclick="location='Band_Logon_membermgmtPro.do?id=${m_id}'"></td>
			</tr>
		</c:forEach>
	</table>
	</c:if>
	
