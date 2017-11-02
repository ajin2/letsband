<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<%@ include file="setting.jsp" %>
	<script src="${project}board/script.js"></script>
	
	<jsp:include page="header.jsp" flush="false"/>
	
	<jsp:include page="menu.jsp" flush="false"/>
	
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
	
	<jsp:include page="footer.jsp" flush="false"/>
	

	