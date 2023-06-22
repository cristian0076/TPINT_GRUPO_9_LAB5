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
				if (session.getAttribute("usuario") != null && usuario.getTipoCuentaU().getId() == 1) {
			%>
			<div class="dropdown show d-flex flex-row">
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
					</div>
				</div>
			</div>
			<%
				}
			%>
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
		<%
			if (session.getAttribute("usuario") != null && usuario.getTipoCuentaU().getId() == 1) {
		%>
		<!-- Titulo -->
		<h2 class="my-3 ml-2 text-center">Ventas</h2>

		<!-- Boton agregar -->
		<div
			class="d-flex flex-row justify-content-center align-items-center gap-3">
			<button type="button" class="btn btn-primary my-3 w-[30px]"
				data-toggle="modal" data-target="#exampleModalCenter">Añadir
				+</button>

			<div class="modal fade" id="exampleModalCenter" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalCenterTitle"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle">Añadir
								Venta</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form action="AgregarVenta_ABMLVenta.html" method="post">
							<div class="modal-body">
								<span>Fecha: </span> 
									<input type="label" name=" txtFechaVentA" style="border: 0;" id="fechaActual" disabled> <br><br> 
								<span>Cliente</span> 
									<select class="form-control" name="txtCliente" required="required">
	                                      <c:forEach var="client" items="${clientes}">
	                                       	 <option value="${client}">${client.getNombre_C()} - ${client.getApellido_C()}</option>
	                                      </c:forEach>
                               		</select><br><br> 	
								<span>Producto</span>
									<select class="form-control" name="txtProducto" required="required">
                                      <option value="" disabled selected>Seleccione un producto</option>
	                                      <c:forEach var="prod" items="${productos}">
	                                       	 <option value="${prod}">${prod.getNombreA()} - ${prod.getMarcaA().getNombreM()} - ${prod.isPrecioUnitario()}</option>
	                                      </c:forEach>
                               		</select>
								<span>Cantidad</span>
									<input style="Width:90px;height:35px" type="number" value="0" name=" txtCantidadProdA"  id="fechaActual">
								<button type="button" class="btn btn-primary my-3 w-[30px]">
									<span aria-hidden="true">Agregar</span>
								</button>
							</div>
							<div class="modal-footer" id="CointeinerProductos">
							
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">Cerrar</button>
								<input type="submit" value="Guardar" class="btn btn-success"
									name="btnGuardar">
							</div>
						</form>
					</div>
				</div>
			</div>
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
				<c:forEach var="item" items="${ventas}">
					<tr>
						<th scope="row">${item.id}</th>
						<td><span>${item.getFecha_V()}</span></td>
						<td><span>${item.getId_Cliente().getNombre_C()}</span></td>
						<td><span>${item.getId_usuario().getEmpleadoU().getNombreE()}</span></td>
						<td><span>${item.getTotal_V()}</span></td>
					</tr>
				</c:forEach>
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
		<%
			} else {
					if (session.getAttribute("usuario") != null) {
		%>
		<head>
<meta http-equiv="refresh"
	content="0;url=http://localhost:8101/TPINT_GRUPO_9_LAB5/Redireccionar_IndexGeneral.html">
<title>Redireccionando...</title>
		</head>
		<h1>Redireccionando...</h1>
		<p>Estás siendo redirigido a otra página. Si no eres redirigido
			automáticamente, haz clic en el siguiente enlace:</p>
		<a
			href="http://localhost:8101/TPINT_GRUPO_9_LAB5/Redireccionar_IndexGeneral.html">Enlace
			de redirección</a>
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
	<script>
			var fecha = new Date(); // Obtener la fecha actual
			var dia = fecha.getDate(); // Obtener el día del mes (1-31)
			var mes = fecha.getMonth() + 1; // Obtener el mes (0-11)
			var anio = fecha.getFullYear(); // Obtener el año

			// Formatear la fecha como dd/mm/yyyy
			var fechaFormateada = dia + '/' + mes + '/' + anio;

			// Mostrar la fecha en la etiqueta con id "fechaActual"
			document.getElementById("fechaActual").value = fechaFormateada;
	</script>
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