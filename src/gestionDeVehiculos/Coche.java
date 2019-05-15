package gestionDeVehiculos;

public class Coche extends Vehiculo{
	
	private int numPuertas;
	private float capacidadMaletero;
	
	public Coche(int numPuertas, float capMaletero) {
		super();
		setCapacidadMaletero(capMaletero);
		setNumPuertas(numPuertas);
		
	}
	/**
	 * @return the numPuertas
	 */
	public int getNumPuertas() {
		return numPuertas;
	}
	/**
	 * @param numPuertas the numPuertas to set
	 */
	public void setNumPuertas(int numPuertas) {
		this.numPuertas = numPuertas;
	}
	/**
	 * @return the capacidadMaletero
	 */
	public float getCapacidadMaletero() {
		return capacidadMaletero;
	}
	/**
	 * @param capacidadMaletero the capacidadMaletero to set
	 */
	public void setCapacidadMaletero(float capacidadMaletero) {
		this.capacidadMaletero = capacidadMaletero;
	}

}
