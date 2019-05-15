/**
 * 
 */
package gestionDeVehiculos;

/**
 * @author ik013043z1
 *
 */
public class Camion extends Vehiculo{
	
	private float carga;
	private TipoMercancia mercancia;
	
	public Camion (float carga, TipoMercancia mercancia) {
		super();
		setCarga(carga);
		setMercancia(mercancia);
	}

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
	 * @return the mercancia
	 */
	public TipoMercancia getMercancia() {
		return mercancia;
	}

	/**
	 * @param mercancia the mercancia to set
	 */
	public void setMercancia(TipoMercancia mercancia) {
		this.mercancia = mercancia;
	}

}
