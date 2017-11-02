<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
   <%@ include file="setting.jsp" %>
   <script src="${project}board/script.js"></script>
   <link href="${project}board/style.css" rel="stylesheet" type="text/css">
   
   <jsp:include page="header.jsp" flush="false"/>
   <jsp:include page="menu.jsp" flush="false"/>
   
   <c:if test="${(sessionScope.memId == null || sessionScope.memId == '') && (sessionScope.adId == null || sessionScope.adId == '')}">
    <table border="1" align="center" style="width:95%; height:95%;"> 
		<tr align="center" style="height:80px;">
			<td align="center">
			</td>
		</tr>
	</table>
		<!-- // 비회원  > alert 띄운 후 로그인 OR 회원가입 페이지로 이동-->
        <script type="text/javascript">
        <!--
	        var returnValue = confirm(loginpleaseerror);
	    	if(returnValue == true){
	    		window.location.href = "BandBoard_main.do";
	    	} else {
	    		window.location.href = "BandBoard_main.do";
	    	}
        //-->
        </script>
    </c:if>
   
   <jsp:include page="footer.jsp" flush="false"/>