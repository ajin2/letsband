<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="setting.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <c:if test="${(sessionScope.memId == null || sessionScope.memId == '') && (sessionScope.adId == null || sessionScope.adId == '')}">
    	<table align="right">
    		<tr>
    			<td> <a href="Band_Logon_loginForm.do">로그인</a> </td>
    			<td style="width:30px;"></td>
	    		<td><a href="Band_Logon_inputForm.do">회원가입</a> </td>
	    		<td style="width:30px;"></td>
	    		<td><a href="Band_Logon_findId.do">아이디 찾기</a> </td>
	    		<td style="width:30px;"></td>
	    		<td><a href="Band_Logon_findPasswd.do">비밀번호 찾기</a> </td>
	    		<td style="width:80px;"></td>
    		</tr>
    	</table>
    </c:if>
    
    <c:if test="${sessionScope.memId != null && sessionScope.memId != ''}">
    	<table align="right">
    		<tr>
    			<td> <a href="Band_Logon_modifyForm.do">회원정보 수정</a> </td>
    			<td style="width:30px;"></td>
    			<td> <a href="Band_Logon_deleteForm.do">회원탈퇴</a> </td>
    			<td style="width:30px;"></td>
    			<td> <a href="Band_Logon_logout.do">로그아웃</a> </td>
    			<td style="width:80px;"></td>
    		</tr>
    	</table>
    </c:if>
    
    
    <c:if test="${sessionScope.adId != null && sessionScope.adId != ''}">
    	<table align="right">
    		<tr>
    			<td> <a href="Band_Logon_membermgmt.do">회원관리 페이지</a> </td>
    			<td style="width:30px;"></td>
    			<td> <a href="Band_Logon_logout.do">로그아웃</a> </td>
    			<td style="width:80px;"></td>
    		</tr>
    	</table>
    </c:if>
    