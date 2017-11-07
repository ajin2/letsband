<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="setting.jsp" %>
<script src="${project}member/script.js"></script>
 
<c:if test="${result == 1}">
    <!-- // 삭제 성공 -->
    <c:redirect url="BandBoard_gatherPro.do?pageNum=${pageNum}"/>   
  </c:if>
  
  <c:if test="${result == 0}">
  <!-- // 삭제 실패 -->
      <script type="text/javascript">
      <!--
         erroralert(delete_content_no);
      //-->
      </script>
  </c:if>