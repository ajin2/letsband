<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
   <%@ include file="setting.jsp" %>
   <script src="${project}board/script.js"></script>
   
   <jsp:include page="header.jsp" flush="false"/>
   <jsp:include page="menu.jsp" flush="false"/>
   
   <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 80%;
      }
      /* Optional: Makes the sample page fill the window. */

      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
    </style>
   
   <table border="1" align="center" style="width:95%; height:95%;"> 
      <tr align="center" style="height:80px;">
         <td align="center">

    <div>
      <input id="address" type="textbox" value="">
      <input id="submit" type="button" value="검색하기">
    </div>
    <div id="map"></div>
    
    <script>
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 18,
          center: {lat: 37.566826, lng: 126.9786567}, 
        });
        var geocoder = new google.maps.Geocoder();

        document.getElementById('submit').addEventListener('click', function() {
          geocodeAddress(geocoder, map);
        });
      }

      function geocodeAddress(geocoder, resultsMap) {
        var address = document.getElementById('address').value;
        geocoder.geocode({'address': address}, function(results, status) {
          if (status === 'OK') {
            resultsMap.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
              map: resultsMap,
              position: results[0].geometry.location
            });
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDhIAo30iHVbBrAkUR4Npv3Hf-Ts3FStQ4&callback=initMap">
    </script>
    </td>
    </tr>

   </table>
   
   <jsp:include page="footer.jsp" flush="false"/>