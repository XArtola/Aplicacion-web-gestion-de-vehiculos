<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.zubiri.concesionario.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>MariCARmen &copy</title>
	<link rel="stylesheet" type="text/css" href="./css/estilos.css">
	<link href="https://fonts.googleapis.com/css?family=Cinzel|Julius+Sans+One|Noto+Sans|Raleway&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	      rel="stylesheet">
	<script type="text/javascript" src="./lib/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="./js/script.js"></script>
</head>
<body>
	<header>
		<h1>MariCARmen <sup>&copy</sup></h1>
	</header>
	<nav>
		<ul>
			<li><a href="index.jsp?seleccion=vehiculos&formato=<%=request.getParameter("formato") %>">Todos los vehículos</a></li>
			<li><a href="index.jsp?seleccion=coches&formato=<%=request.getParameter("formato") %>">Coches</a></li>
			<li><a href="index.jsp?seleccion=camiones&formato=<%=request.getParameter("formato") %>">Camiones</a></li>
			<li style="float: right; margin-right:20px;" id="more"><a><i class="material-icons">more_horiz</i></a></li>
			<li style="float: right;"><a href="insertar.jsp?seleccion=<%=request.getParameter("seleccion")%>"><i class="material-icons">add</i></a></li>
			<%if(request.getParameter("formato").equals("lista")){ %>
				<li style="float:right;"><a href="index.jsp?formato=modulo&seleccion=<%=request.getParameter("seleccion") %>"><i class="material-icons">view_module</i></a></li>
			<%}else{%>
				<li style="float:right;"><a href="index.jsp?formato=lista&seleccion=<%=request.getParameter("seleccion") %>"><i class="material-icons">view_list</i></a></li>
				<%
			}%>
		</ul>
		<form class="colorPicker">
			<input type="color" list="presetColors">
			<datalist id="presetColors">
			   <option>#FFFFFF</option>
			   <option>#000000</option>
			   <option>#0000FF</option>
			   <option>#FFFF00</option>
			   <option>#FF0000</option>
			   <option>#00FF00</option>
			</datalist>
			<input type="submit" value="Filtrar por color">
		</form>
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
	<article>
		<table class="lista">
			<tr>
				<th></th>
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
			<tr ondblclick="window.location='info.jsp?seleccion=<%=rs.getString("tipo")%>&numBastidor=<%=rs.getString("numBastidor")%>';">
				<td><img src="./img/<%= conn.getSerie(rs.getInt("numserie")).getMarca()%>.png"/></td>
				<td><%=rs.getString("matricula")%></td>
				<td><%=rs.getString("numBastidor")%></td>
				<td> <div class="color" style="background-color:<%=rs.getString("color")%>;"></div></td>
				<td><%=rs.getInt("numAsientos")%></td>
				<td><%=rs.getFloat("precio")%></td>
				<td><%=rs.getInt("numSerie")%>
				<td><%=rs.getFloat("carga")%></td>
				<td><%=rs.getString("tipoMercancia").charAt(0) %></td>
				<td><a href="vender.jsp?numBastidor=<%=rs.getString("numBastidor")%>&formato=<%=request.getParameter("formato")%>&seleccion=<%=request.getParameter("seleccion")%>"><i class="material-icons">monetization_on</i></a></td>
			</tr>
			<%
				}
			%>
		</table>
		</article>
		</section>
		<%
			break;
				case "coches":
					rs = conn.getCoches();
		%>
		<section>
		<article>
		<table class="lista">
			<tr>
				<th></th>
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
			<tr ondblclick="window.location='info.jsp?seleccion=<%=rs.getString("tipo")%>&numBastidor=<%=rs.getString("numBastidor")%>';">
				<td><img src="./img/<%= conn.getSerie(rs.getInt("numserie")).getMarca()%>.png"/></td>
				<td><%=rs.getString("matricula")%></td>
				<td><%=rs.getString("numBastidor")%></td>
				<td> <div class="color" style="background-color:<%=rs.getString("color")%>;"></div></td>
				<td><%=rs.getInt("numAsientos")%></td>
				<td><%=rs.getFloat("precio")%></td>
				<td><%=rs.getInt("numSerie")%>
				<td><%=rs.getInt("numPuertas")%></td>
				<td><%=rs.getFloat("capacidadMaletero")%></td>
				<td><a href="vender.jsp?numBastidor=<%=rs.getString("numBastidor")%>&formato=<%=request.getParameter("formato")%>&seleccion=<%=request.getParameter("seleccion")%>"><i class="material-icons">monetization_on</i></a></td>
			</tr>
			<%
				}
			%>
		</table>
		</article>
		</section>
		<%
			break;
				case "vehiculos":
					rs = conn.getVehiculos();
					%>
					<section>
					<article class="max-content">
					<table class="lista">
						<tr>
							<th></th>
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
						<tr ondblclick="window.location='info.jsp?seleccion=<%=rs.getString("tipo")%>&numBastidor=<%=rs.getString("numBastidor")%>';">
							<td><img src="./img/<%= conn.getSerie(rs.getInt("numserie")).getMarca()%>.png"/></td>
							<td><%=rs.getString("matricula")%></td>
							<td><%=rs.getString("numBastidor")%></td>
							<td> <div class="color" style="background-color:<%=rs.getString("color")%>;"></div></td>
							<td><%=rs.getInt("numAsientos")%></td>
							<td><%=rs.getFloat("precio")%></td>
							<td><%=rs.getInt("numSerie")%></td>
							<td colspan=2 class="tipo">
								<%if(rs.getString("tipo").equals("coche")){ %>
									<i class="material-icons">directions_car</i>
								<%}else if(rs.getString("tipo").equals("camion")){ %>
									<i class="material-icons">local_shipping</i>
								<%} %>
							</td>
							<td><a href="vender.jsp?numBastidor=<%=rs.getString("numBastidor")%>&formato=<%=request.getParameter("formato")%>&seleccion=<%=request.getParameter("seleccion")%>"><i class="material-icons">monetization_on</i></td></a>
						</tr>
						<%
							}
						%>
					</table>
					</article>
					</section>
					<%
			break;
				}
			}else{
				switch(request.getParameter("seleccion")){
				case "coches":
					rs = conn.getCoches();
					boolean repetir = true;
					%>
						<%
						while(repetir){
							if(rs.next()){%>
								<div class="column" onclick="window.location='info.jsp?seleccion=<%=rs.getString("tipo")%>&numBastidor=<%=rs.getString("numBastidor")%>';">
									<div class="column_content">
										<div class="matricula"><h2><%=rs.getString("matricula").toUpperCase() %></h2></div>
										<h3><%=rs.getString("numBastidor")%></h3>
										<img src="./img/<%= conn.getSerie(rs.getInt("numserie")).getMarca()%>.png"/>
										<table class="module_table">
											<tr><th>Color:</th><td> <div class="color" style="background-color:<%=rs.getString("color")%>;"></div></td></tr>
											<tr><th>Número de Serie:</th><td><%=rs.getString("numSerie") %></td></tr>
										</table>
										<div class="tipo">
											<i class="material-icons">directions_car</i>
											<a href="vender.jsp?numBastidor=<%=rs.getString("numBastidor")%>&formato=<%=request.getParameter("formato")%>&seleccion=<%=request.getParameter("seleccion")%>"><i class="material-icons">monetization_on</i></a>
										</div>
									</div>
								</div>
								<%}else{
									repetir = false;
									break;
								}%>
							<%
						}
						%>
					</div>
					<%
					break;
				case "camiones":
					rs = conn.getCamiones();
					repetir = true;
					while(repetir){
						if(rs.next()){%>
							<div class="column" onclick="window.location='info.jsp?seleccion=<%=rs.getString("tipo")%>&numBastidor=<%=rs.getString("numBastidor")%>';">
								<div class="column_content">
									<div class="matricula"><h2><%=rs.getString("matricula").toUpperCase() %></h2></div>
									<h3><%=rs.getString("numBastidor")%></h3>
									<img src="./img/<%= conn.getSerie(rs.getInt("numserie")).getMarca()%>.png"/>
									<table class="module_table">
										<tr><th>Color:</th><td> <div class="color" style="background-color:<%=rs.getString("color")%>;"></div></td></tr>
										<tr><th>Número de Serie:</th><td><%=rs.getString("numSerie") %></td></tr>
									</table>
									<div class="tipo">
										<i class="material-icons">local_shipping</i>
										<a href="vender.jsp?numBastidor=<%=rs.getString("numBastidor")%>&formato=<%=request.getParameter("formato")%>&seleccion=<%=request.getParameter("seleccion")%>"><i class="material-icons">monetization_on</i></a>
									</div>
								</div>
							</div>
							<%}else{
								repetir = false;
								break;
							}%>
						<%
					}
					break;
				case "vehiculos":
					rs = conn.getVehiculos();
					repetir = true;
					while(repetir){
						if(rs.next()){%>
						<div class="column" onclick="window.location='info.jsp?seleccion=<%=rs.getString("tipo")%>&numBastidor=<%=rs.getString("numBastidor")%>';">
							<div class="column_content">
								<div class="matricula"><h2><%=rs.getString("matricula").toUpperCase() %></h2></div>
								<h3><%=rs.getString("numBastidor")%></h3>
 								<img src="./img/<%= conn.getSerie(rs.getInt("numserie")).getMarca()%>.png"/>
								<table class="module_table">
									<tr><th>Color:</th><td> <div class="color" style="background-color:<%=rs.getString("color")%>;"></div></td></tr>
									<tr><th>Número de Serie:</th><td><%=rs.getString("numSerie") %></td></tr>
								</table>
								<div class="tipo">
									<%if(rs.getString("tipo").equals("coche")){ %>
										<i class="material-icons">directions_car</i>
									<%}else if(rs.getString("tipo").equals("camion")){ %>
										<i class="material-icons">local_shipping</i>
									<%} %>
									<a href="vender.jsp?numBastidor=<%=rs.getString("numBastidor")%>&formato=<%=request.getParameter("formato")%>&seleccion=<%=request.getParameter("seleccion")%>"><i class="material-icons">monetization_on</i></a>
								</div>
							</div>
						</div>
						<%}else{
							repetir = false;
							break;
						}
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
	</article>
	
</body>
</html>