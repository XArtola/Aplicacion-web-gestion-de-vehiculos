<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mysql.cj.jdbc.Driver"%>
<%@ page import="com.zubiri.concesionario.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Inserción - Concesionarios Manoli</title>
	<style>
		<%@ include file="/WEB-INF/css/estilos.css"%>
	</style>
	<link href="https://fonts.googleapis.com/css?family=Cinzel&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
</head>
<body>
<a href="index.jsp?seleccion=<%=request.getParameter("seleccion") %>&formato=modulo">
<header>
<h1>Concesionarios Manoli</h1>
</header>
</a>
	<nav>
		<ul>
			<li><a href="insertar.jsp?seleccion=coche">Coche</a></li>
			<li><a href="insertar.jsp?seleccion=camion">Camion</a></li>
		</ul>
	</nav>
	<aside>
		<a href="index.jsp?seleccion=<%=request.getParameter("seleccion") %>&formato=modulo"><i class="material-icons">home</i></a>
	</aside>
	<section>
	<%
		try {
			ConexionDB con = new ConexionDB();
			con.connect();
			if (request.getParameter("confirmar") != null) {
				if (request.getParameter("seleccion").equals("coche")) {
					//creación de objecto para insertar en la base de datos
					Coche coche = new Coche();
					coche.setMatricula(request.getParameter("campo_matricula"));
					coche.setNumBastidor(request.getParameter("campo_numBastidor"));
					coche.setColor(request.getParameter("campo_color"));
					coche.setNumAsientos(Integer.parseInt(request.getParameter("campo_numAsientos")));
					coche.setPrecio(Float.parseFloat(request.getParameter("campo_precio")));
					coche.setSerie(request.getParameter("campo_serie"));
					coche.setTipo("coche");
					coche.setNumPuertas(Integer.parseInt(request.getParameter("campo_numPuertas")));
					coche.setCapacidadMaletero(Integer.parseInt(request.getParameter("campo_capacidadMaletero")));
					//inserción en la base de datos
					con.insertarCoche(coche);
					%>
					<h1>Insertado correctamente</h1>
					<a href="index.jsp">Inicio</a>
					<%
				} else if (request.getParameter("seleccion").equals("camion")) {
					//creación de objecto para insertar en la base de datos
					Camion camion = new Camion();
					camion.setMatricula(request.getParameter("campo_matricula"));
					camion.setNumBastidor(request.getParameter("campo_numBastidor"));
					camion.setColor(request.getParameter("campo_Color"));
					camion.setNumAsientos(Integer.parseInt(request.getParameter("campo_numAsientos")));
					camion.setPrecio(Float.parseFloat(request.getParameter("campo_precio")));
					camion.setSerie(request.getParameter("campo_serie"));
					camion.setTipo("camion");
					camion.setCarga(Float.parseFloat(request.getParameter("campo_carga")));
					camion.setTipoMercancia(request.getParameter("campo_tipoMercancia").charAt(0));
					//inserción en la base de datos
					con.insertarCamion(camion);
					%>
					<h1>Insertado correctamente</h1>
					<a href="index.jsp">Inicio</a>
					<%
				}
			
			//enseña un formulario de confirmación de los datos introducidos anteriormente
			} else if (request.getParameter("insertar") != null) {
				%>
				<section>
				<table>
					<form action="insertar.jsp" method="get">
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
								value="<%=request.getParameter("campo_color")%>"></td>
						</tr>
						<tr>
							<td>Número de asientos</td>
							<td><input type="number" readonly="readonly"
								name="campo_numAsientos"
								value="<%=request.getParameter("campo_numAsientos")%>"></td>
						</tr>
			
						<tr>
							<td>Precio</td>
							<td><input type="number" step="any" readonly="readonly" name="campo_precio"
								value="<%=request.getParameter("campo_precio")%>"></td>
						</tr>
			
						<tr>
							<td>Serie</td>
							<td><input type="text" readonly="readonly" name="campo_serie"
								value="<%=request.getParameter("campo_serie")%>"></td>
						</tr>
						<%
						switch (request.getParameter("seleccion")) {
							case "coche":
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
									<input type="hidden" name="seleccion" value="coche">
								</tr>
								<%
							break;
							case "camion":
								%>
								<tr>
									<td>Carga</td>
									<td><input type="number" step="any" readonly="readonly" name="campo_carga"
										value="<%=request.getParameter("campo_carga")%>"></td>
								</tr>
								<tr>
									<td>Tipo de mercancía</td>
									<td><input type="text" readonly="readonly"
										name="campo_tipoMercancia"
										value="<%=request.getParameter("campo_tipoMercancia")%>"></td>
									<input type="hidden" name="seleccion" value="camion">
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
					</form>
				</table>
				</section>
				<%
					//introduce los datos a la base de datos despues de haber confirmado
			
			} else {
			%>
			
			<form action="insertar.jsp" method="get">
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
						<td><input type="text" name="campo_numBastidor" pattern="[0-9A-Z]{17}" required></td>
					</tr>
					<tr>
						<td>Color</td>
						<td><input type="text" name="campo_color" pattern="[A-Za-z]+" required></td>
					</tr>
					<tr>
						<td>Número de asientos</td>
						<td><input type="number" name="campo_numAsientos" pattern="[2-9]" required></td>
					</tr>
		
					<tr>
						<td>Precio</td>
						<td><input type="number" step="any"  name="campo_precio" required></td>
					</tr>
		
					<tr>
						<td>Serie</td>
						<td><input type="number" name="campo_serie" pattern="[0-9]{3,4}" required></td>
					</tr>
					<%
					switch (request.getParameter("seleccion")) {
						case "coche":
							%>
							<tr>
								<td>Número de puertas</td>
								<td><input type="number" name="campo_numPuertas" pattern="[2-5]" required></td>
							</tr>
							<tr>
								<td>Capacidad maletero</td>
								<td><input type="number" step="any" name="campo_capacidadMaletero" required></td>
								<input type="hidden" name="seleccion" value="coche">
							</tr>
							<%
						break;
						case "camion":
							%>
							<tr>
								<td>Carga</td>
								<td><input type="number" step="any"  name="campo_carga" required></td>
							</tr>
							<tr>
								<td>Tipo de mercancía</td>
								<td><input type="text" name="campo_tipoMercancia" pattern="[G|A|P]" required></td>
								<input type="hidden" name="seleccion" value="camion">
							</tr>
							<%
						break;
					}
						%>
					<tr>
						<td colspan=2><input type="submit" name="insertar"></td>
					</tr>
				</table>
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