<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
   <%@ include file="setting.jsp" %>
   <script src="${project}board/script.js"></script>
   <link href="${project}board/style.css" rel="stylesheet" type="text/css">
   
   <jsp:include page="header.jsp" flush="false"/>
   <jsp:include page="menu.jsp" flush="false"/>
   
   <table border="1" align="center" style="width:95%; height:95%;"> 
      <tr align="center" style="height:80px;">
         <td align="center">
			정보공유   
   		 </td>
    </tr>
   </table>
   
   <jsp:include page="footer.jsp" flush="false"/>