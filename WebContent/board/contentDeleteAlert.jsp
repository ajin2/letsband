<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="setting.jsp" %>
<script src="${project}member/script.js"></script>
 
 <script type="text/javascript">
    //<!--
    var returnValue = confirm(delete_sure);
	if(returnValue == true){
   		window.location.href = "BandBoard_contentDeletePro.do";
   	} else {
   		//window.location.href = "BandBoard_main.do";
   	}    	
    //-->
</script>