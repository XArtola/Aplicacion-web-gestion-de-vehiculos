<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.zubiri.concesionario.*"%>
<%
	ConexionDB conn = new ConexionDB();
	conn.connect();
	conn.eliminarVehiculo(request.getParameter("numBastidor"));
	response.sendRedirect("index.jsp?formato="+request.getParameter("formato")+"&seleccion="+request.getParameter("seleccion"));
	conn.close();
%>