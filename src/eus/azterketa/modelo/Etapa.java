package eus.azterketa.modelo;

public class Etapa {
	
	private int id;
	private int km;
	private String salida;
	private String llegada;
	public Etapa() {
		super();
	}
	public Etapa(int id, int km, String salida, String llegada) {
		super();
		this.id = id;
		this.km = km;
		this.salida = salida;
		this.llegada = llegada;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getKm() {
		return km;
	}
	public void setKm(int km) {
		this.km = km;
	}
	public String getSalida() {
		return salida;
	}
	public void setSalida(String salida) {
		this.salida = salida;
	}
	public String getLlegada() {
		return llegada;
	}
	public void setLlegada(String llegada) {
		this.llegada = llegada;
	}
	
	
	
}
