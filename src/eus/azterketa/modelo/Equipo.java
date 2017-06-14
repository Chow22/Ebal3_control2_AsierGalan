package eus.azterketa.modelo;

public class Equipo {
	int id;
	String nombre;
	String director;
	String presupuesto;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getPresupuesto() {
		return presupuesto;
	}
	public void setPresupuesto(String presupuesto) {
		this.presupuesto = presupuesto;
	}
	public Equipo(int id, String nombre, String director, String presupuesto) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.director = director;
		this.presupuesto = presupuesto;
	}
	public Equipo() {
		super();
	}
	
	
	
}
