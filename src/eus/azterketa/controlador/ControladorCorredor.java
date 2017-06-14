package eus.azterketa.controlador;

import java.util.ArrayList;

import eus.azterketa.modelo.*;

public class ControladorCorredor {

	private ModeloCorredor modeloCorredor;

	public ControladorCorredor() {
		super();
		modeloCorredor = new ModeloCorredor();

	}

	public ArrayList<Corredor> seleccionarTodos() throws Exception {

		ArrayList<Corredor> corredores;
		try {
			corredores = modeloCorredor.seleccionarCorredores();
			return corredores;
		} catch (Exception e) {
			throw e;
		}
	}

	public ArrayList<Corredor> seleccionarPorEquipo(int idEquipo) throws Exception {

		ArrayList<Corredor> corredores;
		try {
			corredores = modeloCorredor.seleccionarPorEquipo(idEquipo);
			return corredores;
		} catch (Exception e) {
			throw e;
		}
	}
	
	
	public boolean comprobar(String nombre) throws Exception {

		try {
			String izena = nombre.substring(0, nombre.indexOf(","));
			String apellido = nombre.substring(nombre.indexOf(",") + 1);

			boolean existe = modeloCorredor.comprobarNombre(izena, apellido);
			return existe;
		} catch (Exception e) {

			throw e;
		}
	}

	public int seleccionarIdPorNombre(String nombre) throws Exception {

		try {
			String izena = nombre.substring(0, nombre.indexOf(","));
			String apellido = nombre.substring(nombre.indexOf(",") + 1);

			int id = modeloCorredor.seleccionarIdPorNombre(izena, apellido);
			return id;
		} catch (Exception e) {

			throw e;
		}
	}

	public void borrarCorredor(int idCorredor) throws Exception {

		try {
			modeloCorredor.borrarCorredor(idCorredor);

		} catch (Exception e) {

			throw e;

		}
	}

}