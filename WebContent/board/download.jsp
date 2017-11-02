<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<%@ include file="setting.jsp" %>
	<script src="${project}board/script.js"></script>
	
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
	        var returnValue = confirm(nullerror);
	    	if(returnValue == true){
	    		window.location.href = "BandBoard_main.do";
	    	} else {
	    		window.location.href = "BandBoard_main.do";
	    	}
        //-->
        </script>
    </c:if>
	
	<c:if test="${sessionScope.memId != null && sessionScope.memId != ''}">
		<c:if test="${result == 0}">
	    	<!-- 폴더가 없음 -->
	    	<script type="text/javascript">
	        <!--
		        var returnValue = confirm(foldererror);
		    	if(returnValue == true){
		    		window.location.href = "BandBoard_main.do";
		    	} else {
		    		window.location.href = "BandBoard_main.do";
		    	}
	        //-->
	        </script>
	        <meta http-equiv="refresh" content="0; url=BandBoard_main.do"/>
	    </c:if>
	    
	    <c:if test="${result == 1}">
	    	<!-- 폴더가 있음 -->
	    	<table border="1" align="center" style="width:95%; height:95%;">
				<tr align="center" style="height:20%;">
					<th align="center"> ${str_download} </th>
					<td>
						<c:forEach var="file" items="${list}">
							<a href="BandBoard_fileDownload.do?originName=${file.name}&systemName=${file.name}">
							${file.name}</a> <br>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2"> 
						프로그램 사용법 내용이 들어갈 자리임
					</td>
				</tr>
			</table>
	    </c:if>
    </c:if>
    
    <c:if test="${sessionScope.adId != null && sessionScope.adId != ''}">
	<table border="1" align="center" style="width:95%; height:95%;"> 
		<tr align="center" style="height:80px;">
			<td align="center">
			<form method="post" enctype="multipart/form-data" action="BandBoard_fileUpload.do">
			<table>
				<tr>
					<th> 제목 </th>
					<td> <input class="input" type="text" name="title"> </td>
				</tr>
				<tr>
					<th> 파일 </th>
					<td> <input class="input" type="file" name="file1"> </td>
				</tr>
				<tr>
					<th colspan="2">
						<input class="inputbutton" type="submit" value="전송">
						<input class="inputbutton" type="reset" value="취소">
					</th>
				</tr>
			</table>
			</form>
			</td>
		</tr>
	</table>
	</c:if>
	
	<jsp:include page="footer.jsp" flush="false"/>
	

	