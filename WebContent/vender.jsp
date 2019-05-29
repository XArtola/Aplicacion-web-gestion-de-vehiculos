<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.zubiri.concesionario.*"%>
<%
	ConexionDB conn = new ConexionDB();
	conn.connect();
	if (request.getParameter("confirmar") != null) {
		System.out.println("confirmado");
		conn.eliminarVehiculo(request.getParameter("numBastidor"));
		System.out.println("eliminado");
		response.sendRedirect("index.jsp?formato=" + request.getParameter("formato") + "&seleccion="+ request.getParameter("seleccion"));
		conn.close();
	}else{
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vender - MariCARmen</title>
<link rel="stylesheet" type="text/css" href="./css/estilos.css">
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
			<li style="float: right; margin-right:20px;"><a href="index.jsp?seleccion=<%=request.getParameter("seleccion")%>&formato=modulo"><i class="material-icons">home</i></a></li>
			<li style="float: right;"><a href="insertar.jsp?seleccion=<%=request.getParameter("seleccion")%>"><i class="material-icons">add</i></a></li>
		</ul>
	</nav>
	<section>
		<article>
			<form action="vender.jsp" method="get">
				<%
					if (request.getParameter("seleccion").equals("coches")) {
						Coche coche = conn.getCoche(request.getParameter("numBastidor"));
				%>
				<table>
					<tr>
						<td>Matrícula</td>
						<td><input type="text" readonly="readonly"
							name="campo_matricula" value="<%=coche.getMatricula()%>"></td>
					</tr>
					<tr>
						<td>Número de bastidor</td>
						<td><input type="text" readonly="readonly"
							name="numBastidor" value="<%=coche.getNumBastidor()%>"></td>
					</tr>
					<tr>
						<td>Color</td>
						<td><input type="text" readonly="readonly" name="campo_color" class="color"
							style="background-color:<%=coche.getColor()%>" value="coche.getColor()"></td>
					</tr>
					<tr>
						<td>Número de asientos</td>
						<td><input type="number" readonly="readonly"
							name="campo_numAsientos" value="<%=coche.getNumAsientos()%>"></td>
					</tr>
	
					<tr>
						<td>Precio</td>
						<td><input type="number" step="0.5" readonly="readonly"
							name="campo_precio" value="<%=coche.getPrecio()%>"></td>
					</tr>
	
					<tr>
						<td>Serie</td>
						<td><input type="number" name="campo_serie"
							readonly="readonly" value="<%=coche.getSerie().getNumSerie()%>"></td>
					</tr>
					<tr>
						<td>Número de puertas</td>
						<td><input type="text" readonly="readonly"
							name="campo_numPuertas" value="<%=coche.getNumPuertas()%>"></td>
					</tr>
					<tr>
						<td>Capacidad maletero</td>
						<td><input type="number" step="0.5" readonly="readonly"
							name="campo_capacidadMaletero"
							value="<%=coche.getCapacidadMaletero()%>"></td>
					</tr>
					<tr>
						<td><input type="submit" name="confirmar" value="Vender"></td>
						<td><input type="button" onclick="history.back();"
							value="Volver"><input type="hidden" name="seleccion"
							value="<%=request.getParameter("seleccion")%>"></td>
					</tr>
				</table>
				<%
					} else if (request.getParameter("seleccion").equals("camiones")){
						Camion camion = conn.getCamion(request.getParameter("numBastidor"));
				%>
				<table>
					<tr>
						<td>Matrícula</td>
						<td><input type="text" readonly="readonly"
							name="campo_matricula" value="<%=camion.getMatricula()%>"></td>
					</tr>
					<tr>
						<td>Número de bastidor</td>
						<td><input type="text" readonly="readonly"
							name="numBastidor" value="<%=camion.getNumBastidor()%>"></td>
					</tr>
					<tr>
						<td>Color</td>
						<td><input type="text" readonly="readonly" name="campo_color" class="color"
							style="background-color:<%=camion.getColor()%>"></td>
					</tr>
					<tr>
						<td>Número de asientos</td>
						<td><input type="number" readonly="readonly"
							name="campo_numAsientos" value="<%=camion.getNumAsientos()%>"></td>
					</tr>
	
					<tr>
						<td>Precio</td>
						<td><input type="number" step="0.5" readonly="readonly"
							name="campo_precio" value="<%=camion.getPrecio()%>"></td>
					</tr>
	
					<tr>
						<td>Serie</td>
						<td><input type="number" name="campo_serie"
							readonly="readonly" value="<%=camion.getSerie().getNumSerie()%>"></td>
					</tr>
					<tr>
						<td>Carga</td>
						<td><input type="number" step="0.5" readonly="readonly"
							name="campo_carga" value="<%=camion.getCarga()%>"></td>
					</tr>
					<tr>
						<td>Tipo de mercancía</td>
						<td><input type="text" readonly="readonly"
							name="campo_tipoMercancia" value="<%=camion.getTipoMercancia()%>"></td>
					</tr>
					<tr>
						<td><input type="submit" name="confirmar" value="Vender"></td>
						<td><input type="button" onclick="history.back();"
							value="Volver"><input type="hidden" name="seleccion"
							value="<%=request.getParameter("seleccion")%>"></td>
					</tr>
				</table>
				<%
					}
				%>
			</form>
		</article>
	</section>
</body>
</html>
<%}%>