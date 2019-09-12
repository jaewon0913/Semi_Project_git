<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<%
   response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

   <script src="https://kit.fontawesome.com/27cb20e940.js"></script>
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" href="${pageContext.request.contextPath }/css/pagecss.css?ver=1">
   <script type="text/javascript" src = "${pageContext.request.contextPath }/js/pagejs.js?ver=1"></script>

   

</head>

<style>

input#start, #end {
   width: 400px;
}

ul {
   padding: 0px;
}

li {
   list-style: none;
   padding: 0px;
}


#map {
   width: 400px;
   height: 400px;
}

#description {
   font-family: Roboto;
   font-size: 15px;
   font-weight: 300;
}

#infowindow-content .title {
   font-weight: bold;
}

#infowindow-content {
   display: none;
}

#map #infowindow-content {
   display: inline;
}

.pac-card {
   margin: 10px 10px 0 0;
   border-radius: 2px 0 0 2px;
   box-sizing: border-box;
   -moz-box-sizing: border-box;
   outline: none;
   box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
   background-color: #fff;
   font-family: Roboto;
}

#pac-container {
   padding-bottom: 12px;
   margin-right: 12px;
}

.pac-controls {
   display: inline-block;
   padding: 5px 11px;
}

.pac-controls label {
   font-family: Roboto;
   font-size: 13px;
   font-weight: 300;
}

#pac-input {
   background-color: #fff;
   font-family: Roboto;
   font-size: 15px;
   font-weight: 300;
   margin-left: 12px;
   padding: 0 11px 0 13px;
   text-overflow: ellipsis;
   width: 30%;
   position: absolute;
   z-index: 1;
   margin-top: 15px;
}

#pac-input:focus {
   border-color: #4d90fe;
}

#title {
   color: #fff;
   background-color: #4d90fe;
   font-size: 25px;
   font-weight: 500;
   padding: 6px 12px;
}

#map_div {
   float: left;
   margin: 30px;
}

#func_div {
   margin: 0px auto;
   width: 1120px;
}

#panel {
   display: none;
}

#dir_div {
   float: left;
}

@media ( max-width : 880px) {
   #map_div {
      float: none;
   }
}

#right-panel select, #right-panel input {
   font-size: 15px;
}

#right-panel select {
   width: 100%;
}

#right-panel i {
   font-size: 12px;
}

#right-panel {
   width: 50%;
   height: 100%;
   font-family: 'Roboto', 'sans-serif';
   float: right;
   overflow: auto;
   float: left; 
   padding-left: 10px;
   line-height: 30px;
   
}

@media print {
   #right-panel {
      float: none;
   }
}

@media ( max-width : 1100px) {
   #map_div {
      margin: 0px 0px 30px 0px;
   }
   #map {
      width: 98vw;
   }
   #right-panel {
      float: none;
   }
}
</style>
<% Map<String, Float> map_w = (Map<String, Float>)request.getAttribute("map_w"); 
      System.out.println(map_w.get("lat"));
   %>
<script type="text/javascript">
var latlng;
var str;
var res;
var p_id;
var directionsService;
var directionsDisplay;
var map;
var marker;
var infowindow;

