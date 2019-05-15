package com.zubiri.concesionario;

import java.sql.*;


public class ConexionDB {
	
	private Connection conn;
	private Statement st;

	public Statement getStatement() {
		return st;
	}
	public void setStatement(Statement st) {
		this.st = st;
	}
	
	public void connect() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/matchesdb?user=admin_vehiculos&password=1234serverTimezone=UTC&useSSL=false");
		setStatement(conn.createStatement());
	}
	public void connect(String ip,String database,String username, String password) throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(
				"jdbc:mysql://"+ip+":3306/"+database+"?user="+username+"&password="+password+"&serverTimezone=UTC&useSSL=false");
		setStatement(conn.createStatement());
	}
	
}
