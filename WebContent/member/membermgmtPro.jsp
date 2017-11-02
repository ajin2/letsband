<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file="setting.jsp" %>
	<script src="${project}member/script.js"></script>
    
    <c:if test="${result == 1}">
    <!-- // 삭제 성공 -->
    	<script type="text/javascript">
        <!--
        	var returnValue = confirm(delete_ok_error);
        	if(returnValue == true){
        		window.location.href = "Band_Logon_membermgmt.do";
        	} else {
        		window.location.href = "BandBoard_main.do";
        	}
        //-->
        </script>
    </c:if>
    
    <c:if test="${result == 0}">
    <!-- // 삭제 실패 -->
        <script type="text/javascript">
        <!--
        	erroralert(deleteerror);
        //-->
        </script>
    </c:if>
