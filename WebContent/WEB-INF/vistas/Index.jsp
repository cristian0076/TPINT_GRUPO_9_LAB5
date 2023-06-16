<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pagina inicio</title>
<link href="../Estilos/login.css" rel="StyleSheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">

</head>
<body style="height: 100vh;">

	<!-- Barra navegacion -->
	<nav
		class="navbar navbar-expand-lg navbar-light  bg-dark text-white-50">
	<form action="Redireccionar_IndexGeneral.html" method="post">
		<input type="submit" value="Mayorista"
			class="navbar-brand btn btn-outline-dark text-light font-weight-bold"
			name="btnIndex">
	</form>
	<div class="dropdown show">
		<a class="btn btn-secondary dropdown-toggle" href="#" role="button"
			id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> ABML </a>

		<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
			<form action="Redireccionar_ABMLProducto.html" method="post">
				<input type="submit" value="Productos" class="dropdown-item"
					name="btnProducto">
			</form>
			<form action="Redireccionar_ABMLStock.html" method="post">
				<input type="submit" value="Stock" class="dropdown-item"
					name="btnProducto">
			</form>
			<form action="Redireccionar_ABMLEmpleado.html" method="post">
				<input type="submit" value="Empleados" class="dropdown-item"
					name="btnProducto">
			</form>
			<form action="Redireccionar_ABMLUsuario.html" method="post">
				<input type="submit" value="Usuarios" class="dropdown-item"
					name="btnProducto">
			</form>
			<form action="Redireccionar_ABMLMarca.html" method="post">
				<input type="submit" value="Marcas" class="dropdown-item"
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
						<form action="Redireccionar_ABMLVentas.html" method="post">
				<input type="submit" value="Ventas" class="dropdown-item"
					name="btnVenta">
			</form>
			<form action="Redireccionar_ABMLCliente.html" method="post">
				<input type="submit" value="Cliente" class="dropdown-item"
					name="btnCliente">
			</form>
		</div>
	</div>
	</nav>

	<h1>Bienvenido a la pagina de inicio ${Usuario}</h1>
	<footer id="sticky-footer"
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