// Array of markers
var markers = [];
function initMap() {
   // New Map, Map options
   directionsService = new google.maps.DirectionsService();
   directionsDisplay = new google.maps.DirectionsRenderer();
   map = new google.maps.Map(document.getElementById('map'), {
      center : {
         lat : ${map_w.lat},
         lng : ${map_w.lng}
      },
      zoom : 8,
      mapTypeId : google.maps.MapTypeId.ROADMAP
   });

   // Listen for click on map
   google.maps.event.addListener(map, 'click', function(event) {
      // Add marker
      deleteMarkers();
      addMarker({
         coords : event.latLng
      });
      latlng = "" + event.latLng;
      str = latlng.substring(1, latlng.length - 1);
      res = str.split(',', 2);
   });

   // Loop through markers
   for (var i = 0; i < markers.length; i++) {
      // Add marker
      addMarker(markers[i]);
   }

   function setMapOnAll(map) {
      for (var i = 0; i < markers.length; i++) {
         markers[i].setMap(map);
      }
   }

   function clearMarkers() {
      setMapOnAll(null);
   }

   function deleteMarkers() {
      clearMarkers();
      markers = [];
   }

   // Add Marker Function
   function addMarker(props) {
      marker = new google.maps.Marker({
         position : props.coords,
         map : map,
      // icon:props.iconImage
      });
      markers.push(marker);
      // Check for customicon
      if (props.iconImage) {
         // Set icon image

         marker.setIcon(props.iconImage);
      }

      infowindow = new google.maps.InfoWindow;

      marker.addListener('click',
                  function(geocoder) {
                     var geocoder = new google.maps.Geocoder;
                     var latlngStr = str.split(',', 2);
                     var latlng02 = {
                        lat : parseFloat(latlngStr[0]),
                        lng : parseFloat(latlngStr[1])
                     };

                     geocoder.geocode({'location' : latlng02},
                                 function(results, status) {
                                    if (status === 'OK') {
                                       if (results[0]) {
                                          p_id = results[0].place_id;

                                          var request = {
                                             placeId : p_id,
                                             fields : [
                                                   'name',
                                                   'address_component',
                                                   'formatted_address',
                                                   'geometry',
                                                   'rating',
                                                   'reviews'
                                                   ],
                                          };

                                          var service = new google.maps.places.PlacesService(
                                                map);

                                          service.getDetails(request, function(place, status) {

                                                         var review = place.reviews // [object,
                                                         // object]
                                                         // var
                                                         // review02
                                                         // =
                                                         // Object.values(place.reviews)

                                                         var review_star = "";
                                                         review_star = rating(place, review, review_star)
                                                         
                                                         if (status === google.maps.places.PlacesServiceStatus.OK) {
                                                            if((place.rating == undefined) == true){
                                                               infowindow.setContent('<div><strong>'
                                                                  + place.name
                                                                  + '</strong>'
                                                                  + '<br>'
                                                                  + 'Address : '
                                                                  + place.formatted_address
                                                                  + '<br>'
                                                                  + "<fieldset style='text-align: center; font-weight: bold;'>Not evaluated.</fieldset>"
                                                                  + '</div>');
                                                               infowindow.open(map, marker);
                                                            } else {
                                                               infowindow
                                                               .setContent('<div><strong>'
                                                                     + place.name
                                                                     + '</strong>'
                                                                     + '<br>'
                                                                     + 'Address : '
                                                                     + place.formatted_address
                                                                     + '<br>'
                                                                     + "<fieldset> <legend>Average Rating : </legend> rating : "
                                                                     + place.rating
                                                                     + "<fieldset> <legend>reviews : </legend> "
                                                                     + "<c:forEach var='i' begin='0' end='2' step='1'>"
                                                                     + "rating : "
                                                                     + rating_to_star(parseInt(review[${i}].rating))
                                                                     + '<br>'
                                                                     + "title : "
                                                                     + review[${i }].text
                                                                     + '<br>'
                                                                     + "</c:forEach>"
                                                                     + '</div>');
                                                         infowindow.open(map, marker);
                                                         }
                                                         }
                                                      });
                                       } else {
                                          window
                                                .alert('No results found');
                                       }
                                    } else {
                                       window
                                             .alert('Geocoder failed due to: '
                                                   + status);
                                    }
                                 });
                  });
   }
   
   initAutocomplete();
   directionsDisplay.setMap(map);
   directionsDisplay.setPanel(document.getElementById('right-panel'));
   
   var direction_text = function() {
        calculateAndDisplayRoute(directionsService, directionsDisplay);
    };
   
   document.getElementById('start').addEventListener('change', direction_text);
    document.getElementById('end').addEventListener('change', direction_text);

}
   
function calculateAndDisplayRoute(directionsService, directionsDisplay) {
   var selectedMode = document.getElementById('mode').value;
   var start = document.getElementById('start').value;
   var end = document.getElementById('end').value;
   directionsService.route({
      origin : start, // Haight.
      destination : end, // Ocean Beach.
      // Note that Javascript allows us to access the
      // constant
      // using square brackets and a string value as
      // its
      // "property."
      travelMode : google.maps.TravelMode[selectedMode]
   }, function(response, status) {
      if (status == 'OK') {
         directionsDisplay.setDirections(response);
      }
   })
}

