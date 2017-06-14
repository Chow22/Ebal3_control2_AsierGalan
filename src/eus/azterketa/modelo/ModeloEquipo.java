package eus.azterketa.modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import eus.azterketa.modelo.Conectar;

public class ModeloEquipo extends Conectar {

	public ModeloEquipo() {
		super();
	}

	public ArrayList<Equipo> seleccionarEquipos() throws Exception {
		PreparedStatement pst;
		Equipo equipo;

		try {
			pst = cn.prepareStatement("SELECT  * FROM Equipo ");

			ResultSet rs = pst.executeQuery();// ejecuta

			// pasar de ResultSet a ArrayList

			ArrayList<Equipo> equipos = new ArrayList<>();
			while (rs.next()) {
				equipo = new Equipo();
				equipo.setId(rs.getInt(1));
				equipo.setNombre(rs.getString(2));
				equipo.setDirector(rs.getString(3));
				equipo.setPresupuesto(rs.getString(4));

				equipos.add(equipo);
			}
			return equipos;

		} catch (Exception e) {
			throw e;
		}
	}
	
	public ArrayList<Equipo> seleccionarEquipoPorId(int idEquipo) throws Exception {
		PreparedStatement pst;
		Equipo equipo;

		try {
			pst = cn.prepareStatement("SELECT  * FROM Equipo where id=?");
			
			pst.setInt(1, idEquipo);
			
			ResultSet rs = pst.executeQuery();// ejecuta

			// pasar de ResultSet a ArrayList

			ArrayList<Equipo> equiposSelec = new ArrayList<>();
			while (rs.next()) {
				equipo = new Equipo();
				equipo.setId(rs.getInt(1));
				equipo.setNombre(rs.getString(2));
				equipo.setDirector(rs.getString(3));
				equipo.setPresupuesto(rs.getString(4));

				equiposSelec.add(equipo);
			}
			return equiposSelec;

		} catch (Exception e) {
			throw e;
		}
	}
	
	
	public boolean comprobarNombre(String izena, String apellido) throws Exception{

			PreparedStatement pst;
			Equipo equipo = new Equipo();
			try {

				pst = cn.prepareStatement("SELECT id FROM equipo WHERE nombre=? AND apellido=?");

				pst.setString(1, izena);
				pst.setString(2, apellido);

				ResultSet rs = pst.executeQuery();

				while (rs.next()) {
					equipo.setId(rs.getInt(1));
					
					return true;
				}
			} catch (Exception e) {

				throw e;
			}

			return false;

		
	}
	public int seleccionarIdPorNombre(String izena, String apellido) throws Exception{

		PreparedStatement pst;
		Equipo equipo = new Equipo();
		try {

			pst = cn.prepareStatement("SELECT id FROM equipo WHERE nombre=? AND apellido=?");

			pst.setString(1, izena);
			pst.setString(2, apellido);

			ResultSet rs = pst.executeQuery();

			rs.next();
			
			return(rs.getInt(1));
	} catch (Exception e) {

			throw e;
		}

	
}
	public void borrarEquipo(int idEquipo) throws Exception{

			PreparedStatement pst;

			try {
				pst = cn.prepareStatement("DELETE FROM CORREDOR WHERE id=?");
				pst.setInt(1, idEquipo);

				int count = pst.executeUpdate();


			} catch (Exception e) {
				throw e;

			}

		}
	
}
