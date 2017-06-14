package eus.azterketa.controlador;

import java.util.ArrayList;

import eus.azterketa.modelo.*;

public class ControladorEquipo {

	private ModeloEquipo modeloEquipo;

	public ControladorEquipo() {
		super();
		modeloEquipo = new ModeloEquipo();

	}

	public ArrayList<Equipo> seleccionarEquipos() throws Exception {

		ArrayList<Equipo> equipos;
		try {
			equipos = modeloEquipo.seleccionarEquipos();
			return equipos;
		} catch (Exception e) {
			throw e;
		}
	}

	public ArrayList<Equipo> seleccionarEquipoPorId(int idEquipo) throws Exception {

		ArrayList<Equipo> equiposSelec;
		try {
			equiposSelec = modeloEquipo.seleccionarEquipoPorId(idEquipo);
			return equiposSelec;
		} catch (Exception e) {
			throw e;
		}
	}
	
	public boolean comprobar(String nombre) throws Exception {

		try {
			String izena = nombre.substring(0, nombre.indexOf(","));
			String apellido = nombre.substring(nombre.indexOf(",") + 1);

			boolean existe = modeloEquipo.comprobarNombre(izena, apellido);
			return existe;
		} catch (Exception e) {

			throw e;
		}
	}

	public int seleccionarIdPorNombre(String nombre) throws Exception {

		try {
			String izena = nombre.substring(0, nombre.indexOf(","));
			String apellido = nombre.substring(nombre.indexOf(",") + 1);

			int id = modeloEquipo.seleccionarIdPorNombre(izena, apellido);
			return id;
		} catch (Exception e) {

			throw e;
		}
	}

	public void borrarEquipo(int idEquipo) throws Exception {

		try {
			modeloEquipo.borrarEquipo(idEquipo);

		} catch (Exception e) {

			throw e;

		}
	}

}