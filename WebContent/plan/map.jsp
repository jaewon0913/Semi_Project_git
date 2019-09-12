<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- 장소검색  + 클릭시 마커가 제거되면서 새로운 마커가 생김  + 마커에 대한 정보 출력 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>My Google Map</title>
<style>
#map {
	width: 500px;
	height: 400px;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
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

#target {
	width: 345px;
}
</style>
</head>
<body>
	<h1>My Google Map</h1>
	<input id="pac-input" class="controls" type="text"
		placeholder="Search Box">
	<div id="map">
		<input id="pac-input" class="controls" type="text"
			placeholder="Search Box">
	</div>
	<div id="abc"></div>
	<script>
		var latlng;
		var str;
		var res;
		var p_id;
		
			// Array of markers
			var markers = [];
		function initMap() {
			// New Map, Map options
			var map = new google.maps.Map(document.getElementById('map'), {
				center : {
					lat : 37.499443,
					lng : 127.034806
				},
				zoom : 8
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
				/* alert("lat : " + res[0]);
				alert("lng : " + res[1]); */
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
			
			initAutocomplete();
			
			// Add Marker Function
			function addMarker(props) {
				var marker = new google.maps.Marker({
					position : props.coords,
					map : map,
				//icon:props.iconImage
				});
				markers.push(marker);
				// Check for customicon
				if (props.iconImage) {
					// Set icon image
					
					marker.setIcon(props.iconImage);
				}
				
				var infowindow = new google.maps.InfoWindow;

				marker.addListener('click', function(geocoder) {
					var geocoder = new google.maps.Geocoder;
					var latlngStr = str.split(',', 2);
					var latlng02 = {
						lat : parseFloat(latlngStr[0]),
						lng : parseFloat(latlngStr[1])
					};
					
					geocoder.geocode({'location' : latlng02}, function(results, status) {
						 if (status === 'OK') {
							if (results[0]) {
								p_id = results[0].place_id;
								
								var request = {
										placeId : p_id,
										fields : [ 'name', 'address_component', 'formatted_address', 'geometry', 'rating', 'reviews' ],
									};
								
								
								
								var service = new google.maps.places.PlacesService(map);
								
								service.getDetails(request, function(place, status) {
									
									var review = place.reviews // [object, object]
									//var review02 = Object.values(place.reviews)
									
									if (place.rating >= 0.5 && place.rating < 1.0) {
										place.rating = "☆  " + place.rating
									} else if (place.rating >= 1 && place.rating < 1.5) {
										place.rating = "★  " + place.rating
									} else if (place.rating >= 1.5 && place.rating < 2.0) {
										place.rating = "★☆  " + place.rating
									} else if (place.rating >= 2.0 && place.rating < 2.5) {
										place.rating = "★★  " + place.rating
									} else if (place.rating >= 2.5 && place.rating < 3.0) {
										place.rating = "★★☆  " + place.rating
									} else if (place.rating >= 3.0 && place.rating < 3.5) {
										place.rating = "★★★  " + place.rating
									} else if (place.rating >= 3.5 && place.rating < 4.0) {
										place.rating = "★★★☆  " + place.rating
									} else if (place.rating >= 4.0 && place.rating < 4.5) {
										place.rating = "★★★★  " + place.rating
									} else if (place.rating >= 4.5 && place.rating < 5.0) {
										place.rating = "★★★★☆                            " + place.rating
									} else if (place.rating >= 5.0) {
										place.rating = "★★★★★  " + place.rating
									} else { 
										place.rating = place.rating
									}
										if (status === google.maps.places.PlacesServiceStatus.OK) {
											infowindow.setContent('<div><strong>' 
													+ place.name + '</strong>' + '<br>' 
													+ 'Address : ' +  place.formatted_address + '<br>'
													+ "<fieldset> <legend>Average Rating : </legend> rating : " + place.rating
													+ "<fieldset> <legend>reviews : </legend> "
													 <% for(int i = 0; i < 3; i++) { %> + "abc"
													+ "rating : " + review[<%= i%>].rating + '<br>'
													+ "title : " + review[<%= i%>].text + '<br>'
													 <% } %>
													+ '</div>');
											infowindow.open(map, marker);
										};
							});                                                                                                     
							} else {
								window.alert('No results found');
							}
						} else {
							window.alert('Geocoder failed due to: ' + status);
						}
					});
				});
			}
			
			function initAutocomplete() {

		        // Create the search box and link it to the UI element.
		        var pac_input = document.getElementById('pac-input');
		        var searchBox = new google.maps.places.SearchBox(pac_input);
		        map.controls[google.maps.ControlPosition.TOP_LEFT].push(pac_input);

		        // Listen for the event fired when the user selects a prediction and retrieve
		        // more details for that place.
		        searchBox.addListener('places_changed', function() {
		          var places = searchBox.getPlaces();

		          if (places.length == 0) {
		            return;
		          }

		          // For each place, get the icon, name and location.
		          var bounds = new google.maps.LatLngBounds();
		          places.forEach(function(place) {
		            if (!place.geometry) {
		              console.log("Returned place contains no geometry");
		              return;
		            }
		            
		            if (place.geometry.viewport) {
		              // Only geocodes have viewport.
		              bounds.union(place.geometry.viewport);
		            } else {
		              bounds.extend(place.geometry.location);
		            }
		          });
		          map.fitBounds(bounds);
		        });
		      }
		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKpVZhMIKzF0zAD17yeVygQWNfL7MCCzc&language=en&libraries=places&callback=initMap">
		
	</script>
</body>
</html>
