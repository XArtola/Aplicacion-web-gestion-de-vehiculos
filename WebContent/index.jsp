<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.zubiri.concesionario.*"%>
<!--<%@ page import="com.mysql.cj.jdbc.Driver"%>-->
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Concesionarios Manoli &copy</title>
<style>
<%@ include file="/WEB-INF/css/estilos.css"%>
</style>
<link href="https://fonts.googleapis.com/css?family=Cinzel|Julius+Sans+One|Noto+Sans|Raleway&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
</head>
<body>
	<header>
		<h1>Concesionarios Manoli <sup>&copy</sup></h1>
	</header>
	<nav>
		<ul>
			<%if(request.getParameter("formato").equals("lista")){ %>
				<li><a href="index.jsp?formato=modulo&seleccion=<%=request.getParameter("seleccion") %>"><i class="material-icons">view_module</i></a></li>
			<%}else{%>
				<li><a href="index.jsp?formato=lista&seleccion=<%=request.getParameter("seleccion") %>"><i class="material-icons">view_list</i></a></li>
				<%
			}%>
			<li><a href="index.jsp?seleccion=vehiculos&formato=<%=request.getParameter("formato") %>">Todos los vehículos</a></li>
			<li><a href="index.jsp?seleccion=coches&formato=<%=request.getParameter("formato") %>">Coches</a></li>
			<li><a href="index.jsp?seleccion=camiones&formato=<%=request.getParameter("formato") %>">Camiones</a></li>
			<li style="float: right;"><a href="insertar.jsp?seleccion=<%=request.getParameter("seleccion")%>">Añadir vehículo</a></li>
		</ul>
	</nav>
	
	<%
		ConexionDB conn = new ConexionDB();
		try {
			conn.connect();
			ResultSet rs = null;
			//formato lista
			if(request.getParameter("formato").equals("lista")){
			switch (request.getParameter("seleccion")) {
			case "camiones":
				rs = conn.getCamiones();
	%>
	<section>
		<table>
			<tr>
				<th>Matrícula</th>
				<th>Nº Bastidor</th>
				<th>Color</th>
				<th>Nº Asientos</th>
				<th>Precio</th>
				<th>Serie</th>
				<th>Carga</th>
				<th>Tipo Mercancía</th>
			</tr>
			<%
				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("matricula")%></td>
				<td><%=rs.getString("numBastidor")%></td>
				<td><%=rs.getString("color")%></td>
				<td><%=rs.getInt("numAsientos")%></td>
				<td><%=rs.getFloat("precio")%></td>
				<td><%=rs.getInt("numSerie")%>
				<td><%=rs.getFloat("carga")%></td>
				<td><%=rs.getString("tipoMercancia").charAt(0) %></td>
			</tr>
			<%
				}
			%>
		</table>
		</section>
		<%
			break;
				case "coches":
					rs = conn.getCoches();
		%>
		<section>
		<table>
			<tr>
				<th>Matrícula</th>
				<th>Nº Bastidor</th>
				<th>Color</th>
				<th>Nº Asientos</th>
				<th>Precio</th>
				<th>Serie</th>
				<th>Nº Puertas</th>
				<th>Capacidad maletero</th>
			</tr>
			<%
				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("matricula")%></td>
				<td><%=rs.getString("numBastidor")%></td>
				<td><%=rs.getString("color")%></td>
				<td><%=rs.getInt("numAsientos")%></td>
				<td><%=rs.getFloat("precio")%></td>
				<td><%=rs.getInt("numSerie")%>
				<td><%=rs.getInt("numPuertas")%></td>
				<td><%=rs.getFloat("capacidadMaletero")%></td>
			</tr>
			<%
				}
			%>
		</table>
		</section>
		<%
			break;
				case "vehiculos":
					rs = conn.getVehiculos();
					%>
					<section>
					<table>
						<tr>
							<th>Matrícula</th>
							<th>Nº Bastidor</th>
							<th>Color</th>
							<th>Nº Asientos</th>
							<th>Precio</th>
							<th>Serie</th>
							<th>Tipo</th>
						</tr>
						<%
							while (rs.next()) {
						%>
						<tr>
							<td><%=rs.getString("matricula")%></td>
							<td><%=rs.getString("numBastidor")%></td>
							<td><%=rs.getString("color")%></td>
							<td><%=rs.getInt("numAsientos")%></td>
							<td><%=rs.getFloat("precio")%></td>
							<td><%=rs.getInt("numSerie")%></td>
							<td><%=rs.getString("tipo") %></td>
						</tr>
						<%
							}
						%>
					</table>
					</section>
					<%
			break;
				}
			}else{
				switch(request.getParameter("seleccion")){
				case "coches":
					rs = conn.getCoches();
					boolean repetir = true;
					while(repetir){
						%>
						<div class="row">
							<%//for(int i = 0; i < 5; i++){ 
								if(rs.next()){%>
								<div class="column">
									<div class="column_content">
										<div class="matricula"><h2><%=rs.getString("matricula").toUpperCase() %></h2></div>
										<h3><%=rs.getString("numBastidor")%></h3>
										<table>
											<tr><th>Color:</th><td><%=rs.getString("color") %></td></tr>
											<tr><th>Número de Serie:</th><td><%=rs.getString("numSerie") %></td></tr>
										</table>
									</div>
								</div>
								<%}else{
									repetir = false;
									break;
								}
							//} %>
						</div>
						<%
					}
					break;
				case "camiones":
					rs = conn.getCamiones();
					repetir = true;
					while(repetir){
						%>
						<div class="row">
							<%for(int i = 0; i < 5 ; i++){ 
								if(rs.next()){%>
								<div class="column">
									<div class="column_content">
										<div class="matricula"><h2><%=rs.getString("matricula").toUpperCase() %></h2></div>
										<h3><%=rs.getString("numBastidor")%></h3>
										<table>
											<tr><th>Color:</th><td><%=rs.getString("color") %></td></tr>
											<tr><th>Número de Serie:</th><td><%=rs.getString("numSerie") %></td></tr>
										</table>
									</div>
								</div>
								<%}else{
									repetir = false;
									break;
								}
							} %>
						</div>
						<%
					}
					break;
				case "vehiculos":
					rs = conn.getVehiculos();
					repetir = true;
					while(repetir){
						%>
						<div class="row">
							<%for(int i = 0; i < 5; i++){ 
								if(rs.next()){%>
								<div class="column">
									<div class="column_content">
										<div class="matricula"><h2><%=rs.getString("matricula").toUpperCase() %></h2></div>
										<h3><%=rs.getString("numBastidor")%></h3>
										<table>
											<tr><th>Color:</th><td><%=rs.getString("color") %></td></tr>
											<tr><th>Número de Serie:</th><td><%=rs.getString("numSerie") %></td></tr>
										</table>
									</div>
								</div>
								<%}else{
									repetir = false;
									break;
								}
							} %>
						</div>
						<%
					}
					break;
				}
			}
				conn.close();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		
	%>
	</section>
</body>
</html>