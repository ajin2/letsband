<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<%@ include file="setting.jsp" %>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<script src="${project}board/script.js"></script>
	<link href="${project}board/style.css" rel="stylesheet" type="text/css">
	
	<table align="center" style="width:95%; height:95%;"> 
		<tr align="center"style="height:80px;" >
			<td align="center">
			
			<div class="container">
					<div class="jumbotron">
						<div class="container">
							<h1> 웹사이트 소개 </h1>
							<p> 이 웹사이트는 밴드게시판입니다.</p>
							<p><a class="btn btn-primary btn-pull" onclick="location='BandBoard_intro.do'" role="button">자세히 알아보기</a></p>
						</div>
					</div>
				</div>
			
				<div class="container">
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"> </li>
							<li data-target="#myCarousel" data-slide-to="1"> </li>
							<li data-target="#myCarousel" data-slide-to="2"> </li>
						</ol>
						
						<div class ="carousel-inner">
							<div class="item active">
								<img src = "${img}band1.jpg">
							</div>
							<div class="item">
								<img src="${img}band2.jpg">	
							</div>
							<div class="item">
								<img src = "${img}band3.jpg">
							</div>
						</div>
						
						<a class ="left carousel-control" href="#myCarousel" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</a>
						<a class ="right carousel-control" href="#myCarousel" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
						
					</div>
				</div>
				<script src = "http://code.jquery.com/jquery-3.1.1.min.js"></script>
				<script src = "js/bootstrap.js"></script>
			</td>
		</tr>
	</table>