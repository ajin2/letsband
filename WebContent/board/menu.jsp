<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<%@ include file="setting.jsp" %>
	
	<script src="${project}board/script.js"></script>
	<link href="${project}board/style.css" rel="stylesheet" type="text/css">

    <table border="1" align="center" style="width:95%; height:20%;"> 
		<tr align="center" style="height:40px;">
			<th> ${page_main} </th> 
		</tr>
		
		<tr style="height:50px; " >
			<td align="center">
			<div id="Menu">
				<ul>
				<li><a>
				      <input type="image" src="${img}home.jpg" style="height:40px; width:130px;" onclick="location='BandBoard_main.do'">
				      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   </a>
				</li>
				
				<li><a>
				      <input type="image" src="${img}youtube.jpg" style="height:40px; width:130px;">
				      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   </a>
				      <ul>
				         <li><a>
				               <input type="image" src="${img}ama.jpg" style="height:40px; width:130px;" onclick="location='BandBoard_amayoutube.do'">
				            </a></li>
				         <li><a>
				               <input type="image" src="${img}pro.jpg" style="height:40px; width:130px;" onclick="location='BandBoard_proyoutube.do'">
				            </a></li>
				      </ul>
				</li>
				
				<li><a>
				      <input type="image" src="${img}gather.jpg" style="height:40px; width:130px;" onclick="location='BandBoard_gatherPro.do'">
				      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   </a>
				</li>
				
				<li><a>
				      <input type="image" src="${img}share.jpg" style="height:40px; width:130px;" onclick="location='BandBoard_shareForm.do'">
				      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				      </a>
				</li>
				
				<li><a>
				      <input type="image" src="${img}download.jpg" style="height:40px; width:130px;" onclick="location='BandBoard_download.do'">
				      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   </a>
				   
				<li><a>
				     <input type="image" src="${img}map.jpg" style="height:40px; width:130px;" onclick="location='BandBoard_map.do'">
				      
				   </a>
				</li>
				</ul>
				</div>
			</td>
		</tr>
		
	</table>
	

