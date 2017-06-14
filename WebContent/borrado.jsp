<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Eliminar corredor</title>
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
	<div class="container">
		<br> <br>
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">

					<%@page import="eus.azterketa.controlador.*"%>
					<%@page import="eus.azterketa.modelo.*"%>
					<%
						//comprobar si existe
						String nombre = request.getParameter("nombre");

						ControladorClasificacion controladorClasificacion = new ControladorClasificacion();
						ControladorEtapa controladorEtapa = new ControladorEtapa();
						ControladorCorredor controladorCorredor = new ControladorCorredor();
						boolean existe = controladorCorredor.comprobar(nombre);

						//si existe borrar corredor
						if (existe == true) {
							
							int id=controladorCorredor.seleccionarIdPorNombre(nombre);
							controladorClasificacion.borrarClasificacion(id);
							controladorCorredor.borrarCorredor(id); 
							%><h2>Corredor borrado correctamente</h2><%
							//sino sacar mensaje de error 
						} else {
							%><h2>Corredor no existe</h2><%
						}
					%>


					<form action="eliminarCorredor.jsp">
						<input type="submit" value="Volver" name=""
							class="btn btn-default" />
					</form>

					<!-- Latest compiled and minified JavaScript -->
					<script>
						src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
						integrity = "sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
						crossorigin = "anonymous">
					</script>
</html>