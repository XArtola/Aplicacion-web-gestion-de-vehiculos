package com.zubiri.concesionario;

import java.sql.*;


public class ConexionDB {
	
	private Connection conn;
	private Statement st;

	public void connect() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/matchesdb?user=dw18&password=dw18&serverTimezone=UTC&useSSL=false");
		st = conn.createStatement();
	}
	
	
}