function initAutocomplete() {

   // Create the search box and link it to the UI
   // element.
   var pac_input = document.getElementById('pac-input');
   var searchBox = new google.maps.places.SearchBox(pac_input);
   var autocomplete = new google.maps.places.Autocomplete(pac_input);
   map.controls[google.maps.ControlPosition.TOP_LEFT].push(pac_input);
   
   autocomplete.bindTo('bounds', map);
   autocomplete.setFields(
            ['address_components', 'geometry', 'icon', 'name']);
   
   infowindow = new google.maps.InfoWindow();
    var infowindowContent = document.getElementById('infowindow-content');
    infowindow.setContent(infowindowContent);
   marker = new google.maps.Marker({
       map: map,
       anchorPoint: new google.maps.Point(0, -29)
   });
   
   searchBox.addListener('places_changed', function() {
      var place = searchBox.getPlaces();
      infowindow.close();
      marker.setVisible(false);
      
      if (place.length == 0) {
         return;
      }

      // For each place, get the icon, name and
      // location.
      var bounds = new google.maps.LatLngBounds();
      place.forEach(function(place) {
         if (!place.geometry) {
            console.log("Returned place contains no geometry");
            return;
         }

         if (place.geometry.viewport) {
            // Only geocodes have viewport.
            bounds.union(place.geometry.viewport);
         } else {
            bounds.extend(place.geometry.location);
            map.setzoom(17);
         }
         marker.setPosition(place.geometry.location);
           marker.setVisible(true);
           
           var address = '';
             if (place.address_components) {
               address = [
                 (place.address_components[0] && place.address_components[0].short_name || ''),
                 (place.address_components[1] && place.address_components[1].short_name || ''),
                 (place.address_components[2] && place.address_components[2].short_name || '')
               ].join(' ');
             }

             
             
             infowindowContent.children['place-icon'].src = place.icon;
             infowindowContent.children['place-name'].textContent = place.name;
             infowindowContent.children['place-address'].textContent = address;
             infowindow.open(map, marker);
      });
      
      map.fitBounds(bounds);
      
   });
}

function rating_to_star(rating){
   var trans = "";
   
   if (rating >= 0.5
         && rating < 1.0) {
      trans = "☆" + rating
      return trans
   } else if (rating >= 1.0
         && rating < 1.5) {
      trans = "★" + rating
      return trans
   } else if (rating >= 1.5
         && rating < 2.0) {
      trans = "★☆" + rating
      return trans
   } else if (rating >= 2.0
         && rating < 2.5) {
      trans = "★★" + rating
      return trans
   } else if (rating >= 2.5
         && rating < 3.0) {
      trans = "★★☆" + rating
      return trans
   } else if (rating >= 3.0
         && rating < 3.5) {
      trans = "★★★" + rating
      return trans
   } else if (rating >= 3.5
         && rating < 4.0) {
      trans = "★★★☆" + rating
      return trans
   } else if (rating >= 4.0
         && rating < 4.5) {
      trans = "★★★★" + rating
      return trans
   } else if (rating >= 4.5
         && rating < 5.0) {
      trans = "★★★★☆" + rating
      return trans
   } else if (rating >= 5.0) {
      trans = "★★★★★" + rating
      return trans
   } else {
      return rating + "Not found review."
   }
   
}

