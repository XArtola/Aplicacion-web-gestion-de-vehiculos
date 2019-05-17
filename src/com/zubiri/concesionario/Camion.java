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

	/**
	 * @return the carga
	 */
	public float getCarga() {
		return carga;
	}

	/**
	 * @param carga the carga to set
	 */
	public void setCarga(float carga) {
		this.carga = carga;
	}

	/**
	 * @return the mercancía
	 */
	public Character getTipoMercancia() {
		return mercancia;
	}

	/**
	 * @param mercancia the mercancía to set
	 * @throws Exception 
	 */
	public void setTipoMercancia(Character mercancia) throws Exception {
		if(checkTipoMercancia(mercancia))
			this.mercancia = mercancia;
		else
			throw new Exception("tipo de mercancia no compatible");
	}
	
	public boolean checkTipoMercancia(Character tipoMercancia) {
		switch(Character.toUpperCase(tipoMercancia)) {
			case 'A': case 'G': case 'P':
				return true;
			default:
				return false;
		}
	}

}
