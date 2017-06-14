package eus.azterketa.modelo;

public class Corredor {
	private int id;
	private String nombre;
	private String apellido;
	private String equipo;
	public Corredor(int id, String nombre, String apellido, String equipo) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.apellido = apellido;
		this.equipo = equipo;
	}
	public Corredor() {
		super();
	}
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
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getEquipo() {
		return equipo;
	}
	public void setEquipo(String equipo) {
		this.equipo = equipo;
	}

	

	

}
