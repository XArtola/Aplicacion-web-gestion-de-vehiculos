/**
 * 
 */
package com.zubiri.concesionario;

/**
 * @author ik013043z1
 *
 */
public class Camion extends Vehiculo{
	
	private float carga;
	private Character mercancia;

	public float getCarga() {
		return carga;
	}
	public void setCarga(float carga) {
		this.carga = carga;
	}
	public Character getTipoMercancia() {
		return mercancia;
	}
	public void setTipoMercancia(Character mercancia) {
		this.mercancia = mercancia;
	}
}
