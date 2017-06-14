package eus.azterketa.modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ModeloEtapa   extends Conectar{

	public ModeloEtapa() {
		super();
	}
	
	public ArrayList<Etapa> seleccionarEtapas() throws Exception {
		PreparedStatement pst;
		Etapa etapa;

		try {
			pst = cn.prepareStatement("SELECT * FROM Etapa ");

			ResultSet rs = pst.executeQuery();// ejecuta

			// pasar de ResultSet a ArrayList

			ArrayList<Etapa> etapas = new ArrayList<>();
			while (rs.next()) {
				etapa = new Etapa();
				etapa.setId(rs.getInt(1));
				etapa.setKm(rs.getInt(2));
				etapa.setSalida(rs.getString(3));
				etapa.setLlegada(rs.getString(4));

				etapas.add(etapa);
			}
			return etapas;

		} catch (Exception e) {
			throw e;
		}
	}

}
