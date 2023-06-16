<%@page import="entidad.Venta"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Venta</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
</head>
<body>
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
				<form action="Redireccionar_ABMLVentaContador.html" method="post">
					<input type="submit" value="Ventas" class="dropdown-item"
						name="btnVenta">
				</form>
			</div>
		</div>
		</nav>
		<!-- Titulo -->
		<h2 class="my-3 ml-2 text-center">Ventas</h2>

		<!-- parametros de busqueda -->
		<div class="row justify-content-center">
			<input type="date" class="my-3 mx-1"> <input type="date"
				class="my-3 mx-1">
			<button type="button" class="btn btn-primary my-3 mx-1">Buscar</button>
		</div>


		<!-- Tabla -->
		<table class="table table-striped w-75 mx-auto">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Fecha</th>
					<th scope="col">Cliente</th>
					<th scope="col">Vendedor</th>
					<th scope="col">Total</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td><span>2023/01/02</span></td>
					<td><span>Marolio</span></td>
					<td><span>Pepe</span></td>
					<td><span>2000</span></td>
				</tr>
			</tbody>
		</table>
		<nav aria-label="Page navigation example" class="mx-auto">
		<form action="Redireccionar_ABMLVentas.html" method="post">
			<ul class="pagination">
				<c:forEach begin="0" step="1" end="${cantPaginas}" var="variable">
					<li class="page-item"><input type="submit" value="${variable}"
						class="page-link" name="btnPagina"></li>
				</c:forEach>
			</ul>
		</form>
		</nav>

		<!-- Totales -->
		<div class="d-flex flex-row justify-content-around mx-auto w-75">
			<div
				class="d-flex flex-column align-items-center justify-content-center">
				<span>Ventas</span>
				<div
					class="bg-secondary rounded-circle d-flex flex-column align-items-center justify-content-center text-white"
					style="height: 45px; width: 45px; box-shadow: 1px 0px 59px -3px rgba(0,0,0,0.75);">
					<span>2000</span>
				</div>
			</div>
			<div
				class="d-flex flex-column align-items-center justify-content-center">
				<span>Compras</span>
				<div
					class="bg-secondary rounded-circle d-flex flex-column align-items-center justify-content-center text-white"
					style="height: 45px; width: 45px; box-shadow: 1px 0px 59px -3px rgba(0,0,0,0.75);">
					<span>1000</span>
				</div>
			</div>
			<div
				class="d-flex flex-column align-items-center justify-content-center">
				<span>Ganancias</span>
				<div
					class="bg-secondary rounded-circle d-flex flex-column align-items-center justify-content-center text-white"
					style="height: 45px; width: 45px; box-shadow: 1px 0px 59px -3px rgba(0,0,0,0.75);">
					<span>1000</span>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<footer id="sticky-footer"
			class="py-4 bg-dark text-white-50 fixed-bottom">
		<div class="container text-center">
			<span class="logo-text text-white">© 2023 - By Grupo Nro 9
				LAB5 - todos los derechos reservados </span>
		</div>
		</footer>

	</f:view>
	<!--Obligatorio-->
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