function rating(place, review, review_star){
   if (place.rating >= 0.5
         && place.rating < 1.0) {
      place.rating = "☆  "
            + place.rating
   } else if (place.rating >= 1
         && place.rating < 1.5) {
      place.rating = "★  "
            + place.rating
   } else if (place.rating >= 1.5
         && place.rating < 2.0) {
      place.rating = "★☆  "
            + place.rating
   } else if (place.rating >= 2.0
         && place.rating < 2.5) {
      place.rating = "★★  "
            + place.rating
   } else if (place.rating >= 2.5
         && place.rating < 3.0) {
      place.rating = "★★☆  "
            + place.rating
   } else if (place.rating >= 3.0
         && place.rating < 3.5) {
      place.rating = "★★★  "
            + place.rating
   } else if (place.rating >= 3.5
         && place.rating < 4.0) {
      place.rating = "★★★☆"
            + place.rating
   } else if (place.rating >= 4.0
         && place.rating < 4.5) {
      place.rating = "★★★★"
            + place.rating
   } else if (place.rating >= 4.5
         && place.rating < 5.0) {
      place.rating = "★★★★☆"
            + place.rating
   } else if (place.rating >= 5.0) {
      place.rating = "★★★★★"
            + place.rating
   } else {
      place.rating = place.rating
   }
   
   if((place.rating == undefined) == false){
   if (review >= 0.5
         && review < 1.0) {
      return "☆  " + review_star;
   } else if (review >= 1.0
         && review < 1.5) {
      return  "★  " + review_star 
   } else if (review >= 1.5
         && review < 2.0) {
      return "★☆  " + review_star
   } else if (review >= 2.0
         && review < 2.5) {
      return "★★  " + review_star
   } else if (review >= 2.5
         && review < 3.0) {
      return "★★☆  " + review_star
   } else if (review >= 3.0
         && review < 3.5) {
      return "★★★  " + review_star
   } else if (review >= 3.5
         && review < 4.0) {
      return "★★★☆  " + review_star
   } else if (review >= 4.0
         && review < 4.5) {
      return "★★★★  " + review_star
   } else if (review >= 4.5
         && review < 5.0) {
      return "★★★★☆  " + review_star
   } else if (review >= 5.0) {
      review_star = "★★★★★  " + review_star
      return review_star
   } else {
      return review_star + "Not found review."
   }
   }
}

$(function () {

   var cnt = 0;

   $(document).on("click", "#dir", function(){
      
      $("#right-panel > div").remove();
      
      directionsService = new google.maps.DirectionsService();
      directionsDisplay = new google.maps.DirectionsRenderer();
      
      directionsDisplay.setMap(map);

      document.getElementById('mode').addEventListener('change', function () {
         calculateAndDisplayRoute(directionsService, directionsDisplay);
      });
      
   })
   
   $(document).on("click", "#change02", function () {
      
      $("#right-panel > div").remove();
      
      var pac_input = "<input id='pac-input' class='controls' type='text' placeholder='Search Box'>";
      
      $("#panel").hide();
      $("#panel > input").val('');
      
      if (directionsDisplay != null) {
         directionsDisplay.setMap(null);
         directionsService = null;
      }

      cnt = 0;
      
      if (cnt == 0) {
         $("#map").append(pac_input);
         $("#input_div").append(pac_input);
         cnt++;
      }

      initMap();
   });
   
   $(document).on("click", "#change", function () {
      $("#panel").show();
   })
})
</script>
<script async defer
   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKpVZhMIKzF0zAD17yeVygQWNfL7MCCzc&language=en&libraries=places&callback=initMap&sensor=false">
</script>
<body>

   <!-- header -->
   <jsp:include page="../pageheader.jsp"></jsp:include>
   <!-- ============================================= B O D Y =================================================== -->
   <!-- ============================================= B O D Y =================================================== -->
   <!-- ============================================= B O D Y =================================================== -->
   <!-- 지도의 시작 태그 -->
   <div id="func_div">
      <div id="map_div">
      <div id="infowindow-content">
         <img src="" width="16" height="16" id="place-icon">
         <span id="place-name"  class="title"></span><br>
         <span id="place-address"></span>
       </div>
         <div id="input_div">
            <input id="pac-input" class="controls" type="text"
               placeholder="Search Box">
               <div id="dir_div">
                  <div id="map">
                     <input id="pac-input" class="controls" type="text"
                        placeholder="Search Box">
                  </div>
                  <input type="button" value="direction" id="change"> <input
                     type="button" value="search" id="change02" />
                  <div id="panel">
                     <p>
                        <b>Start: </b>
                     </p>
                     <input type="text" id="start" />
                     <p>
                        <b>End: </b>
                     </p>
                     <input type="text" id="end" />
                     <div>
                        <input type="hidden" value="TRANSIT" id="mode"> 
                        <input type="button" value="길찾기" id="dir" onclick="initMap()" />
                     </div>
                  </div>
               </div>
            <div id="right-panel"></div>
         </div>
      </div>
   </div>
   <!-- 지도의 끝태그 -->
   <!-- ============================== F O O T E R ======================================== -->
   <!-- ============================== F O O T E R ======================================== -->
   <!-- ============================== F O O T E R ======================================== -->
   <jsp:include page="../pagefooter.jsp"></jsp:include>
</body>

</html>