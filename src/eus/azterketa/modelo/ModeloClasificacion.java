package eus.azterketa.modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class ModeloClasificacion extends Conectar{
	
	public ModeloClasificacion() {
		super();
	}
	
	public void insertar(Clasificacion clasificacion)  throws SQLException {
		// escribir la instruccion INSERT
		try {

			PreparedStatement pst = cn.prepareStatement("INSERT INTO Clasificacion (id_corredor,id_etapa,posicion) VALUES (?,?,?)");

			// System.out.println(pst);

			pst.setInt(1, clasificacion.getId_corredor());
			pst.setInt(2, clasificacion.getId_etapa());
			pst.setInt(3, clasificacion.getPosicion());


			pst.execute();// ejecuta
		} catch (Exception ex) {
			throw ex;

		}
	}
	
	
	
	public ArrayList<Clasificacion> seleccionarClasificaciones() throws Exception {
		PreparedStatement pst;
		Clasificacion clasificacion;

		try {
			pst = cn.prepareStatement("SELECT * FROM clasificacion ");

			ResultSet rs = pst.executeQuery();// ejecuta

			// pasar de ResultSet a ArrayList

			ArrayList<Clasificacion> clasificaciones = new ArrayList<>();
			while (rs.next()) {
				clasificacion = new Clasificacion();
				clasificacion.setId_corredor(rs.getInt(1));
				clasificacion.setId_etapa(rs.getInt(2));
				clasificacion.setPosicion(rs.getInt(3));

				clasificaciones.add(clasificacion);
			}
			return clasificaciones;

		} catch (Exception e) {
			throw e;
		}
	}
	
	public void borrarClasificacion(int idCorredor) throws Exception{

		PreparedStatement pst;

		try {
			pst = cn.prepareStatement("DELETE FROM clasificacion WHERE id_corredor=?");
			pst.setInt(1, idCorredor);

			int count = pst.executeUpdate();


		} catch (Exception e) {
			throw e;

		}

	}
}
