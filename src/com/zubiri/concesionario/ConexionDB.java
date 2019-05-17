package com.zubiri.concesionario;

import java.sql.*;

public class ConexionDB {
	
	private Connection conn;
	private Statement st;
	private PreparedStatement pst;


	public Statement getStatement() {
		return st;
	}
	public void setStatement(Statement st) {
		this.st = st;
	}
	
	public void connect() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/vehiculosdb?user=admin_vehiculos&password=1234serverTimezone=UTC&useSSL=false");
		setStatement(conn.createStatement());
	}
	public void connect(String ip,String database,String username, String password) throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(
				"jdbc:mysql://"+ip+":3306/"+database+"?user="+username+"&password="+password+"&serverTimezone=UTC&useSSL=false");
		setStatement(conn.createStatement());
	}
	
	public ResultSet getVehiculos() throws SQLException{
		return st.executeQuery("select * from vehiculos");
	}
	
	public ResultSet getCoches() throws SQLException{
		return st.executeQuery("select * from coches");
	}
	
	public ResultSet getCamiones() throws SQLException{
		return st.executeQuery("select * from camiones");
	}
	
	public Coche getCoche(String numBastidor) throws SQLException, Exception {
		Coche coche = new Coche();
		ResultSet rs = st.executeQuery("select * from vehiculos where numBastidor='"+numBastidor+"';");
		coche.setMatricula(rs.getString("matricula"));
		coche.setNumBastidor(rs.getString("numBastidor"));
		coche.setColor(rs.getString("color"));
		coche.setNumAsientos(rs.getInt("numAsientos"));
		coche.setPrecio(rs.getFloat("precio"));
		rs = st.executeQuery("select * from coches where numBastidor = '"+numBastidor+"';");
		coche.setSerie(rs.getString("serie"));
		coche.setEstado(rs.getString("estado"));
		coche.setNumPuertas(rs.getInt("numPuertas"));
		coche.setCapacidadMaletero(rs.getFloat("capacidadMaletero"));
		return coche;
	}
	
	public Camion getCamion(String numBastidor) throws SQLException, Exception {
		Camion camion = new Camion();
		ResultSet rs = st.executeQuery("select * from camion where numBastidor="+numBastidor+";");
		camion.setMatricula(rs.getString("matricula"));
		camion.setNumBastidor(rs.getString("numBastidor"));
		camion.setColor(rs.getString("color"));
		camion.setNumAsientos(rs.getInt("numAsientos"));
		camion.setPrecio(rs.getFloat("precio"));
		camion.setSerie(rs.getString("serie"));
		camion.setEstado(rs.getString("estado"));
		rs = st.executeQuery("select * from camiones where numBastidor = '"+numBastidor+"';");
		camion.setCarga(rs.getFloat("carga"));
		try {
			camion.setTipoMercancia(rs.getString("tipoMercancia").charAt(0));
			return camion;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public void insertarCoche(Coche coche) throws SQLException {
		st.executeUpdate("call insertarCoche('"+coche.getMatricula()+"','"
											   +coche.getNumBastidor()+"','"
											   +coche.getColor()+"',"
											   +coche.getNumAsientos()+","
										       +coche.getPrecio()+",'"
											   +coche.getSerie()+"','"
											   +coche.getEstado()+"',"
											   +coche.getNumPuertas()+","
											   +coche.getCapacidadMaletero()+");");
	}
	
	public void insertarCamion(Camion camion) throws SQLException {
		st.executeUpdate("call insertarCamion("+camion.getMatricula()+"','"
											   +camion.getNumBastidor()+"','"
										       +camion.getColor()+"',"
											   +camion.getNumAsientos()+","
											   +camion.getPrecio()+",'"
											   +camion.getSerie()+"','"
											   +camion.getEstado()+"',"
											   +camion.getCarga()+",'"
											   +camion.getTipoMercancia()+"');");
	}
	
	public void modificarCoche(String numBastidor, Coche coche) throws SQLException {
		st.executeUpdate("update coches set matricula='"+coche.getMatricula()+
						"', numBastidor='"+coche.getNumBastidor()+
						"', color='"+coche.getColor()+
						"', numAsigentos="+coche.getNumAsientos()+
						", precio="+coche.getPrecio()+
						", serie='"+coche.getSerie()+
						"', estado='"+coche.getEstado()+
						"', numPuertas="+coche.getNumPuertas()+
						", capacidadMaletero="+coche.getCapacidadMaletero()+
					 "where numBastidor='"+numBastidor+";");
	}
	
	public void modificarCamion(String numBastidor, Camion camion) throws SQLException {
		st.executeUpdate("update camiones set matricula='"+camion.getMatricula()+
						"', numBastidor='"+camion.getNumBastidor()+
						"', color='"+camion.getColor()+
						"', numAsigentos="+camion.getNumAsientos()+
						", precio="+camion.getPrecio()+
						", serie='"+camion.getSerie()+
						"', estado='"+camion.getEstado()+
						"', carga="+camion.getCarga()+
						", tipoMercancia='"+camion.getTipoMercancia()+
					 "' where numBastidor='"+numBastidor+";");
	}
	
	public void eliminarCoche(String numBastidor) throws SQLException {
		st.executeUpdate("delete from coches where numBastidor='"+numBastidor+"';");
	}
	
	public void eliminarCamion(String numBastidor) throws SQLException {
		st.executeUpdate("delete from camiones where numBastidor='"+numBastidor+"';");
	}
	
}
