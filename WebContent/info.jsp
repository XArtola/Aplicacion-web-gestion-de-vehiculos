<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.zubiri.concesionario.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MariCARmen &copy</title>
<style>
<%@ include file="./css/estilos.css"%>
</style>
<link href="https://fonts.googleapis.com/css?family=Cinzel|Julius+Sans+One|Noto+Sans|Raleway&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
</head>
<body>
	<header>
		<h1>MariCARmen <sup>&copy</sup></h1>
	</header>
	<nav>
		<ul>
			<li><a onclick="history.back();"><i class="material-icons">arrow_back</i></a></li>
			<%if(request.getParameter("seleccion").equals("coche")){ %>
				<li style="float: right; margin-right:20px;"><a href="index.jsp?seleccion=coches&formato=modulo"><i class="material-icons">home</i></a></li>
			<%}else{ %>
				<li style="float: right; margin-right:20px;"><a href="index.jsp?seleccion=camiones&formato=modulo"><i class="material-icons">home</i></a></li>
			<%} %>
		</ul>
	</nav>
	
	<%
		ConexionDB conn = new ConexionDB();
		try{
			conn.connect();
			switch (request.getParameter("seleccion")){
			case "coche": 
				Coche coche = conn.getCoche(request.getParameter("numBastidor"));
	%>
			<section>
				<article>
					<table id="mas_info">
						<tr>
							<th>Matrícula: </th><td><%=coche.getMatricula() %></td>
						</tr>
						<tr>
							<th>Nº de bastidor: </th><td><%=coche.getNumBastidor() %></td>
						</tr>
						<tr>
							<th>Serie: </th><td><%=coche.getSerie().getNumSerie () %></td>
						</tr>
						<tr>
							<th>Marca: </th><td><%=coche.getSerie().getMarca() %></td>
						</tr>
						<tr>
							<th>Modelo: </th><td><%=coche.getSerie().getModelo() %></td>
						</tr>
						<tr>
							<th>Año: </th><td><%=coche.getSerie().getFechaFabricacion() %></td>
						</tr>
						<tr>
							<th>Color:</th><td> <div style="background-color:<%=coche.getColor()%>;width:50px;height:15px; border:.5px solid black;border-spacing:2px;"></div></td>
						</tr>
						<tr>
							<th>Nº de asientos: </th><td><%=coche.getNumAsientos() %></td>
						</tr>
						<tr>
							<th>Nº de puertas: </th><td><%=coche.getNumPuertas() %></td>
						</tr>
						<tr>
							<th>Capacidad del maletero: </th><td><%=coche.getCapacidadMaletero() %></td>
						</tr>
						<tr>
							<th>Precio: </th><td><%=coche.getPrecio() %></td>
						</tr>
					</table>
					<a href="vender.jsp?seleccion=coches&formato=lista&numBastidor=<%=coche.getNumBastidor()%>">vender</a>
					<form action="info.jsp" method="post">
						<input type="color" name="newColor" id="newColor">
						<input type="submit" name="colorSubmit" id="colorSubmit">
					</form>
				</article>
			</section>
	<%		
			break;
			case "camion":
				Camion camion = conn.getCamion(request.getParameter("numBastidor"));
	%>
			<section>
				<article>
					<table>
						<tr>
							<th>Matrícula: </th><td><%=camion.getMatricula() %></td>
						</tr>
						<tr>
							<th>Nº de bastidor: </th><td><%=camion.getNumBastidor() %></td>
						</tr>
						<tr>
							<th>Nº de Serie: </th><td><%=camion.getSerie().getNumSerie() %></td>
						</tr>
						<tr>
							<th>Marca: </th><td><%=camion.getSerie().getMarca() %></td>
						</tr>
						<tr>
							<th>Modelo: </th><td><%=camion.getSerie().getModelo() %></td>
						</tr>
						<tr>
							<th>Año: </th><td><%=camion.getSerie().getFechaFabricacion() %></td>
						</tr>
						<tr>
							<th>Color:</th><td> <div style="background-color:<%=camion.getColor()%>;width:50px;height:15px; border:.5px solid black;border-spacing:2px;"></div></td>
						</tr>
						<tr>
							<th>Nº de asientos: </th><td><%=camion.getNumAsientos() %></td>
						</tr>
						<tr>
							<th>Carga: </th><td><%=camion.getCarga() %></td>
						</tr>
						<tr>
							<th>Tipo de mercancía: </th><td><%=camion.getTipoMercancia() %></td>
						</tr>
						<tr>
							<th>Precio: </th><td><%=camion.getPrecio() %></td>
						</tr>
						<tr>
							<td>
								<a href="vender.jsp?seleccion=camiones&formato=lista&numBastidor=<%=camion.getNumBastidor()%>">vender</a>
							</td>
						</tr>
					</table>
				</article>
			</section>
				
	<%			
			break;
			}
		conn.close();
	} 
	catch (ClassNotFoundException |SQLException e) {
		e.printStackTrace();
	} 
	catch (Exception e) {
		e.printStackTrace();
	}
	%>
	
</body>
</html>