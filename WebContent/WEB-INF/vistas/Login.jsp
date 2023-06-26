<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Login</title>

<link rel="shortcut icon"
	href="https://i.ibb.co/GnRYMvm/carro-de-neon.png">

<link href="Estilos/login.css" rel="StyleSheet" type="text/css">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
</head>

<body style="height: 100vh;">

	<nav
		class="navbar navbar-expand-lg navbar-light  bg-dark text-white-50">
	<a class="navbar-brand" style="color: white" href="#">Mayorista</a> </nav>
	<%
		if (session.getAttribute("usuario")== null) {
	%>
	<div class="footer-siempre-abajo" style="background-color: white">
		<div class="login-form" style="width: 340px; margin: 50px auto;">
			<form action="Redireccionar_Index.html" method="post">
				<h2 class="text-center">Mayorista</h2>
				<div class="form-group">
					<input type="text" class="form-control" name="txtUsuario"
						placeholder="Usuario" required="required" autocomplete="off">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" name="txtClave"
						placeholder="Clave" required="required">
				</div>
				<div class="form-group">
					<input type="submit" value="Ingresar"
						class="btn btn-primary btn-block" name="btnIngresar">
				</div>
				<%
					if (request.getAttribute("Message") != null) {
				%>
				<div class="alert alert-danger" role="alert">${Message}</div>
				<%
					}
				%>
			</form>

		</div>

	</div>
		<%
			} else {
		%>
		<meta http-equiv="refresh" content="0;url=" id="redirectMeta">
		<title>Redireccionando...</title>

		<h1>Redireccionando...</h1>
		<p>Estás siendo redirigido a otra página. Si no eres redirigido
			automáticamente, haz clic en el siguiente enlace:</p>
		<a id="redirectionLink" href="#">Enlace de redirección</a>

		<script>
    // Obtener el dominio actual del navegador
    var currentDomain = window.location.hostname;

    // Obtener el puerto actual del navegador
    var currentPort = window.location.port;

    // Construir la URL de redirección con el dominio y el puerto actuales
    var redirectionUrl = 'http://' + currentDomain + ':' + currentPort + '/TPINT_GRUPO_9_LAB5/Redireccionar_IndexGeneral.html';

    // Obtener una referencia al elemento meta
    var metaElement = document.getElementById('redirectMeta');

    // Modificar el contenido del atributo "content" del meta tag
    metaElement.setAttribute('content', '0;url=' + redirectionUrl);

    // Actualizar el enlace de redirección con la URL dinámica
    document.getElementById('redirectionLink').href = redirectionUrl;
  </script>
		<%
			}
		%>
	<footer id="sticky-footer"
		class="py-4 bg-dark text-white-50 fixed-bottom">
	<div class="container text-center">
		<span class="logo-text">© 2023 - By Grupo Nro 9 LAB5 - todos
			los derechos reservados </span>
	</div>
	</footer>

</body>

</html>