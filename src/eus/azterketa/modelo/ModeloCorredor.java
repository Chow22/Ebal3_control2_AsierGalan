package eus.azterketa.modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import eus.azterketa.modelo.Conectar;

public class ModeloCorredor extends Conectar {

	public ModeloCorredor() {
		super();
	}

	public ArrayList<Corredor> seleccionarCorredores() throws Exception {
		PreparedStatement pst;
		Corredor corredor;

		try {
			pst = cn.prepareStatement("SELECT  * FROM Corredor ");

			ResultSet rs = pst.executeQuery();// ejecuta

			// pasar de ResultSet a ArrayList

			ArrayList<Corredor> corredores = new ArrayList<>();
			while (rs.next()) {
				corredor = new Corredor();
				corredor.setId(rs.getInt(1));
				corredor.setNombre(rs.getString(2));
				corredor.setApellido(rs.getString(3));
				corredor.setEquipo(rs.getString(4));

				corredores.add(corredor);
			}
			return corredores;

		} catch (Exception e) {
			throw e;
		}
	}
	
	public ArrayList<Corredor> seleccionarPorEquipo(int idEquipo) throws Exception {
		PreparedStatement pst;
		Corredor corredor;

		try {
			pst = cn.prepareStatement("SELECT ID,NOMBRE,APELLIDO FROM CORREDOR WHERE EQUIPO IN(SELECT NOMBRE FROM EQUIPO WHERE ID=?)");

			pst.setInt(1, idEquipo);
			
			ResultSet rs = pst.executeQuery();// ejecuta

			// pasar de ResultSet a ArrayList

			ArrayList<Corredor> corredores = new ArrayList<>();
			while (rs.next()) {
				corredor = new Corredor();
				corredor.setId(rs.getInt(1));
				corredor.setNombre(rs.getString(2));
				corredor.setApellido(rs.getString(3));

				corredores.add(corredor);
			}
			return corredores;

		} catch (Exception e) {
			throw e;
		}
	}
	public boolean comprobarNombre(String izena, String apellido) throws Exception{

			PreparedStatement pst;
			Corredor corredor = new Corredor();
			try {

				pst = cn.prepareStatement("SELECT id FROM corredor WHERE nombre=? AND apellido=?");

				pst.setString(1, izena);
				pst.setString(2, apellido);

				ResultSet rs = pst.executeQuery();

				while (rs.next()) {
					corredor.setId(rs.getInt(1));
					
					return true;
				}
			} catch (Exception e) {

				throw e;
			}

			return false;

		
	}
	public int seleccionarIdPorNombre(String izena, String apellido) throws Exception{

		PreparedStatement pst;
		Corredor corredor = new Corredor();
		try {

			pst = cn.prepareStatement("SELECT id FROM corredor WHERE nombre=? AND apellido=?");

			pst.setString(1, izena);
			pst.setString(2, apellido);

			ResultSet rs = pst.executeQuery();

			rs.next();
			
			return(rs.getInt(1));
	} catch (Exception e) {

			throw e;
		}

	
}
	public void borrarCorredor(int idCorredor) throws Exception{

			PreparedStatement pst;

			try {
				pst = cn.prepareStatement("DELETE FROM CORREDOR WHERE id=?");
				pst.setInt(1, idCorredor);

				int count = pst.executeUpdate();


			} catch (Exception e) {
				throw e;

			}

		}
	
}
