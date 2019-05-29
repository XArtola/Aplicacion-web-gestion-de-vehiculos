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
<script type="text/javascript" src="./lib/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./js/script.js"></script>
</head>
<body>

	<header>
		<img src="./img/logo.png">
	</header>
	<datalist id="presetColors">
	   <option>#FFFFFF</option>
	   <option>#000000</option>
	   <option>#0000FF</option>
	   <option>#FFFF00</option>
	   <option>#FF0000</option>
	   <option>#00FF00</option>
	</datalist>
	<nav>
		<ul>
			<li><a onclick="history.back();"><i class="material-icons">arrow_back</i></a></li>
			<%if(request.getParameter("seleccion").equals("coche")){ %>
				<li style="float: right; margin-right:20px;"><a href="index.jsp?seleccion=coches&formato=modulo"><i class="material-icons">home</i></a></li>
			<%}else{ %>
				<li style="float: right; margin-right:20px;"><a href="index.jsp?seleccion=camiones&formato=modulo"><i class="material-icons">home</i></a></li>
			<%} %>
			<li style="float: right;"><a href="insertar.jsp?seleccion=<%=request.getParameter("seleccion")%>"><i class="material-icons">add</i></a></li>
		</ul>
	</nav>
	
	<%
		ConexionDB conn = new ConexionDB();
		try{
			conn.connect();
			if (request.getParameter("colorSubmit") != null){
				if(request.getParameter("seleccion").equals("coche")){
					Coche c = conn.getCoche(request.getParameter("numBastidor"));
					c.setColor(request.getParameter("newColor"));
					conn.modificarCoche(c);
				}else{
					Camion c = conn.getCamion(request.getParameter("numBastidor"));
					c.setColor(request.getParameter("newColor"));
					conn.modificarCamion(c);
					response.sendRedirect("info.jsp?numBastidor="+request.getParameter("numBastidor")+"&seleccion="+request.getParameter("seleccion"));
				}
				response.sendRedirect("info.jsp?numBastidor="+request.getParameter("numBastidor")+"&seleccion="+request.getParameter("seleccion"));
			}
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
						<tr>
							<td><a href="vender.jsp?numBastidor=<%=coche.getNumBastidor()%>&formato=<%=request.getParameter("formato")%>&seleccion=coches"><i class="material-icons vender">monetization_on</i></a></td>
							<td><i class="material-icons" id="colorIcon">color_lens</i></td>
						</tr>
					</table>
					<form action="info.jsp" method="post" class="colorOptions">
						<input type="color" name="newColor" list="presetColors">
						<input type="hidden" name="numBastidor" value="<%=request.getParameter("numBastidor") %>">
						<input type="hidden" name="seleccion" value="<%=request.getParameter("seleccion") %>">
						<input type="submit" name="colorSubmit">
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
							<th>Color:</th><td><div class="color" style="background-color:<%=camion.getColor()%>;float:right;"></div></td>
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
							<td><a href="vender.jsp?numBastidor=<%=camion.getNumBastidor()%>&formato=<%=request.getParameter("formato")%>&seleccion=camiones"><i class="material-icons vender">monetization_on</i></a></td>
							<td><i class="material-icons" id="colorIcon">color_lens</i></td>
						</tr>
					</table>
					<form action="info.jsp" method="post" class="colorOptions">
						<input type="color" name="newColor" list="presetColors">
						<input type="hidden" name="numBastidor" value="<%=request.getParameter("numBastidor") %>">
						<input type="hidden" name="seleccion" value="<%=request.getParameter("seleccion") %>">
						<input type="submit" name="colorSubmit">
					</form>
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