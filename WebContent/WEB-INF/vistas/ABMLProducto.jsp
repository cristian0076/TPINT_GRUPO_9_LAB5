<%@page import="entidad.Usuario"%>
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

		<h2 class="my-3 ml-2 text-center">Productos</h2>

		<button type="button" class="btn btn-primary my-3 w-[30px] mx-auto"
			data-toggle="modal" data-target="#exampleModalCenter">A�adir
			+</button>

		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">A�adir
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


		<div class="modal fade" id="modalModificar" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">Modificar
							Producto</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form action="ModificarProducto_ABMLProducto.html" method="post">
						<div class="modal-body">
							<span>Nombre</span> <input type="text" class="form-control"
								name="txtNombreM" placeholder="Nombre Producto"
								required="required"> <span>Descripcion</span> <input
								type="text" class="form-control" name="txtDescripcionM"
								placeholder="Descripcion Producto" required="required">
							<span>Tipo</span> <input type="text" class="form-control"
								name="txtTipoM" placeholder="Tipo Producto" required="required">
							<span>ID Marca</span> <input type="text" class="form-control"
								name="txtMarcaM" placeholder="ID Marca" required="required">
								<input type="hidden" name="id_M">
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
					<th scope="col">Estado</th>
					<th scope="col"></th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${articulos}">
					<tr>
						<th scope="row">${item.id}<input type="hidden"
							value="${item.id}"></th>
						<td><span>${item.nombreA} </span></td>
						<td><span>${item.descripcionA}</span></td>
						<td><span>${item.marcaA.nombreM}</span></td>
						<td><span>${item.tipoA}</span></td>
						<td><span>

								<button type="submit" class="btn btn-warning "
									data-toggle="modal" data-target="#modalModificar"
									onclick="cargarDatos(${item.id}, '${item.nombreA}', '${item.descripcionA}', '${item.tipoA}', ${item.marcaA.id})">

									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-pencil-fill"
										viewBox="0 0 16 16"> <path
										d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z" />
									</svg>
								</button>
						</span></td>
						<td><span>
								<form action="EliminarProducto_ABMLProducto.html" method="post">
									<button type="submit" name="btnEliminar" value="${item.id}"
										class="btn btn-danger">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-trash-fill"
											viewBox="0 0 16 16"> <path
											d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z" />
										</svg>
									</button>
								</form>
						</span></td>
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
				int pudoModificarse = 0;
				if (request.getAttribute("pudoAgregarse") != null) {
					pudoAgregarse = (boolean) request.getAttribute("pudoAgregarse");
				}
				if (request.getAttribute("pudoModificarse") != null) {
					pudoModificarse = (int) request.getAttribute("pudoModificarse");
				}
				if (pudoAgregarse) {
		%>
		<div class="alert alert-success" role="alert">Se salvo
			correctamente!</div>
		<%
			}
				if (pudoModificarse==1) {
		%>
		<div class="alert alert-success" role="alert">Se modifico
			correctamente!</div>
		<%
			}
		%>

		<footer id="sticky-footer"
			class="py-4 bg-dark text-white-50 fixed-bottom">
		<div class="container text-center">
			<span class="logo-text text-white">� 2023 - By Grupo Nro 9
				LAB5 - todos los derechos reservados </span>
		</div>
		</footer>
	</f:view>

	<script type="text/javascript">
	function cargarDatos(id,nombre, descripcion, tipo, marcaId) {
		$('input[name="id_M"]').val(id);
		$('input[name="txtNombreM"]').val(nombre);
		$('input[name="txtDescripcionM"]').val(descripcion);
		$('input[name="txtTipoM"]').val(tipo);
		$('input[name="txtMarcaM"]').val(marcaId);
    }
	</script>

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