package eus.azterketa.controlador;

import java.util.ArrayList;

import eus.azterketa.modelo.*;

public class ControladorEtapa {

	private ModeloEtapa modeloEtapa;

	public ControladorEtapa() {
		super();
		modeloEtapa=new ModeloEtapa();
		
	}	
		public ArrayList<Etapa> abrirConsultarEtapa() throws Exception {

			
			ArrayList<Etapa> etapas;
			try {
				etapas = modeloEtapa.seleccionarEtapas();
				return etapas;
			} catch (Exception e) {
				throw e;
			}
		}

}
