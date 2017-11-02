<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<%@ include file="setting.jsp" %>
	<script src="${project}board/script.js"></script>
	<link href="${project}board/style.css" rel="stylesheet" type="text/css">
	
	<jsp:include page="header.jsp" flush="false"/>
	
	<jsp:include page="menu.jsp" flush="false"/>
	
	<table border="1" align="center" style="width:95%; height:95%;"> 	
     	
	    <tr align="center">
	       <th id="bandIframe1" style="width:100%" ></th>
	       <td align="Left" style="width:100%" >
	          2011 새내기콘서트 YB(윤도현밴드)공연 '나는 나비'.<br><br>
	       
	           2011년 4월, 윤도현이 새내기들에게 전하는 음악메시지. <br><br>
	          
	          카테고리   &nbsp&nbsp&nbsp&nbsp   음악 <br>
	          라이선스   &nbsp&nbsp&nbsp&nbsp   표준 YouTube 라이선스 <br>
	       </td>
	    </tr>
	    
	    <tr align="center">
	       <th id="bandIframe2" ></th>
	       <td align="Left"> 
	          Original by 전인권 (Jhun In Keun)  <br> 
	          걱정 말아요 그대 (Don't Worry) <br><br>
	          
	          
	          카테고리   &nbsp&nbsp&nbsp&nbsp   인물/블로그 <br>   
	          라이선스   &nbsp&nbsp&nbsp&nbsp   표준 YouTube 라이선스 <br>
	       </td>
	    </tr>
	    
	    <tr align="center">
	       <th id="bandIframe3" ></th>
	       
	       <td align="Left">
	          The video was first broadcast on David Frost’s Frost On Sunday show, 
	          four days after it was filmed. <br><br>
	
	          카테고리   &nbsp&nbsp&nbsp&nbsp   교육 <br>   
	          라이선스   &nbsp&nbsp&nbsp&nbsp   표준 YouTube 라이선스 <br>
	       </td>
	    </tr>
	    
	    <tr align="center">
	       <th id="bandIframe4" ></th>
	       <td align="Left">
	          日本屈指の一流ミュージシャンによる音楽チャリティプロジェクト『Guitar☆Man』<br> 
	         伊藤広規プロデュースLIVEプロジェクト、後藤次利プロデュースCDプロジェクトが同時進行中！   <br><br>
	         
	          일본 굴지의 일류 뮤지션에 의한 음악 자선 프로젝트 『Guitar☆Man』<br> 
	          이토 오코 오키 프로듀스 LIVE프로젝트, 고토 오츠 구토 시 프로듀스 CD프로젝트가 동시 진행 중!
	             <br><br>
	          
	          카테고리   &nbsp&nbsp&nbsp&nbsp   음악 <br>   
	          라이선스   &nbsp&nbsp&nbsp&nbsp   표준 YouTube 라이선스 <br>
	       </td>
	    </tr>
	    
	    <tr align="center">
	       <th id="bandIframe5" ></th>
	       <td align="Left">
	           170517 혁오 (HYUKOH)  - TOMBOY (톰보이) <br>
	         이대 이화여자대학교 축제 이루다 [직캠 / FANCAM]   <br><br>
	            
	          카테고리   &nbsp&nbsp&nbsp&nbsp   엔터테인먼트 <br>   
	          라이선스   &nbsp&nbsp&nbsp&nbsp   표준 YouTube 라이선스 <br>
	       </td>
	    </tr>
    </table>
    
   <script type="text/javascript">
          
        var tag = document.createElement('script');
        tag.src = "http://www.youtube.com/iframe_api";
        var firstScriptTag = document.getElementsByTagName('script')[0];
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
    
        var player1, player2, player3, player4, player5
           , player6, player7, player8, player9, player10;
        
        function onYouTubeIframeAPIReady() {
           
            player1 = new YT.Player('bandIframe1', {
                height: '315',            // <iframe> 태그 지정시 필요없음
                width: '560',             // <iframe> 태그 지정시 필요없음
                videoId: 'F9kduqOK-Og',   // <iframe> 태그 지정시 필요없음
                playerVars: {             // <iframe> 태그 지정시 필요없음
                    controls: '2'
                },
                events: {
                    'onReady': onPlayerReady,               // 플레이어 로드가 완료되고 API 호출을 받을 준비가 될 때마다 실행
                    'onStateChange': onPlayerStateChange    // 플레이어의 상태가 변경될 때마다 실행
                }
            });
            player2 = new YT.Player('bandIframe2', {
                height: '315',            // <iframe> 태그 지정시 필요없음
                width: '560',             // <iframe> 태그 지정시 필요없음
                videoId: 'h3ETX6Pv2Yw',   // <iframe> 태그 지정시 필요없음
                playerVars: {             // <iframe> 태그 지정시 필요없음
                    controls: '2'
                },
                events: {
                    'onReady': onPlayerReady,               // 플레이어 로드가 완료되고 API 호출을 받을 준비가 될 때마다 실행
                    'onStateChange': onPlayerStateChange    // 플레이어의 상태가 변경될 때마다 실행
                }
            });
            player3 = new YT.Player('bandIframe3', {
                height: '315',            // <iframe> 태그 지정시 필요없음
                width: '560',             // <iframe> 태그 지정시 필요없음
                videoId: 'A_MjCqQoLLA',   // <iframe> 태그 지정시 필요없음
                playerVars: {             // <iframe> 태그 지정시 필요없음
                    controls: '2'
                },
                events: {
                    'onReady': onPlayerReady,               // 플레이어 로드가 완료되고 API 호출을 받을 준비가 될 때마다 실행
                    'onStateChange': onPlayerStateChange    // 플레이어의 상태가 변경될 때마다 실행
                }
            });
            player4 = new YT.Player('bandIframe4', {
                height: '315',            // <iframe> 태그 지정시 필요없음
                width: '560',             // <iframe> 태그 지정시 필요없음
                videoId: 'qowO7bFrDq4',   // <iframe> 태그 지정시 필요없음
                playerVars: {             // <iframe> 태그 지정시 필요없음
                    controls: '2'
                },
                events: {
                    'onReady': onPlayerReady,               // 플레이어 로드가 완료되고 API 호출을 받을 준비가 될 때마다 실행
                    'onStateChange': onPlayerStateChange    // 플레이어의 상태가 변경될 때마다 실행
                }
            });
            player5 = new YT.Player('bandIframe5', {
                height: '315',            // <iframe> 태그 지정시 필요없음
                width: '560',             // <iframe> 태그 지정시 필요없음
                videoId: 'HafYkQOVk4s',   // <iframe> 태그 지정시 필요없음
                playerVars: {             // <iframe> 태그 지정시 필요없음
                    controls: '2'
                },
                events: {
                    'onReady': onPlayerReady,               // 플레이어 로드가 완료되고 API 호출을 받을 준비가 될 때마다 실행
                    'onStateChange': onPlayerStateChange    // 플레이어의 상태가 변경될 때마다 실행
                }
            });
            
        }
        
        
        function onPlayerReady(event) {
            console.log('onPlayerReady 실행');
        }
        var playerState;
        function onPlayerStateChange(event) {
            playerState = event.data == YT.PlayerState.ENDED ? '종료됨' :
                    event.data == YT.PlayerState.PLAYING ? '재생 중' :
                    event.data == YT.PlayerState.PAUSED ? '일시중지 됨' :
                    event.data == YT.PlayerState.BUFFERING ? '버퍼링 중' :
                    event.data == YT.PlayerState.CUED ? '재생준비 완료됨' :
                    event.data == -1 ? '시작되지 않음' : '예외';
 
            console.log('onPlayerStateChange 실행: ' + playerState);
 
            // 재생여부를 통계로 쌓는다.
            collectPlayCount(event.data);
        }
            
              </script>


    
    