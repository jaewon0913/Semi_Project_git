$(function() {
	getJson();
});

function getJson() {
	$.getJSON( // 자바에서는 static 메소드와 유사 --> jQuery에서는 전역메소드라 불린다.
					//첫번째 매개변수로 JSON 파일을 로드한다.
					//두번쨰 매개변수(콜백함수)에서 JSON파일을 이요하여 로드된 데이터를 처리한다.
					//콜백함수는 로드된 데이터를 인자로 넘겨받는다.(JSON데이터를 참조하기 위해서 data변수를 사용하고있다)
					"json/festival.json",//json파일을 가져온다.
					function(data) {//파일을 가져오는것을 성공하면 data를 사용한

						$("table").attr("border", "1");
						$.each(
										//매개변수
										//collection:순회할 배열이가 객체
										//callback:컬렌션의 각 요소를 대상으로 실행할 콜백 함수
										//callback 함수에서 첫번째 매개변수는 객체의 개수를 반환한다.index는 0부터 시작한다.
										//callback 함수에서 두번째 매개변수 객체의 key값을 반환한다. 반환된 key값을 이용하여 value값을 구할 수 있다.
										//반환값 : 컬렉션의 매개변수
										//1. 데이터 배열 혹은 컬렉션(data변수)을 순회하면서 각 아이템을 표현할 HTML을 생성한다.
										//2. 표준 for문을 사용해 배열을 순회하는 것을 $.each로 대체하는 것이다.
										//3. $.each()사용해 각 항목을 반복 순회하면서 전달된 entry맵의 내용으로 HTML구조를 생성한다.
										//4. 모든 항목의 HTML이 작성되면 .html()을 사용해 <div id="dictionary>에 삽입하면 해당<div>태그의 내용이 새로운 내용으로 변경된다.
										data, //data 안에 잇는
										function(key, val) {//key 따로 val따로 가져올수있다.

											if (key == "DESCRIPTION") {
												$("thead").append("<tr>" 
									//bike.json파일을 보면 DESCRIPTION은 대문자로 되어있고, bike01.jsp의 <thead>에 
									//<tr>태그안에서 <th>를 생성하여 추가된다.
																		+ "<th>"
																		+ val.FESTIVAL_NAME
																		+ "</th>"
																		+ "<th>"
																		+ val.FESTIVAL_PLACE
																		+ "</th>"
																		+ "<th>"
																		+ val.FESTIVAL_START
																		+ "</th>"
																		+ "<th>"
																		+ val.FESTIVAL_END
																		+ "</th>"
																		+ "<th>"
																		+ val.FESTIVAL_IMG
																		+ "</th>"
																		+ "<th>"
																		+ val.FESTIVAL_CON
																		+ "</th>"
																		+ "<th>"
																		+ val.FESTIVAL_NUM
																		+ "</th>"
																		+ "<th>"
																		+ val.HOMEPAGE
																		+ "</th>"
																		+ "<th>"
																		+ val.ADDRESS
																		+ "</th>"
																		+ "<th>"
																		+ val.AGENCY
																		+ "</th>"
																		+ "</tr>"
																		
														);

											} else if (key == "DATA") {
												var list = val;
												for (var i = list.length-1; i >=0 ; i--) {
													var str = list[i];
												//DATA는 소문자뢰 되어있고 위와 똑같이 data가 추가된다.
													$("tbody")
															.append(
																	"<tr>"
																			+ "<td>"
																			+ str.축제명
																			+ "</td>"
																			+ "<td>"
																			+ str.개최장소
																			+ "</td>"
																			+ "<td>"
																			+ str.축제시작일자
																			+ "</td>"
																			+ "<td>"
																			+ str.축제종료일자
																			+ "</td>"
																			+ "<td>"
																			+ str.자료화면
																			+ "</td>"
																			+ "<td>"
																			+ str.축제내용
																			+ "</td>"
																			+ "<td>"
																			+ str.전화번호
																			+ "</td>"
																			+ "<td>"
																			+ str.홈페이지주소
																			+ "</td>"
																			+ "<td>"
																			+ str.소재지도로명주소
																			+ "</td>"
																			+ "<td>"
																			+ str.제공기관명																			+ "</td>"
																			+ "<input type='hidden' name='festival' value='"
																			+ str.축제명
																			+ "`"
																			+ str.개최장소
																			+ "`"
																			+ str.축제시작일자
																			+ "`"
																			+ str.축제종료일자
																			+ "`"
																			+ str.자료화면
																			+ "`"
																			+ str.축제내용
																			+ "`"
																			+ str.전화번호
																			+ "`"
																			+ str.홈페이지주소
																			+ "`"
																			+ str.소재지도로명주소
																			+ "`"
																			+ str.제공기관명
																			+ "'>"
																			+ "</tr>");
												}
											}
										});
					});
}