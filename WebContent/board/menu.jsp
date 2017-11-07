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

     <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-faded py-lg-4">
      <div class="container tagline-lower text-center  text-expanded text-shadow text-uppercase mb-5 d-none d-lg-block" >
  		
			<div class="collapse navbar-collapse" id="Menu">
				<ul>
				 <li class="nav-item px-lg-4">
	              <a class="nav-link text-uppercase text-expanded" href="BandBoard_main.do">Home
	              <span class="sr-only">(current)</span>
	              </a>
            	</li>
            
				<li class="nav-item px-lg-4">
					<a class="nav-link text-uppercase text-expanded">Youtube</a>
				      <ul>
				         <li>
				     		 <a class="nav-link text-uppercase text-expanded" href="BandBoard_amayoutube.do">Amateur</a>
				         </li>
				         <li>
				        	 <a class="nav-link text-uppercase text-expanded" href="BandBoard_proyoutube.do">Pro</a>
						</li>
				      </ul>
				</li>
				
				<li class="nav-item px-lg-4">
              		<a class="nav-link text-uppercase text-expanded" href="BandBoard_gatherPro.do">Gather</a>
            	</li>
            	
            	<li class="nav-item px-lg-4">
              		<a class="nav-link text-uppercase text-expanded" href="BandBoard_shareForm.do">Share</a>
            	</li>
            	
            	<li class="nav-item px-lg-4">
              		<a class="nav-link text-uppercase text-expanded" href="BandBoard_map.do">Map</a>
            	</li>
            	
            	<li class="nav-item px-lg-4">
              		<a class="nav-link text-uppercase text-expanded" href="BandBoard_download.do">Download</a>
            	</li>
						
				</li>
				</ul>
				</div>
			</div>
		</nav>
		 <!-- Bootstrap core JavaScript -->
    <script src="${project}board/vendor/jquery/jquery.min.js"></script>
    <script src="${project}board/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	</body>
	</html>

