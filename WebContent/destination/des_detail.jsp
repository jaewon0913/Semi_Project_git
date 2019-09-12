<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.semi.destination.dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	
</script>
<title>Insert title here</title>
<style type="text/css">
h2 {
	text-align: center;
	line-height: 1.5;
	font-weight: 300;
	font-size: 50px;
	margin-bottom: 10px;
	margin-top: 0px;
}

#place_phone {
	width: 120px;
	height: 20px;
}

.detail_opt {
	text-align: center;
	font-weight: bold;
	line-height: 1.5;
}

#aa {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

td {
	border: 1px solid;
}
</style>
</head>
<body>
	<%
		String place_name = request.getParameter("place_name");
		int index = place_name.indexOf("(");
		String result = place_name.substring(0, index);
		String place_phone = request.getParameter("place_phone");
		String address = request.getParameter("address");
		String guide = request.getParameter("guide");
		String place_info = request.getParameter("place_info");
	%>
	<table id="table_opt">
		<H2 id="pl_name"><%=result%></H2>
		<tr>
			<td class="detail_opt" id="place_phone">PLACE PHONE</td>
			<td class="detail_opt" id="address">PLACE ADDRESS</td>
		</tr>
			<td class="detail_sub" id="">&nbsp;<%=place_phone%></td>
			<td class="detail_sub">&nbsp;&nbsp;<%=address%></td>
		<tr>
			<td class="detail_opt" id="guide">GUIDE</td>
			<td class="detail_opt" id="place_info">PLACE INFO</td>
		</tr>
			<td class="detail_sub">&nbsp;&nbsp;<%=guide%></td>
			<td class="detail_sub">&nbsp;&nbsp;<%=place_info%></td>
	</table>
</body>
</html>