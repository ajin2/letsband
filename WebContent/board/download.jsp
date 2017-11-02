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
	        var returnValue = confirm(loginpleaseerror);
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
						&nbsp;
					</td>
				</tr>
			</table>
	    </c:if>
    </c:if>
    
    
    <c:if test="${sessionScope.adId != null && sessionScope.adId != ''}">
    <form method="post" enctype="multipart/form-data" action="BandBoard_fileUpload.do">
    <table border="1" align="center" style="width:95%; height:50%;">
		<tr align="center" style="height:150px;">
			<th align="center" style="width:40%;"> ${str_download} </th>
			<td colspan="2">
				<c:forEach var="file" items="${list}">
					<a href="BandBoard_fileDownload.do?originName=${file.name}&systemName=${file.name}">
					${file.name}</a> <br>
				</c:forEach>
			</td>
		</tr>
		
		<tr style="height:20%;">
			<th colspan="3"> &nbsp; </th>
		</tr>
		
		<tr align="center" style="height:80px;">
			<th rowspan="2"> ${str_fileadd} </th>
			<td> <input class="input" type="file" name="file1"> </td>
		</tr>
		<tr style="height:40px;">
			<th colspan="2">
				<input class="inputbutton" type="submit" value="전송">
				<input class="inputbutton" type="reset" value="취소">
			</th>
		</tr>
		
		<tr style="height:20%;">
			<th colspan="3"> &nbsp; </th>
		</tr>
		
		<tr align="center" style="height:150px;">
			<th rowspan="3"> ${str_filedel} </th>
			<td colspan="2">
				<c:forEach var="file" items="${list}">
					<a href="BandBoard_fileDownload.do?originName=${file.name}&systemName=${file.name}">
					${file.name}</a> &nbsp;
					<a href="BandBoard_fileDelete.do?originName=${file.name}"> 삭제 </a>
					 <br>
				</c:forEach>
			</td>
		</tr>
	</table>
	</form>
	</c:if>
	
	<jsp:include page="footer.jsp" flush="false"/>
	

	