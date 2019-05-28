package com.zubiri.concesionario;

/**
 * @author Xabi A. Koldo, Nerea
 *
 */
public class Serie {
	
	private int numSerie;
	private String marca;
	private String modelo;
	private int fechaFabricacion;
	
	public int getNumSerie() {
		return numSerie;
	}
	public void setNumSerie(int numSerie) {
		this.numSerie = numSerie;
	}
	public String getMarca() {
		return marca;
	}
	public void setMarca(String marca) {
		this.marca = marca;
	}
	public int getFechaFabricacion() {
		return fechaFabricacion;
	}
	public void setFechaFabricacion(int fechaFabricacion) {
		this.fechaFabricacion = fechaFabricacion;
	}
	public String getModelo() {
		return modelo;
	}
	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

}