$(function (){
	$.ajax({
		type : "GET",
		url : "review.do?command=reviewdata",
		dataType : "text",
		success : function(data){
			//alert(data);
			
			var tmp = $.trim(data);
			var obj = JSON.parse(tmp);			
			$.each(obj, function(key,val){
				if(key == "DATA"){
					var list = val;
					for (var i = 0 ; i < list.length; i++){
						var str = list[i];
						document.getElementById("review_title"+(i+1)).innerHTML = str.title;
		
						var test3 = str.content.substring(str.content.indexOf("<img") , str.content.indexOf("data-filename"))+" class = review_img_data style = 'width : 100%'>";
						
						$(".img_border"+(i+1)).append(test3);
						
						$(".review_img_data").attr('style','width : 100%');
						$("#go_review_detail"+(i+1)).prop('href','review.do?command=boarddetail&boardno='+str.boardno+"&hits="+str.hits+"&pagenum=1");
					}
				}
			});
			
		},
		error : function(){
			alert("리뷰게시판 데이터 불러오기 실패!");
		}
	});
});