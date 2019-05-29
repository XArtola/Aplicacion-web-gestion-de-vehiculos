<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mysql.cj.jdbc.Driver"%>
<%@ page import="com.zubiri.concesionario.*"%>
<%if(request.getParameter("seleccion").equals("vehiculos")){
	response.sendRedirect("insertar.jsp?seleccion=coches");	
}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Inserción - MariCARmen</title>
	<link rel="stylesheet" type="text/css" href="./css/estilos.css">
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
	<nav>
		<ul>
			<li><a onclick="history.back();"><i class="material-icons">arrow_back</i></a></li>
			<li><a href="insertar.jsp?seleccion=coches">Coches</a></li>
			<li><a href="insertar.jsp?seleccion=camiones">Camiones</a></li>
			<li style="float: right; margin-right:20px;"><a href="index.jsp?seleccion=<%=request.getParameter("seleccion")%>&formato=modulo"><i class="material-icons">home</i></a></li>
		</ul>
	</nav>
	<datalist id="presetColors">
	   <option>#FFFFFF</option>
	   <option>#000000</option>
	   <option>#0000FF</option>
	   <option>#FFFF00</option>
	   <option>#FF0000</option>
	   <option>#00FF00</option>
	</datalist>
	<section>
	<article>
	<%
		try {
			ConexionDB con = new ConexionDB();
			con.connect();
			if (request.getParameter("confirmar") != null) {
				if (request.getParameter("seleccion").equals("coches")) {
					//creación de objecto para insertar en la base de datos
					Coche coche = new Coche();
					coche.setMatricula(request.getParameter("campo_matricula").toUpperCase());
					coche.setNumBastidor(request.getParameter("campo_numBastidor").toUpperCase());
					coche.setColor(request.getParameter("campo_color"));
					coche.setNumAsientos(Integer.parseInt(request.getParameter("campo_numAsientos")));
					coche.setPrecio(Float.parseFloat(request.getParameter("campo_precio")));
					coche.setSerie(con.getSerie(Integer.parseInt(request.getParameter("campo_serie"))));
					coche.setEstado("disponible");
					coche.setTipo("coche");
					coche.setNumPuertas(Integer.parseInt(request.getParameter("campo_numPuertas")));
					coche.setCapacidadMaletero(Float.parseFloat(request.getParameter("campo_capacidadMaletero")));
					//inserción en la base de datos
					con.insertarCoche(coche);%>
					<h1>Insertado correctamente</h1>
					<a href="index.jsp?seleccion=<%=request.getParameter("seleccion")%>&formato=modulo"><i class="material-icons">home</i></a>
					<%
				} else if (request.getParameter("seleccion").equals("camiones")) {
					//creación de objecto para insertar en la base de datos
					Camion camion = new Camion();
					camion.setMatricula(request.getParameter("campo_matricula").toUpperCase());
					camion.setNumBastidor(request.getParameter("campo_numBastidor").toUpperCase());
					camion.setColor(request.getParameter("campo_color"));
					camion.setNumAsientos(Integer.parseInt(request.getParameter("campo_numAsientos")));
					camion.setPrecio(Float.parseFloat(request.getParameter("campo_precio")));
					camion.setSerie(con.getSerie(Integer.parseInt(request.getParameter("campo_serie"))));
					camion.setEstado("disponible");
					camion.setTipo("camion");
					camion.setCarga(Float.parseFloat(request.getParameter("campo_carga")));
					camion.setTipoMercancia(request.getParameter("campo_tipoMercancia").charAt(0));
					//inserción en la base de datos
					con.insertarCamion(camion);
					%>
					<h1>Insertado correctamente</h1>
					<a href="index.jsp?seleccion=<%=request.getParameter("seleccion")%>&formato=modulo"><i class="material-icons">home</i></a>
					<%
				}
			
			//enseña un formulario de confirmación de los datos introducidos anteriormente
			} else if (request.getParameter("insertar") != null) {
				%>
				<section>
				<table>
					<form action="insertar.jsp" method="post">
						<tr>
							<td>Matrícula</td>
							<td><input type="text" readonly="readonly"
								name="campo_matricula"
								value="<%=request.getParameter("campo_matricula")%>"></td>
						</tr>
						<tr>
							<td>Número de bastidor</td>
							<td><input type="text" readonly="readonly"
								name="campo_numBastidor"
								value="<%=request.getParameter("campo_numBastidor")%>"></td>
						</tr>
						<tr>
							<td>Color</td>
							<td><input type="text" readonly="readonly" name="campo_color"
								value="<%=request.getParameter("campo_color")%>" style="background-color:<%=request.getParameter("campo_color")%>"></td>
						</tr>
						<tr>
							<td>Número de asientos</td>
							<td><input type="number" readonly="readonly"
								name="campo_numAsientos"
								value="<%=request.getParameter("campo_numAsientos")%>"></td>
						</tr>
			
						<tr>
							<td>Precio</td>
							<td><input type="number" step="0.5" readonly="readonly" name="campo_precio"
								value="<%=request.getParameter("campo_precio")%>"></td>
						</tr>
			
						<tr>
							<td>Serie</td>
							<td><input type="number" name="campo_serie" readonly="readonly"
								value="<%=request.getParameter("campo_serie")%>"></td>
						</tr>
						<%
						switch (request.getParameter("seleccion")) {
							case "coches":
								%>
								<tr>
									<td>Número de puertas</td>
									<td><input type="text" readonly="readonly"
										name="campo_numPuertas"
										value="<%=request.getParameter("campo_numPuertas")%>"></td>
								</tr>
								<tr>
									<td>Capacidad maletero</td>
									<td><input type="number" step="any" readonly="readonly"
										name="campo_capacidadMaletero"
										value="<%=request.getParameter("campo_capacidadMaletero")%>"></td>
								</tr>
								<%
							break;
							case "camiones":
								%>
								<tr>
									<td>Carga</td>
									<td><input type="number" step="0.5" readonly="readonly" name="campo_carga"
										value="<%=request.getParameter("campo_carga")%>"></td>
								</tr>
								<tr>
									<td>Tipo de mercancía</td>
									<td><input type="text" readonly="readonly"
										name="campo_tipoMercancia"
										value="<%=request.getParameter("campo_tipoMercancia")%>"></td>
								</tr>
								<%
							break;
						}
						%>
						<tr>
							<td><input type="submit" name="confirmar" value="Confirmar"></td>
							<td><input type="button" onclick="history.back();"
								value="Volver"></td>
						</tr>
						<input type="hidden" name="seleccion" value="<%=request.getParameter("seleccion")%>">
					</form>
				</table>
				</article>
				</section>
				<%
					//introduce los datos a la base de datos despues de haber confirmado
			
			} else {
			%>
			
			<form action="insertar.jsp" method="post">
				<h1>
					Insertar
					<%=request.getParameter("seleccion").toLowerCase()%></h1>
				<table>
					<tr>
						<td>Matrícula</td>
						<td><input type="text" name="campo_matricula" pattern="[0-9]{4}[A-Za-z]{3}" required></td>
					</tr>
					<tr>
						<td>Número de bastidor</td>
						<td><input type="text" maxlength=17 minlenght= 17 name="campo_numBastidor" pattern="[0-9a-zA-Z]{17}" required></td>
					</tr>
					<tr>
						<td>Color</td>
						<td><input type="color" name="campo_color" list="presetColors" required></td>
					</tr>
					<tr>
						<td>Número de asientos</td>
						<td><input type="number" name="campo_numAsientos" pattern="[2-9]" required></td>
					</tr>
		
					<tr>
						<td>Precio</td>
						<td><input type="number" step="0.5"  name="campo_precio" required></td>
					</tr>
		
					<tr>
						<td>Serie</td>
						<td><input type="number" name="campo_serie" pattern="[0-9]{3,4}" required></td>
					</tr>
					<%
					switch (request.getParameter("seleccion")) {
						case "coches":
							%>
							<tr>
								<td>Número de puertas</td>
								<td><input type="number" name="campo_numPuertas" pattern="[2-5]" required></td>
							</tr>
							<tr>
								<td>Capacidad maletero</td>
								<td><input type="number" step="any" name="campo_capacidadMaletero" required></td>
								
							</tr>
							<%
						break;
						case "camiones":
							%>
							<tr>
								<td>Carga</td>
								<td><input type="number" step="0.5" name="campo_carga" required></td>
							</tr>
							<tr>
								<td>Tipo de mercancía</td>
								<td><select name="campo_tipoMercancia" >
									<option value='G'>G</option>
									<option value='A'>A</option>
									<option value='P'>P</option>
								</select>
							</tr>
							<%
						break;
					}
						%>
					<tr>
						<td colspan=2><input type="submit" name="insertar"></td>
					</tr>
				</table>
				<input type="hidden" name="seleccion" value='<%=request.getParameter("seleccion") %>'></input>
			</form>
			<%
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	</section>
</body>
</html>