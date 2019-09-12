$(function(){
   
$("#place4").click(function(){
      
      $.getJSON("json/place4.json", function(data){
         $.ajax({
            url: "tour.do?command=placeinsert",
            method: "post",
            data:{"obj":JSON.stringify(data)},
            success:function(){
               alert("place입력성공");
            },
            error: function(){
               alert("place입력실패");
            }
            
         })
      });
      
      
   });   
   
   
$("#place3").click(function(){
      
      $.getJSON("json/place3.json", function(data){
         $.ajax({
            url: "tour.do?command=placeinsert",
            method: "post",
            data:{"obj":JSON.stringify(data)},
            success:function(){
               alert("place입력성공");
            },
            error: function(){
               alert("place입력실패");
            }
            
         })
      });
      
      
   });   
   
$("#place2").click(function(){
      
      $.getJSON("json/place2.json", function(data){
         $.ajax({
            url: "tour.do?command=placeinsert",
            method: "post",
            data:{"obj":JSON.stringify(data)},
            success:function(){
               alert("place입력성공");
            },
            error: function(){
               alert("place입력실패");
            }
            
         })
      });
      
      
   });   
   
   $("#place1").click(function(){
      
      $.getJSON("json/place1.json", function(data){
         $.ajax({
            url: "tour.do?command=placeinsert",
            method: "post",
            data:{"obj":JSON.stringify(data)},
            success:function(){
               alert("place입력성공");
            },
            error: function(){
               alert("place입력실패");
            }
            
         })
      });
      
      
   });   
   
   $("#item01").click(function(){
      $.getJSON("json/item01.json", function(data){
         $.ajax({
            url: "tour.do?command=item01insert",
            method: "post",
            data:{"obj":JSON.stringify(data)},
            success:function(){
               alert("item01입력성공");
            },
            error:function(){
               alert("item01입력실패");
            }
            
         })
         
      });
      
      
   });
   
      
   $("#do").click(function(){

      $.getJSON("json/do.json", function(data){
         $.ajax({         
            url: "tour.do?command=doNOInsert",
            method: "post",
            data:{"obj":JSON.stringify(data)},
            success:function(){
               alert("db입력 성공");
            },
            error:function(){
               alert("db입력실패");
            }
         });         
         
      });            
   });
   
   $("#city").click(function(){
      
      $.getJSON("json/cityno.json", function(data){
         $.ajax({
            
            url: "tour.do?command=cityNOInsert",
            method: "post",
            data:{"obj":JSON.stringify(data)},
            success:function(){
               alert("city입력성공!");
            },
            error:function(){
               alert("city입력실패!");
            }
         });
         
      });
   });
   
   
});