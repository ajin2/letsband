<html lang="en">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<%@ include file="setting.jsp" %>

    <title>LetsBand</title>
    
    <script src="${project}board/script.js"></script>
	<link href="${project}board/style.css" rel="stylesheet" type="text/css">

	<!-- Bootstrap core CSS -->
    <link href="${project}board/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

</head>	

<body>	

<div class="tagline-upper text-center text-heading text-shadow text-white mt-5 d-none d-lg-block">${page_main}</div>
    
    <div class="tagline-lower text-center text-expanded text-shadow text-uppercase text-white mb-5 d-none d-lg-block" >
  
    <c:if test="${(sessionScope.memId == null || sessionScope.memId == '') && (sessionScope.adId == null || sessionScope.adId == '')}">

    <a class="text-shadow text-white" href="Band_Logon_loginForm.do">로그인</a>  | 
    <a class="text-shadow text-white" href="Band_Logon_inputForm.do">회원가입</a> |  
    <a class="text-shadow text-white" href="Band_Logon_findId.do">아이디 찾기</a>  | 
    <a class="text-shadow text-white" href="Band_Logon_findPasswd.do">비밀번호 찾기</a>
    
    </c:if>
    
    <c:if test="${(sessionScope.memId != null && sessionScope.memId != '') && (sessionScope.adId == null || sessionScope.adId == '')}">
    
    <a class="text-shadow text-white" >${sessionScope.memId}님</a> |
    <a class="text-shadow text-white" href="Band_Logon_modifyForm.do">회원정보 수정</a> |
    <a class="text-shadow text-white" href="Band_Logon_deleteForm.do">회원탈퇴</a>  | 
    <a class="text-shadow text-white" href="Band_Logon_logout.do?con=1">로그아웃</a>
    
    </c:if>
    
    <c:if test="${(sessionScope.adId != null && sessionScope.adId != '') && (sessionScope.memId == null || sessionScope.memId == '')}">
    
    <a class="text-shadow text-white" >${sessionScope.adId}님</a> |
    <a class="text-shadow text-white" href="Band_Logon_membermgmt.do">회원관리 페이지</a> |
    <a class="text-shadow text-white" href="Band_Logon_logout.do?con=2">로그아웃</a>
    
    </c:if>
    
    <c:if test="${(sessionScope.adId != null && sessionScope.adId != '') && (sessionScope.memId != null && sessionScope.memId != '')}">
		<c:if test="${sessionScope.memId != id}">
		    <a class="text-shadow text-white" >${sessionScope.memId}</a> |
		    <a class="text-shadow text-white" href="Band_Logon_modifyForm.do">회원정보 수정</a> |
		    <a class="text-shadow text-white" href="Band_Logon_deleteForm.do">회원탈퇴</a>		|
		    <a class="text-shadow text-white" href="Band_Logon_logout.do?con=1">로그아웃</a> 
    	</c:if>
    
    	<c:if test="${sessionScope.adId == id}">
    
		    <a class="text-shadow text-white" >${sessionScope.adId}님</a> |
		    <a class="text-shadow text-white" href="Band_Logon_membermgmt.do">회원관리 페이지</a> |
		    <a class="text-shadow text-white" href="Band_Logon_logout.do?con=2">로그아웃</a> 
    
    	</c:if>
	</c:if>
 
 </div>
      
 <!-- Bootstrap core JavaScript -->
    <script src="${project}board/vendor/jquery/jquery.min.js"></script>
    <script src="${project}board/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	</body>
	</html>


    