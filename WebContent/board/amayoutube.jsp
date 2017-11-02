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
	       <th id="bandIframe1" style="width:100%"></th>
	       <td align="Left">
	          빅뱅(BIGBANG) - 에라 모르겠다 (FXXK IT) 밴드커버 (BAND Ver. COVER) <br><br>
	       
	          To allow bands to play K-Pop, 
	          we do perform slight editing and arrangement to suggest 
	          playing arrangements and provide music sheets. <br><br>
	       
	          카테고리   &nbsp&nbsp&nbsp&nbsp   음악 <br>
	          라이선스   &nbsp&nbsp&nbsp&nbsp   표준 YouTube 라이선스 <br>
	       </td>
	    </tr>
	    
	    <tr align="center">
	       <th id="bandIframe2" ></th>
	       <td align="Left">
	          플레이댓 케이팝 [PLAY THAT KPOP] <br> 
	          밴드에서 합주할 수 있도록 약간의 수정과 편곡을 한 후에 연주해봤습니다. <br><br>
	          
	          To allow bands to play K-Pop, we do perform slight 
	          editing and arrangement to suggest playing arrangements and provide music sheets. <br><br>
	          
	          카테고리   &nbsp&nbsp&nbsp&nbsp   음악 <br>   
	          라이선스   &nbsp&nbsp&nbsp&nbsp   표준 YouTube 라이선스 <br>
	       </td>
	    </tr>
	    
	    <tr align="center">
	       <th id="bandIframe3" ></th>
	       <td align="Left">
	          삼일절 기념 "아리랑" 락밴드 버전 편곡<br>
	          분리수거 홍대 버스킹(길거리 공연) <br>
	          분리수거 밴드(베이시스트, 드러머, 보컬, 기타리스트, 젬배) <br><br>
	          
	          Arirang(아리랑) Rock Band Version Busking by 분리수거 from Korea at Hongdae <br><br>
	          
	          카테고리   &nbsp&nbsp&nbsp&nbsp   음악 <br>   
	          라이선스   &nbsp&nbsp&nbsp&nbsp   표준 YouTube 라이선스 <br>
	       </td>
	    </tr>
	    
	    <tr align="center">
	       <th id="bandIframe4" ></th>
	       <td align="Left">
	          아리랑 (Arirang) - Korean Folk Song   <br> 
	          홍대 걷고싶은거리 버스킹 <br><br>
	          
	          카테고리   &nbsp&nbsp&nbsp&nbsp   음악 <br>   
	          라이선스   &nbsp&nbsp&nbsp&nbsp   표준 YouTube 라이선스 <br>
	       </td>
	    </tr>
	    
	    <tr align="center">
	       <th id="bandIframe5" ></th>
	       <td align="Left">
	          NELL(넬) 'Walking Through Memories(기억을 걷는 시간)' Cover 라이브 직캠   <br>
	         Guitar&Vocal 이주혁   <br>
	         Electric Guitar 김승태   <br>
	         Drum 정휘겸   <br>
	         Bass 김형우   <br><br>
	         
	          촬영      &nbsp&nbsp&nbsp&nbsp   Daily Busking <br>   
	         음악      &nbsp&nbsp&nbsp&nbsp   기프트 GIFT <br>   
	          카테고리   &nbsp&nbsp&nbsp&nbsp   음악 <br>   
	          라이선스   &nbsp&nbsp&nbsp&nbsp   표준 YouTube 라이선스 <br>
	       </td>
	    </tr>
	</table>
	
	<jsp:include page="footer.jsp" flush="false"/>


 <table border="1" align="center" style="width:95%; height:95%;">
      
  
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
                videoId: 'GtwE0YmAKy4',   // <iframe> 태그 지정시 필요없음
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
                videoId: 'ofBadqu40vI',   // <iframe> 태그 지정시 필요없음
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
                videoId: '2dUbwNt9HHE',   // <iframe> 태그 지정시 필요없음
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
                videoId: '-k-rYBek1Xg',   // <iframe> 태그 지정시 필요없음
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
                videoId: 'kMsyIdXFesk',   // <iframe> 태그 지정시 필요없음
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



    
    