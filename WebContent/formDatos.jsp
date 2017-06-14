<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Formulario de resultados</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
</head>
<body>
	<%@ page import="eus.azterketa.controlador.*"%>
	<%@ page import="eus.azterketa.modelo.*"%>
	<%@ page import="java.util.ArrayList"%>

	<div class="container">
		<br> <br>
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<h1>Resultados de etapa</h1>
					<h6>Formulario para introducir posiciones de corredores en
						etapas</h6>
				</div>

			</div>
		</div>
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<form method="get" action="formDatos.jsp">
					<div class="form-group">
						<h3>
							<span class="label label-default">Corredor</span>
							<%@page import="eus.azterketa.controlador.*"%>
							<%@page import="eus.azterketa.modelo.*"%>
							<%@page import="java.util.ArrayList"%>
						</h3>
						<%
							ControladorCorredor controladorCorredor = new ControladorCorredor();

							ArrayList<Corredor> corredores = controladorCorredor.seleccionarTodos();

							ControladorEtapa controladorEtapa = new ControladorEtapa();

							ArrayList<Etapa> etapas = controladorEtapa.abrirConsultarEtapa();

							ControladorClasificacion controladorClasificacion = new ControladorClasificacion();

							ArrayList<Clasificacion> clasificaciones = controladorClasificacion.abrirConsultarClasificacion();
						%>
						<select class="form-control" name="seleccionado">
							<option></option>
							<%
								for (Corredor corredor : corredores) {
							%>
							<option value="<%=corredor.getId()%>"><%=corredor.getNombre() + " " + corredor.getApellido()%></option>
							<%
								}
							%>
						</select>

					</div>

					<div class="form-group">
						<h3>
							<span class="label label-default">Etapa</span>
						</h3>

						<div class="radio">
							<%
								for (Etapa etapa : etapas) {
							%>
							<input type="radio" value="<%=etapa.getId()%>" name="idEtapa"><%=etapa.getSalida() + "-" + etapa.getLlegada()%>
							<br>
							<%
								}
							%>
						</div>
					</div>

					<div class="form-group">
						<h3>
							<span class="label label-default">Posicion</span>
						</h3>
						<input type="text" class="form-control" id="" name="posicion"
							size="5" />
					</div>

					<div class="form-group">
						<button type="submit" value="guardar" class="btn btn-default">Guardar</button>
					</div>
				</form>
			</div>
		</div>
			<%
	String idCorredor=request.getParameter("seleccionado");
	String idEtapa=request.getParameter("idEtapa");
	String posicion=request.getParameter("posicion");
	if( (idCorredor!=null) && (idEtapa!=null) && (posicion!=null)){
		try{			
		controladorClasificacion.insertar((Integer.parseInt(idCorredor)),(Integer.parseInt(idEtapa)),(Integer.parseInt(posicion)));
		out.println("GUARDADO CORRECTAMENTE");
		response.sendRedirect("formDatos.jsp");
		}catch (Exception e){
			out.println("ERROR AL GUARDAR");
		}
	}
	
	
	%>
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<h2>Posicion de todos los corredores</h2>
				<table class="table">
					<tr>
						<th width="3%">ID CORREDOR</th>
						<th width="55%">ID ETAPA</th>
						<th width="23%">POSICION</th>

					</tr>
					<%
						for (Clasificacion clasificacion : clasificaciones) {
					%>
					<tr>
						<td width="3%"><%=clasificacion.getId_corredor()%></td>
						<td width="55%"><%=clasificacion.getId_etapa()%></td>
						<td width="23%"><%=clasificacion.getPosicion()%></td>

					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
		<!-- row bukaera -->
	</div>


</body>
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
</html>