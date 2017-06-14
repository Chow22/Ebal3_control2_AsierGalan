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
	<%@ page import="java.sql.*"%>
	<div class="container">
		<br> <br>
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<h2>CORREDORES POR EQUIPO</h2>
					<h6>Elige un equipo y visualiza sus corredores</h6>
				</div>

			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<div class="col-md-4 col-md-offset-1">
					<form action="corredoresEquipos.jsp">
						<div class="form-group">
							<h3>
								<span class="label label-default">Equipo</span>
							</h3>
							<%
								ControladorEquipo controladorEquipo = new ControladorEquipo();

								ArrayList<Equipo> equipos = controladorEquipo.seleccionarEquipos();
							%>
							<select class="form-control" name="seleccionado">
								<option></option>
								<%
									for (Equipo equipo : equipos) {
								%>
								<option value="<%=equipo.getId()%>"><%=equipo.getNombre()%></option>
								<%
									}
								%>
							</select>
						</div>

						<div class="form-group">
							<button type="submit" value="" class="btn btn-default">Visualizar
								Corredores</button>
						</div>
					</form>
				</div>
				<div class="col-md-4 col-md-offset-2">
					<h3>
						<span class="label label-default">Datos Equipo</span>
					</h3>
					<table class="table">
						<tr>
							<th>NOMBRE</th>
							<th>DIRECTOR</th>
							<th>PRESUPUESTO</th>
						</tr>
						<%
							String idEquipo = request.getParameter("seleccionado");

							if (idEquipo != null) {

								ArrayList<Equipo> equipoSelec = controladorEquipo.seleccionarEquipoPorId(Integer.parseInt(idEquipo));

								for (Equipo equipo : equipoSelec) {
						%>
						<tr>
							<td width="3%"><%=equipo.getNombre()%></td>
							<td width="55%"><%=equipo.getDirector()%></td>
							<td width="23%"><%=equipo.getPresupuesto()%></td>

						</tr>
						<%
							}
							}
						%>
					</table>
				</div>
			</div>


			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<h3>
						<span class="label label-default">Corredores de ese equipo</span>
					</h3>
					<table class="table">
						<tr>
							<th>ID CORREDOR</th>
							<th>NOMBRE</th>
							<th>APELLIDO</th>
						</tr>
					<%
					if (idEquipo != null) {
							ControladorCorredor controladorCorredor = new ControladorCorredor();

							ArrayList<Corredor> corredores = controladorCorredor.seleccionarPorEquipo(Integer.parseInt(idEquipo));

							for (Corredor corredor : corredores) {
						%>
						<tr>
							<td width="3%"><%=corredor.getId()%></td>
							<td width="55%"><%=corredor.getNombre()%></td>
							<td width="23%"><%=corredor.getApellido()%></td>

						</tr>
						<%
							}
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