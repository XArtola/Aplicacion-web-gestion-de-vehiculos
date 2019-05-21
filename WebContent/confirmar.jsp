<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.zubiri.concesionario.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<section>
		<table>
			<form action="index.jsp" method="post">
				<%
				switch(request.getAttribute("vehiculo").getClass().getName()){
					case "coche":
					
					break;
					case "camion":
					
					break;
				}
					
				%>
			</form>
		</table>
	</section>
</body>
</html>