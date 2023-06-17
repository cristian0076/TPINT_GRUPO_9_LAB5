<%@page import="entidad.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ABML Empleados</title>
<link href="Estilos/login.css" rel="StyleSheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">

</head>
<body style="height: 100vh; width: 100%;">
	<f:view
		style="width: 100%; display: flex; flex-direction: column; justify-content: center;">
		<%
			Usuario usuario = (Usuario) session.getAttribute("usuario");
		%>
		<!-- Barra navegacion -->
		<nav
			class="navbar navbar-expand-lg navbar-light bg-dark text-white-50 d-flex flex-row justify-content-between">

		<div class="dropdown show d-flex flex-row">
			<form action="Redireccionar_IndexGeneral.html" method="post">
				<input type="submit" value="Mayorista"
					class="navbar-brand btn btn-outline-dark text-light font-weight-bold"
					name="btnIndex">
			</form>

			<div>
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
							name="btnEmpleado">
					</form>
					<form action="Redireccionar_ABMLUsuario.html" method="post">
						<input type="submit" value="Usuarios" class="dropdown-item"
							name="btnUsuarios">
					</form>
					<form action="Redireccionar_ABMLMarca.html" method="post">
						<input type="submit" value="Marcas" class="dropdown-item"
							name="btnMarca">
					</form>
					<form action="Redireccionar_ABMLVentas.html" method="post">
						<input type="submit" value="Ventas" class="dropdown-item"
							name="btnVenta">
					</form>
					<form action="Redireccionar_ABMLCliente.html" method="post">
						<input type="submit" value="Cliente" class="dropdown-item"
							name="btnCliente">
					</form>
					<form action="Redireccionar_ABMLVentaContador.html" method="post">
						<input type="submit" value="VentaContador" class="dropdown-item"
							name="btnVentaContador">
					</form>
				</div>
			</div>

		</div>
		<div class="d-flex flex-row">
		<span class="text-white mr-3 font-weight-bold ml-2">${usuario.getEmpleadoU().getNombreE()}</span>
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
				fill="currentColor" class="bi bi-person-circle text-white"
				viewBox="0 0 16 16"> <path
				d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" /> <path fill-rule="evenodd"
				d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
			</svg>
		</div>

		</nav>

		<!-- Titulo -->
		<h2 class="my-3 ml-2 text-center">Empleados</h2>

		<!-- Boton agregar -->
		<button type="button" class="btn btn-primary my-3 w-[30px] mx-auto"
			data-toggle="modal" data-target="#exampleModalCenter">Añadir
			+</button>
		<!-- Tabla -->
		<table class="table table-striped w-75 mx-auto">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Legajo</th>
					<th scope="col">DNI</th>
					<th scope="col">Nombre</th>
					<th scope="col">Apellido</th>
					<th scope="col">Sexo</th>
					<th scope="col">Fecha Nac.</th>
					<th scope="col">Direccion</th>
					<th scope="col">Localidad</th>
					<th scope="col">Correo Electronico</th>
					<th scope="col">Telefono</th>
					<th scope="col"></th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td><span>1231</span></td>
					<td><span>42.123.123</span></td>
					<td><span>Pepe</span></td>
					<td><span>Caseros</span></td>
					<td><span>Masculino</span></td>
					<td><span>10/10/2000</span></td>
					<td><span>Calle 123</span></td>
					<td><span>Tigre</span></td>
					<td><span>pepe@gmail.com</span></td>
					<td><span>11-1212-1212</span></td>
					<td><span><button type="button" class="btn btn-warning">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-pencil-fill"
									viewBox="0 0 16 16"> <path
									d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z" />
								</svg>
							</button></span></td>
					<td><span><button type="button" class="btn btn-danger">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-trash-fill"
									viewBox="0 0 16 16"> <path
									d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z" />
								</svg>
							</button></span></td>
				</tr>
			</tbody>
		</table>

		<!-- Paginacion -->
		<nav aria-label="Page navigation example" class="mx-auto">
		<ul class="pagination">
			<li class="page-item"><input type="submit" value="1"
				class="page-link" name="btnPagina"></li>
		</ul>
		</nav>

		<!-- Footer -->
		<footer id="sticky-footer"
			class="py-4 bg-dark text-white-50 fixed-bottom">
		<div class="container text-center">
			<span class="logo-text text-white">© 2023 - By Grupo Nro 9
				LAB5 - todos los derechos reservados </span>
		</div>
		</footer>

	</f:view>
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