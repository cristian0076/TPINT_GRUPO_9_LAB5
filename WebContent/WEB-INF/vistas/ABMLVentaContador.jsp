<%@page import="entidad.Usuario"%>
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
	<style>
	.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content form {
    padding: 8px 12px;
}

.btn-icon {
    cursor: pointer;
}

.dropdown:hover .dropdown-content {
    display: block;
}
</style>
</head>
<body>
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
			<%
				if (session.getAttribute("usuario") != null && usuario.getTipoCuentaU().getId()==2) {
			%>
			<div class="dropdown show d-flex flex-row">
				<div>
					<a class="btn btn-secondary dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> ABML </a>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<form action="Redireccionar_ABMLVentaContador.html" method="post">
							<input type="submit" value="VentaContador" class="dropdown-item"
								name="btnVentaContador">
						</form>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
<div class="d-flex flex-row">
    <div class="ml-auto">
        <div class="dropdown">
            <div class="btn-icon" onclick="toggleDropdown()">
                <svg name="btnImage" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-circle text-white" viewBox="0 0 16 16">
                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                    <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                </svg>
            </div>
            <div id="dropdownContent" class="dropdown-content">
                <form action="Salir.html" method="post">
                    <input type="submit" value="Cerrar Sesión" name="btnSalir" class="btn btn-link">
                </form>
            </div>
        </div>
    </div>
    <span class="text-white mr-3 font-weight-bold ml-2">${usuario.getEmpleadoU().getNombreE()}</span>
</div>

		</nav>
		<%
			if (session.getAttribute("usuario") != null && usuario.getTipoCuentaU().getId()==2) {
		%>
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
					style="height: 45px; width: 45px; box-shadow: 1px 0px 59px -3px rgba(0, 0, 0, 0.75);">
					<span>2000</span>
				</div>
			</div>
			<div
				class="d-flex flex-column align-items-center justify-content-center">
				<span>Compras</span>
				<div
					class="bg-secondary rounded-circle d-flex flex-column align-items-center justify-content-center text-white"
					style="height: 45px; width: 45px; box-shadow: 1px 0px 59px -3px rgba(0, 0, 0, 0.75);">
					<span>1000</span>
				</div>
			</div>
			<div
				class="d-flex flex-column align-items-center justify-content-center">
				<span>Ganancias</span>
				<div
					class="bg-secondary rounded-circle d-flex flex-column align-items-center justify-content-center text-white"
					style="height: 45px; width: 45px; box-shadow: 1px 0px 59px -3px rgba(0, 0, 0, 0.75);">
					<span>1000</span>
				</div>
			</div>
		</div>
		<%
			} 
			else {
				if (session.getAttribute("usuario") != null){
		%>
				<head>
<meta http-equiv="refresh"
	content="0;url=http://localhost:8101/TPINT_GRUPO_9_LAB5/Redireccionar_IndexGeneral.html">
<title>Redireccionando...</title>
		</head>
		<h1>Redireccionando...</h1>
		<p>Estás siendo redirigido a otra página. Si no eres redirigido
			automáticamente, haz clic en el siguiente enlace:</p>
		<a href="http://localhost:8101/TPINT_GRUPO_9_LAB5/Redireccionar_IndexGeneral.html">Enlace de
			redirección</a>
		<%
			} else {
		%>
		
		<head>
<meta http-equiv="refresh"
	content="5;url=http://localhost:8101/TPINT_GRUPO_9_LAB5/">
<title>Redireccionando...</title>
		</head>
		<h1>Redireccionando...</h1>
		<p>Estás siendo redirigido a otra página. Si no eres redirigido
			automáticamente, haz clic en el siguiente enlace:</p>
		<a href="http://localhost:8101/TPINT_GRUPO_9_LAB5/">Enlace de
			redirección</a>
		<%
			}
			}
		%>
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