<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<script type="text/javascript">
	onload = function(){
		var id = opener.document.getElementsByName("id_chk")[0].value;
		document.getElementsByName("id_chk")[0].value = member_id;
	}
	
	function idConfirm(bool){
		if (bool == "true"){
			opener.document.getElementsByName("id_chk")[0].title = "y";
			opener.$("#text2")[0].focus();
		} else {
			var input = opener.document.getElementsByName("id_chk")[0];
			input.value = "";
			opener.document.getElementsByName("id_chk")[0].focus();
		}
		self.close();
	}
	
	function popupclose(){
		self.close();
	}
</script>

<style type="text/css">
#table_my {
   border-collapse: collapse;
   border-color: #ccc;
   left: 0px;
   margin: 2px auto;
   
}
#table_btn{
   left: 0px;
   margin: 0px auto;
}

#cancle_btn{
/* data-text-content="true" ; */
   position:relative;
   font-size: 16px; 
   color: rgb(64, 64, 64); 
   text-align: center; 
   line-height: 1.5em; 
   border-radius: 4px; 
   background-color: rgb(224, 224, 224);
   
}

#submit_btn{
   position:relative;
   font-size: 16px;
    color: rgb(255, 255, 255);
    text-align: center;
    line-height: 1.5em;
    border-radius: 4px;
    background-color: rgb(94, 94, 94);
   
}
</style>



</head>
<body style = "background-color : #E6E6FA;">
<%
	String idNotUsed = request.getParameter("idNotUsed");
%>
<div style="margin-top: 35%;">
   <table id="table_my">

      <tr>
         <td style="text-align: center;"><%=idNotUsed.equals("true")?"아이디 생성 가능":"중복된 아이디 존재(다시 입력해주세요.)" %></td>
      </tr>
   </table>
      <table id="table_btn" >
      <tr>
         <td>
            <input type = "button" value = "확인" onclick = "idConfirm('<%= idNotUsed %>')"id="submit_btn" />
            <input type = "button" value = "취소" onclick = "popupclose()" id="cancle_btn"/>
         </td>
      </tr>
      </table>
   </div>
</body>
</html>