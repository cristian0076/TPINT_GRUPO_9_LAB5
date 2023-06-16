<%@page import="entidad.Articulo"%>
<%@page import="java.util.List"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ABML Productos</title>
<link href="Estilos/login.css" rel="StyleSheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
</head>
<body style="height: 100vh; width: 100%;">
	<f:view
		style="width: 100%; display: flex; flex-direction: column; justify-content: center;">

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
					name="btnVenta">
			</form>
			<form action="Redireccionar_ABMLCliente.html" method="post">
				<input type="submit" value="Cliente" class="dropdown-item"
					name="btnCliente">
			</form>
			</div>
		</div>
		</nav>

		<h2 class="my-3 ml-2 text-center">Productos</h2>

		<button type="button" class="btn btn-primary my-3 w-[30px] mx-auto"
			data-toggle="modal" data-target="#exampleModalCenter">Añadir
			+</button>

		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">Añadir
							Producto</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form action="AgregarProducto_ABMLProducto.html" method="post">
						<div class="modal-body">
							<span>Nombre</span> <input type="text" class="form-control"
								name="txtNombre" placeholder="Nombre Producto"
								required="required"> <span>Descripcion</span> <input
								type="text" class="form-control" name="txtDescripcion"
								placeholder="Descripcion Producto" required="required">
							<span>Tipo</span> <input type="text" class="form-control"
								name="txtTipo" placeholder="Tipo Producto" required="required">
							<span>ID Marca</span> <input type="number" class="form-control"
								name="txtMarca" placeholder="ID Marca" required="required">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
							<input type="submit" value="Guardar" class="btn btn-success"
								name="btnGuardar">
						</div>
					</form>
				</div>
			</div>
		</div>

		<table class="table table-striped w-75 mx-auto">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Nombre</th>
					<th scope="col">Descripcion</th>
					<th scope="col">Marca</th>
					<th scope="col">Tipo</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${articulos}">
					<tr>
						<th scope="row">${item.id}</th>
						<td><span>${item.nombreA}</span></td>
						<td><span>${item.descripcionA}</span></td>
						<td><span>${item.marcaA.nombreM}</span></td>
						<td><span>${item.tipoA}</span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav aria-label="Page navigation example" class="mx-auto">
		<form action="Redireccionar_ABMLProducto.html" method="post">
			<ul class="pagination">
				<c:forEach begin="0" step="1" end="${cantPaginas}" var="variable">
					<li class="page-item"><input type="submit" value="${variable}"
						class="page-link" name="btnPagina"></li>
				</c:forEach>
			</ul>
		</form>
		</nav>

		<%
			boolean pudoAgregarse = false;
				if (request.getAttribute("pudoAgregarse") != null) {
					pudoAgregarse = (boolean) request.getAttribute("pudoAgregarse");
				}
				if (pudoAgregarse) {
		%>
		<div class="alert alert-success" role="alert">Se salvo
			correctamente!</div>
		<%
			}
		%>

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