<%@page import="entidad.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Pagina inicio</title>
<link href="../Estilos/login.css" rel="StyleSheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">

</head>
<body style="height: 100vh;">
			<%
				Usuario usuario = (Usuario) session.getAttribute("usuario");
			%>
	<!-- Barra navegacion -->
	<nav
		class="navbar navbar-expand-lg navbar-light  bg-dark text-white-50">
	<div>
	<form action="Redireccionar_IndexGeneral.html" method="post">
		<input type="submit" value="Mayorista"
			class="navbar-brand btn btn-outline-dark text-light font-weight-bold"
			name="btnIndex">
	</form>	
	</div>
	<%
		if (session.getAttribute("usuario") != null) {
	%>
	<div class="dropdown show">
		<a class="btn btn-secondary dropdown-toggle" href="#" role="button"
			id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> ABML </a>
		
		<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
			<%
				if (usuario.getTipoCuentaU().getId()==1) {
			%>
			<form action="Redireccionar_ABMLProducto.html" method="post">
				<input type="submit" value="Productos" class="dropdown-item"
					name="btnProducto">
			</form>
			<form action="Redireccionar_ABMLStock.html" method="post">
				<input type="submit" value="Stock" class="dropdown-item"
					name="btnProducto">
			</form>
			<form action="Redireccionar_ABMLVentas.html" method="post">
				<input type="submit" value="Ventas" class="dropdown-item"
					name="btnProducto">
			</form>
			<form action="Redireccionar_ABMLCliente.html" method="post">
				<input type="submit" value="Clientes" class="dropdown-item"
					name="btnProducto">
			</form>
				<%
					}
					if (usuario.getTipoCuentaU().getId()==2) {
				%>
			<form action="Redireccionar_ABMLVentaContador.html" method="post">
				<input type="submit" value="VentaContador" class="dropdown-item"
					name="btnVentaContador">
			</form>
			<%} %>
		</div>
	</div>
	<div class="ml-auto ">
    <form action="Salir.html" method="post">
        <input type="submit" value="Cerrar Sesion" name="btnSalir" class="btn btn-link text-white">
    </form>
    </div>
	<%
		}
	%> </nav>
		<%
			if (session.getAttribute("usuario") != null) {
		%>

	<div class="container d-flex flex-row my-5">
		<%
			if (session.getAttribute("usuario") != null) {
		%>
		<svg xmlns="http://www.w3.org/2000/svg" width="150" height="150"
			fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
		<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" /> <path
			fill-rule="evenodd"
			d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
		</svg>

		<div class="ml-5">
			<h3 class="ml-3 mt-3">Bienvenido a la pagina de inicio
				${usuario.getUsuarioU()}</h3>
			<div class="container d-flex flex-row my-4 justify-content-between">
				<div class="ml-3">
					<h5>Usuario:</h5>
					<span>${usuario.getUsuarioU()}</span>
					<h5>Nombre:</h5>
					<span>${usuario.getEmpleadoU().getNombreE()}</span>
					<h5>Apellido:</h5>
					<span>${usuario.getEmpleadoU().getApellidoE()}</span>
					<h5>DNI:</h5>
					<span>${usuario.getEmpleadoU().getDniE()}</span>
					<h5>Sexo:</h5>
					<span>${usuario.getEmpleadoU().getSexoE()}</span>
				</div>
				<div>
					<h5>Fecha de Nacimiento:</h5>
					<span>${usuario.getEmpleadoU().getFechaNacimientoE()}</span>
					<h5>Localidad</h5>
					<span>${usuario.getEmpleadoU().getLocalidadE()}</span>
					<h5>Direccion:</h5>
					<span>${usuario.getEmpleadoU().getDireccionE()}</span>
					<h5>E-Mail:</h5>
					<span>${usuario.getEmpleadoU().getMailE()}</span>
					<h5>Telefono:</h5>
					<span>${usuario.getEmpleadoU().getTelefonoE()}</span>
				</div>
			</div>
		</div>


	</div>
	<%
		} else {
	%>

<head>
  <meta http-equiv="refresh" content="5;url=" id="redirectMeta">
  <title>Redireccionando...</title>
</head>

  <h1>Redireccionando...</h1>
  <p>Estás siendo redirigido a otra página. Si no eres redirigido automáticamente, haz clic en el siguiente enlace:</p>
  <a id="redirectionLink" href="#">Enlace de redirección</a>

  <script>
    // Obtener el dominio actual del navegador
    var currentDomain = window.location.hostname;

    // Obtener el puerto actual del navegador
    var currentPort = window.location.port;

    // Construir la URL de redirección con el dominio y el puerto actuales
    var redirectionUrl = 'http://' + currentDomain + ':' + currentPort + '/TPINT_GRUPO_9_LAB5/Redireccionar_Login.html';

    // Obtener una referencia al elemento meta
    var metaElement = document.getElementById('redirectMeta');

    // Modificar el contenido del atributo "content" del meta tag
    metaElement.setAttribute('content', '5;url=' + redirectionUrl);

    // Actualizar el enlace de redirección con la URL dinámica
    document.getElementById('redirectionLink').href = redirectionUrl;
  </script>
<%
	}
			}else{
				%>
				<head>
  <meta http-equiv="refresh" content="5;url=" id="redirectMeta">
  <title>Redireccionando...</title>
</head>

  <h1>Redireccionando...</h1>
  <p>Estás siendo redirigido a otra página. Si no eres redirigido automáticamente, haz clic en el siguiente enlace:</p>
  <a id="redirectionLink" href="#">Enlace de redirección</a>

  <script>
    // Obtener el dominio actual del navegador
    var currentDomain = window.location.hostname;

    // Obtener el puerto actual del navegador
    var currentPort = window.location.port;

    // Construir la URL de redirección con el dominio y el puerto actuales
    var redirectionUrl = 'http://' + currentDomain + ':' + currentPort + '/TPINT_GRUPO_9_LAB5/Redireccionar_Login.html';

    // Obtener una referencia al elemento meta
    var metaElement = document.getElementById('redirectMeta');

    // Modificar el contenido del atributo "content" del meta tag
    metaElement.setAttribute('content', '5;url=' + redirectionUrl);

    // Actualizar el enlace de redirección con la URL dinámica
    document.getElementById('redirectionLink').href = redirectionUrl;
  </script>
				<%
			
			}
%>
<footer id="align-bottom"
	class="py-4 bg-dark text-white-50 fixed-bottom">
<div class="container text-center">
	<span class="logo-text text-white">© 2023 - By Grupo Nro 9 LAB5
		- todos los derechos reservados </span>
</div>
</footer>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
	integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
	crossorigin="anonymous"></script>
</body>
</html>