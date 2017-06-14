package eus.azterketa.controlador;
import java.util.ArrayList;

import eus.azterketa.modelo.Clasificacion;
import eus.azterketa.modelo.ModeloClasificacion;

public class ControladorClasificacion {
	
	private ModeloClasificacion modeloClasificacion;

	public ControladorClasificacion() {
		super();
		modeloClasificacion=new ModeloClasificacion();
	
	}

	public void insertar(int idCorredor,int idEtapa,int posicion) throws Exception{
		
		Clasificacion clasificacion=new Clasificacion();
		
		clasificacion.setId_corredor(idCorredor);
		clasificacion.setId_etapa(idEtapa);
		clasificacion.setPosicion(posicion);
				
		try {
			modeloClasificacion.insertar(clasificacion);
		} catch (Exception e) {
			throw e;
		}
	}
	
	
	public ArrayList<Clasificacion> abrirConsultarClasificacion() throws Exception {

		
		ArrayList<Clasificacion> clasificaciones;
		try {
			clasificaciones = modeloClasificacion.seleccionarClasificaciones();
			return clasificaciones;
		} catch (Exception e) {
			throw e;
		}
	}
	
	public void borrarClasificacion(int idCorredor) throws Exception {

		try {
			modeloClasificacion.borrarClasificacion(idCorredor);
			
		} catch (Exception e) {
			
			 throw e;
			
		}
	}
}
