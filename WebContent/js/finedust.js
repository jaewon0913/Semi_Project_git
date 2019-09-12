function finedust(location){
	
	var url = "etc.do?command=finedust&location="+location;
	
	$.ajax({
		type : "GET",
		url : url,
		dataType : "text",
		success : function(data){
			var tmp = $.trim(data);
			var obj = JSON.parse(tmp);
			$("table.finedust_table").attr("border","1");
			$.each(obj, function(key,val){
				if(key == "DATA"){
					var list = val;
					$("k_table q_table .finedust_table thead").empty();
					$("table.finedust_table tbody").empty();
					var str = list[0];
					$("k_table q_table .finedust_table thead").append(
							"<tr>"
							+ "<th></th>"
							+ "<th>미세먼지</th>"
							+ "<th>초미세먼지</th>"
							+ "</tr>"
							);
					$("table.finedust_table tbody").append(
							"<tr>"
							+ "<th>"
							+ location
							+ "</th>"
							+ "<td>"
							+ str.finedust
							+ "</td>"
							+ "<td>"
							+ str.highfinedust
							+ "</td>"
							+ "</tr>"
							);
				}
			});
		},
		error : function(){
			alert("미세먼지 불러오는데 실풰~");
		}
	});
}