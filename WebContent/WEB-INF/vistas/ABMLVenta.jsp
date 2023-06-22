<%@page import="java.util.ArrayList"%>
<%@page import="entidad.Usuario"%>
<%@page import="entidad.Venta"%>
<%@page import="entidad.Articulo"%>
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
				
			<!-- Busqueda / Filtro -->
			<div class="input-group w-50 ml-3">
				<form action="Redireccionar_ABMLVentas.html" class="input-group">
					<select class="custom-select ddlFiltroVenta" id="ddlFiltroVenta"
						name="ddlFiltroVenta" >
						<option selected value="0">Filtros</option>
						<option value="1">Fecha</option>
						<option value="2">Cliente</option>
						<option value="3">Vendedor</option>
						<option value="4">Total</option>
					</select> <input type="text" class="form-control txtFiltroVenta"
						aria-label="Text input with dropdown button" id="txtFiltroVenta"
						name="txtFiltroVenta" >
					<div class="input-group-append">
						<button class="btn btn-outline-primary" type="submit">Buscar</button>
					</div>
				</form>
			</div>

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
								<span>Fecha: </span> <input type="text" name="txtFechaVentA"
									style="border: 0;" id="fechaActual"> <br>
								<br> <span>Cliente</span> <select class="form-control"
									name="txtCliente" required="required" id="txtCliente">
									<c:forEach var="client" items="${clientes}">
										<option value="${client.getId()}">${client.getNombre_C()}-
											${client.getApellido_C()}</option>
									</c:forEach>
								</select>
								<br> <span>Producto</span> <select class="form-control"
									name="txtProducto" required="required" id="txtProducto">
									<c:forEach var="prod" items="${productos}">
										<option value="${prod}">${prod.getNombreA()}-
											${prod.getMarcaA().getNombreM()} - $${prod.isPrecioUnitario()}</option>
									</c:forEach>
								</select> <span>Cantidad</span> <input style="Width: 90px; height: 35px"
									type="number" value="1" name="txtCantidadProdA"
									id="txtCantidad"  onkeyup="if(value<1) value=1;" >
									<input name="txtUsuario" value="${usuario.getId()}" hidden>
								<button type="button" class="btn btn-primary my-3 w-[30px]"
									onClick="cargarTabla()">
									<span aria-hidden="true">Agregar</span>
								</button>
							</div>
							<div class="modal-header">
								<ul class="list-group" id="CointeinerProductos">

								</ul>
								<span>Total: $<input name="txtTotal" style="border:0;background: transparent;" id="txtTotal" value="0"></span></span>
							</div>
							
							<div class="modal-footer">
							<%ArrayList<Articulo> listaArticulosComprar = new ArrayList<Articulo>();
							%>
							<input name="listaArticulosComprar" id="listaArticulosComprar" value="${listaArticulosComprar }" hidden>
								<button type="button" class="btn btn-danger"
									data-dismiss="modal" onClick="cargarSession();">Cerrar</button>
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
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${ventas}">
					<tr>
						<th scope="row">${item.id}</th>
						<td><span>${item.getFecha_V().getDate()}/${item.getFecha_V().getMonth() + 1}//${item.getFecha_V().getYear()+1900 }</span></td>
						<td><span>${item.getId_Cliente().getNombre_C()}</span></td>
						<td><span>${item.getId_usuario().getEmpleadoU().getNombreE()}</span></td>
						<td><span>${item.getTotal_V()}</span></td>
						<td><span>
								<form action="EliminarVenta_ABMLVenta.html" method="post">
									<button type="submit" name="btnEliminar"
										value="${item.getId()}" class="btn btn-danger">
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
		<!-- Paginacion -->
		<nav aria-label="Page navigation example" class="mx-auto">
		<form action="Redireccionar_ABMLVentas.html" method="post">
			<select class="custom-select ddlFiltroVenta" id="ddlFiltroVenta"
				name="ddlFiltroVenta" hidden>
				<option selected value="0">Filtros</option>
				<option value="1">Fecha</option>
				<option value="2">Cliente</option>
				<option value="3">Vendedor</option>
				<option value="4">Total</option>
			</select> <input type="text" class="form-control txtFiltroVenta"
				aria-label="Text input with dropdown button" id="txtFiltroVenta"
				name="txtFiltroVenta" hidden>
			<ul class="pagination">
				<c:forEach begin="0" step="1" end="${cantPaginas}" var="variable">
					<%
						String paginaActual = "0";
									int variable = (int) pageContext.getAttribute("variable");
									if (request.getAttribute("paginaActual") != null) {
										paginaActual = (String) request.getAttribute("paginaActual");
									}
									if (variable >= Integer.parseInt(paginaActual) - 3
											&& variable <= Integer.parseInt(paginaActual) + 3) {
					%>
					<li class="page-item"><input type="submit" value="${variable}"
						class="page-link btn btn-secondary
						<%if(Integer.parseInt(paginaActual)==variable){%> text-white <%} %>"
						name="btnPagina" <%if(Integer.parseInt(paginaActual)==variable){%>
						disabled <%} %>></li>
					<%
						}
					%>
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
		var fecha = new Date().toJSON().slice(0, 10);
		// Mostrar la fecha en la etiqueta con id "fechaActual"
		document.getElementById("fechaActual").value = fecha;
	</script>
	<script type="text/javascript">
		var total = 0;
		var carrito = []
		function cargarTabla() {
			var producto = document.getElementById("txtProducto");
			var cantidad = document.getElementById("txtCantidad");
			var listaCarrito = document.getElementById("listaArticulosComprar");
			const container = document.querySelector("#CointeinerProductos");
			const item = document.createElement("li");
			item.classList.add("list-group-item")
			var productoObj = JSON.parse(producto.value.replaceAll("'", '"'));
			productoObj.cantidad = parseInt(cantidad.value)
			item.innerHTML = productoObj.nombreA + " "
					+ productoObj.marcaA.nombreM + " " + cantidad.value;
			container.appendChild(item);
			const txtTotal = document.getElementById("txtTotal");
			total = Number(parseInt(txtTotal.value)) + productoObj.precio*cantidad.value;
			txtTotal.value = total;
			carrito.push({productoObj:productoObj,cantidad:cantidad.value,subtotal:Number(productoObj.precio*cantidad.value)})
			listaCarrito.value = JSON.stringify(carrito)
		}
	</script>
	
		<script type="text/javascript">
	const ddls = document.getElementsByClassName("ddlFiltroVenta");
	const inputs = document.getElementsByClassName("txtFiltroVenta");
	
	for (let i = 0; i < ddls.length; i++) {
		ddls[i].addEventListener("change", (event) => {
			sessionStorage.setItem("ddlFiltroVenta", event.target.value);
		});
	}
	
	for (let i = 0; i < inputs.length; i++) {
		inputs[i].addEventListener("change", (event) => {
			sessionStorage.setItem("txtFiltroVenta", event.target.value);
		});
	}
	
	window.addEventListener("load", function() {
		for (let i = 0; i < ddls.length; i++) {
			if(sessionStorage.getItem("ddlFiltroVenta")== null){
				 ddls[i].value = 0;
			}else{
				ddls[i].value = sessionStorage.getItem("ddlFiltroVenta");
			}
		}
		for (let i = 0; i < inputs.length; i++) {
			inputs[i].value = sessionStorage.getItem("txtFiltroVenta");
		}
		
	})
	
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