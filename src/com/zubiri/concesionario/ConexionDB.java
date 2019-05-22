package com.zubiri.concesionario;

import java.sql.*;

public class ConexionDB {

	private Connection conn;
	private Statement st;
	private CallableStatement cst;

	public Statement getStatement() {
		return st;
	}

	public void setStatement(Statement st) {
		this.st = st;
	}

	public void connect() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String jdbcUrl = "jdbc:mysql://localhost:3306/vehiculosdb?useSSL=false&serverTimezone=UTC";
		conn = DriverManager.getConnection(jdbcUrl, "admin_vehiculos", "1234");
	}

	public void connect(String ip, String database, String username, String password)
			throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://" + ip + ":3306/" + database + "?user=" + username
				+ "&password=" + password + "&serverTimezone=UTC&useSSL=false");
		setStatement(conn.createStatement());
	}
	public void close() throws SQLException {
		conn.close();
	}
	
	public ResultSet getVehiculos() throws SQLException {
		cst = conn.prepareCall("call getVehiculos()");
		return cst.executeQuery();
	}

	public ResultSet getCoches() throws SQLException {
		cst = conn.prepareCall("call getCoches()");  
		return cst.executeQuery();
	}

	public ResultSet getCamiones() throws SQLException {
		cst = conn.prepareCall("call getCamiones()");
		return cst.executeQuery();
	}

	public Coche getCoche(String numBastidor) throws SQLException, Exception {
		Coche coche = new Coche();
		ResultSet rs = cst.executeQuery("call getCoche('"+numBastidor+"')");
		coche.setMatricula(rs.getString("matricula"));
		coche.setNumBastidor(rs.getString("numBastidor"));
		coche.setColor(rs.getString("color"));
		coche.setNumAsientos(rs.getInt("numAsientos"));
		coche.setPrecio(rs.getFloat("precio"));
		coche.setSerie(Integer.toString(rs.getInt("numSerie")));
		coche.setEstado(rs.getString("estado"));
		coche.setNumPuertas(rs.getInt("numPuertas"));
		coche.setCapacidadMaletero(rs.getFloat("capacidadMaletero"));
		return coche;
	}

	public Camion getCamion(String numBastidor) throws SQLException, Exception {
		Camion camion = new Camion();
		ResultSet rs = cst.executeQuery("call getCamion(" + numBastidor + ")");
		camion.setMatricula(rs.getString("matricula"));
		camion.setNumBastidor(rs.getString("numBastidor"));
		camion.setColor(rs.getString("color"));
		camion.setNumAsientos(rs.getInt("numAsientos"));
		camion.setPrecio(rs.getFloat("precio"));
		camion.setSerie(Integer.toString(rs.getInt("numSerie")));
		camion.setEstado(rs.getString("estado"));
		camion.setCarga(rs.getFloat("carga"));
		camion.setTipoMercancia(rs.getString("tipoMercancia").charAt(0));
		return camion;
	}

	public void insertarCoche(Coche coche) throws SQLException {
		cst = conn.prepareCall("call insertarCoche('" + coche.getMatricula().toUpperCase() + "','" + coche.getNumBastidor() + "','"
				+ coche.getColor() + "'," + coche.getNumAsientos() + "," + coche.getPrecio() + "," + Integer.parseInt(coche.getSerie())
				+ ",'disponible','coche'," + coche.getNumPuertas() + "," + coche.getCapacidadMaletero() + ");");
		cst.execute();
	}

	public void insertarCamion(Camion camion) throws SQLException {
		cst = conn.prepareCall("call insertarCamion(" + camion.getMatricula().toUpperCase() + "','" + camion.getNumBastidor() + "','"
				+ camion.getColor() + "'," + camion.getNumAsientos() + "," + camion.getPrecio() + ",'"
				+ camion.getSerie() + "','" + camion.getEstado() + "'," + camion.getCarga() + ",'"
				+ camion.getTipoMercancia() + "');");
		cst.execute();
	}

	public void modificarCoche(String numBastidor, Coche coche) throws SQLException {
		st.executeUpdate("update vehiculos set matricula='" + coche.getMatricula() + "', numBastidor='"
				+ coche.getNumBastidor() + "', color='" + coche.getColor() + "', numAsigentos=" + coche.getNumAsientos()
				+ ", precio=" + coche.getPrecio() + ", serie='" + coche.getSerie() + "', estado='" + coche.getEstado()
				+ "where numBastidor='" + numBastidor + ";");
		st.executeUpdate("update coches set numPuertas='" + coche.getNumPuertas() + 
						 "', capacidadMaletero='" + coche.getCapacidadMaletero()+"' where numBastidor='"+numBastidor+"'");
	}

	public void modificarCamion(String numBastidor, Camion camion) throws SQLException {
		st.executeUpdate("update camiones set matricula='" + camion.getMatricula() + "', numBastidor='"
				+ camion.getNumBastidor() + "', color='" + camion.getColor() + "', numAsigentos="
				+ camion.getNumAsientos() + ", precio=" + camion.getPrecio() + ", serie='" + camion.getSerie()
				+ "', estado='" + camion.getEstado() + "', carga=" + camion.getCarga() + ", tipoMercancia='"
				+ camion.getTipoMercancia() + "' where numBastidor='" + numBastidor + "';");
		st.executeUpdate("update from camiones set carga='"+ camion.getCarga()+ "', tipoMercancia='" 
				+ camion.getTipoMercancia() + "' where numBastidor='" + numBastidor + "'");
	}

	public void eliminarVehiculo(String numBastidor) throws SQLException {
		st.executeUpdate("delete from vehiculos where numBastidor='" + numBastidor + "';");
	}

}
