<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.zubiri.concesionario.*"%>
<%
	ConexionDB conn = new ConexionDB();
	if(request.getParameter("seleccion").equals("coches")){
		conn.eliminarCoche(request.getParameter("numBastidor"));
	}else if (request.getParameter("seleccion").equals("camiones")){
		conn.eliminarCamion(request.getParameter("numBastidor"));
	}
	response.sendRedirect("index.jsp?formato="+request.getParameter("formato")+"&seleccion="+request.getParameter("seleccion"));
%>