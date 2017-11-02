<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.net.URLDecoder"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<%@ include file="setting.jsp" %>
	<script src="${project}board/script.js"></script>
	
	<jsp:include page="header.jsp" flush="false"/>
	
	<jsp:include page="menu.jsp" flush="false"/>


<h2> 파일 다운로드 </h2>

<%
	String originName = request.getParameter( "originName" );
	String systemName = request.getParameter( "systemName" );
	originName = URLDecoder.decode( originName, "utf-8" );
	systemName = URLDecoder.decode( systemName, "utf-8" );
%>

파일이름 : <%=originName%> <br>
저장이름 : <%=systemName%> <br>

<%
	out.clear();
	out = pageContext.pushBody();
	String path = application.getRealPath( "/save" );
	String fileName = path + "/" + systemName;
	
	BufferedInputStream bis 
		= new BufferedInputStream( new FileInputStream( fileName ) );
	
	BufferedOutputStream bos
		= new BufferedOutputStream( response.getOutputStream() );
	
	response.setContentType( "text/unknown" );
	response.setHeader( "content-disposition", 
		"attachment;filename=" 
		+ URLEncoder.encode( originName, "utf-8" ) + ";" );
	
	byte buffer[] = new byte[1024];
	int length = 0;
	while( ( length = bis.read( buffer, 0, buffer.length ) ) != -1 ) {
		bos.write( buffer, 0, length );
	}
	
	bis.close();
	bos.close();
	
%>














