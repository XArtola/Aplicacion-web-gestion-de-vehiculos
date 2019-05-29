/**
 * 
 */
package com.zubiri.concesionario;

/**
 * @author ik013043z1
 *
 */
public class Vehiculo {
	
	private String matricula;
	private String numBastidor;
	private float precio;
	private String color;
	private Serie serie;
	private String estado;
	private int numAsientos;
	private String tipo;
	
	public String getMatricula() {
		return matricula;
	}
	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}
	public String getNumBastidor() {
		return numBastidor;
	}
	public void setNumBastidor(String numBastidor) {
		this.numBastidor = numBastidor;
	}
	public float getPrecio() {
		return precio;
	}
	public void setPrecio(float precio) {
		this.precio = precio;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public Serie getSerie() {
		return serie;
	}
	public void setSerie(Serie serie) {
		this.serie = serie;
	}
	public int getNumAsientos() {
		return numAsientos;
	}
	public void setNumAsientos(int numAsientos) {
		this.numAsientos = numAsientos;
	}
	public String getEstado() {
		return estado;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public void setEstado(String estado){
			this.estado = estado;
	}
	
}
