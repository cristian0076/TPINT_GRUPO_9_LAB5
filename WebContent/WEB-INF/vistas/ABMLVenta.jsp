<%@page import="entidad.VentaArticulo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidad.Usuario"%>
<%@page import="entidad.Venta"%>
<%@page import="entidad.VentaArticulo"%>
<%@page import="entidad.Articulo"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	left: -100%;
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
		style="width: 100%; display: flex; flex-direction: column; justify-content: center;overflow:hidden;">
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
			<div class="ml-auto">
				<div class="dropdown">
					<div class="btn-icon" onclick="toggleDropdown()">
						<svg name="btnImage" xmlns="http://www.w3.org/2000/svg" width="30"
							height="30" fill="currentColor"
							class="bi bi-person-circle text-white" viewBox="0 0 16 16">
						<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" /> <path
							fill-rule="evenodd"
							d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
						</svg>
					</div>
					<div id="dropdownContent" class="dropdown-content">
						<form action="Salir.html" method="post">
							<input type="submit" value="Cerrar Sesión" name="btnSalir"
								class="btn btn-link">
						</form>
					</div>
				</div>
			</div>
			<span class="text-white mr-3 font-weight-bold ml-2">${usuario.getEmpleadoU().getNombreE()}</span>
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
						name="ddlFiltroVenta">
						<option selected value="0">Filtros</option>
						<option value="1">Fecha</option>
						<option value="2">Cliente</option>
						<option value="3">Vendedor</option>
						<option value="4">Total</option>
					</select> <input type="text" class="form-control txtFiltroVenta"
						aria-label="Text input with dropdown button" id="txtFiltroVenta"
						name="txtFiltroVenta">
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
						<form action="AgregarVenta_ABMLVenta.html" method="post"
							id="resetForm">
							<div class="modal-body">
								<span>Fecha: </span> <input type="text"
									style="pointer-events: none; user-select: none; border: 0;"
									name="txtFechaVentA" id="fechaActual"> <br> <br>
								<span>Cliente</span> <select class="form-control"
									name="txtCliente" required="required" id="txtCliente">
									<c:forEach var="client" items="${clientes}">
										<option value="${client.getId()}">${client.getNombre_C()}-
											${client.getApellido_C()}</option>
									</c:forEach>
								</select> <br> <span>Producto</span> <select class="form-control"
									name="txtProducto" required="required" id="txtProducto">
									<c:forEach var="prod" items="${productos}">
										<option value="${prod}">${prod.getNombreA()}-
											${prod.getMarcaA().getNombreM()} -
											$${prod.isPrecioUnitario()}</option>
									</c:forEach>
								</select> <span>Cantidad</span> <input style="Width: 90px; height: 35px"
									type="number" value="1" name="txtCantidadProdA"
									id="txtCantidad"
									onchange="if(value<0) value=0; if(value>1000) value=1000;" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" maxlength="4">
								<input name="txtUsuario" value="${usuario.getId()}" hidden>
								<button type="button" class="btn btn-primary my-3 w-[30px]"
									onClick="cargarTabla()">
									<span aria-hidden="true">Agregar</span>
								</button>
								<button type="button" class="btn btn-primary my-3 w-[30px]"
									onClick="resetearTabla()">
									<span aria-hidden="true">Resetear</span>
								</button>

							</div>
							<div class="" style="height: 150px; overflow-y: scroll;">
								<ul class="list-group" id="CointeinerProductos">

								</ul>
							</div>
							<div class="container">
								<span>Total: $<input name="txtTotal"
									style="pointer-events: none; user-select: none; border: 0;"
									id="txtTotal" value="0"></span>
							</div>
							<div class="modal-footer">
								<%
									ArrayList<Articulo> listaArticulosComprar = new ArrayList<Articulo>();
								%>
								<input name="listaArticulosComprar" id="listaArticulosComprar"
									value="${listaArticulosComprar }" hidden required> <a
									class="btn btn-danger"
									id= "btnCerrarAgregar"
									onclick="resetForm()">Cerrar</a> <input type="submit"
									value="Guardar" class="btn btn-success" name="btnGuardar">
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
					<th></th>
					<th scope="col">ID</th>
					<th scope="col">Fecha</th>
					<th scope="col">Cliente</th>
					<th scope="col">Vendedor</th>
					<th scope="col">Total</th>
					<th scope="col">Venta cerrada?</th>
					<th scope="col"></th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${ventas}">
					<tr>
						<td style="transition: all 0.5s;"><a class="btn btn-primary"
							data-toggle="collapse" href="#collapseExample${item.id}"
							role="button" aria-expanded="false"
							aria-controls="collapseExample${item.id}"> <svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-arrow-down-circle-fill"
									viewBox="0 0 16 16"> <path
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z" />
								</svg>
						</a></td>
						<th scope="row">${item.id}</th>
						<td style="transition: all 0.5s;"><span>${item.getFecha_V().getDate()}/${item.getFecha_V().getMonth() + 1}/${item.getFecha_V().getYear()+1900 }</span></td>
						<td style="transition: all 0.5s;"><span>${item.getId_Cliente().getNombre_C()}</span></td>
						<td style="transition: all 0.5s;"><span>${item.getId_usuario().getEmpleadoU().getNombreE()}</span></td>
						<td style="transition: all 0.5s;"><span>${item.getTotal_V()}</span></td>
						<td style="transition: all 0.5s;"><span>${item.isStockDescontadoV()}</span></td>
						<td style="transition: all 0.5s;"><span> <%
 	if (!((Venta) pageContext.getAttribute("item")).isStockDescontadoV()) {
 %>
								<form action="EliminarVenta_ABMLVenta.html" method="post"
									onsubmit="return confirm('¿Está seguro que desea borrar la venta?');">
									<button type="submit" name="btnEliminar"
										value="${item.getId()}" class="btn btn-danger">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-trash-fill"
											viewBox="0 0 16 16"> <path
											d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z" />
										</svg>
									</button>
								</form> <%
 	}
 %>
						</span></td>
						<td><span> <%
 	if (!((Venta) pageContext.getAttribute("item")).isStockDescontadoV()) {
 %>
								<form action="ActualizarVenta_ABMLVenta.html" method="post">
									<input type="text" name="txtIDVenta" value="${item.getId() }"
										hidden>
									<button type="submit" class="btn btn-warning">Cerrar
										venta</button>
								</form> <%
 	}
 %>
						</span></td>
					</tr>
					<tr>
						<td>
							<div class="collapse" id="collapseExample${item.id}">
								<div class="card card-body">
									<ul class="list-group">
										<c:forEach var="ite" items="${ventasArticulos}">
											<%
												Venta ve = (Venta) pageContext.getAttribute("item");
																VentaArticulo va = (VentaArticulo) pageContext.getAttribute("ite");
																if (va.getVentaVA().getId() == ve.getId()) {
											%>
											<li class="list-group-item"><b>Articulo:</b><%=va.getArticuloVA().getNombreA()%>
												<b>Marca:</b><%=va.getArticuloVA().getMarcaA().getNombreM()%>
												<b>Cantidad:</b><%=va.getCantidadVA()%> <b>Subtotal:</b>$<%=va.getSubtotalVA()%></li>
											<%
												}
											%>
										</c:forEach>
									</ul>
								</div>
							</div>
						</td>
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
			if (request.getAttribute("pudoActualizarse") != null) {
						boolean pudoActualizarse = (boolean) request.getAttribute("pudoActualizarse");
						if (pudoActualizarse) {
		%>
		<div class="alert alert-success" role="alert">Se cerro la venta
			correctamente!</div>
		<%
			} else {
		%>
		<div class="alert alert-danger" role="alert">Insuficiente stock!</div>
		<%
			}
					}
		%>

		<%
			if (request.getAttribute("pudoEliminarse") != null) {
						Integer pudoEliminarse = (Integer) request.getAttribute("pudoEliminarse");
						if (pudoEliminarse != 0) {
		%>
		<div class="alert alert-success" role="alert">Se elimino
			correctamente!</div>
		<%
			} else {
		%>
		<div class="alert alert-danger" role="alert">Error al eliminar</div>
		<%
			}
					}
		%>

		<%
			if (request.getAttribute("pudoAgregarse") != null) {
						Boolean pudoAgregarse = (Boolean) request.getAttribute("pudoAgregarse");
						if (pudoAgregarse) {
		%>
		<div class="alert alert-success" role="alert">Se agrego
			correctamente!</div>
		<%
			} else {
		%>
		<div class="alert alert-danger" role="alert">Error al agregar</div>
		<%
			}
					}
		%>





		<%
			} else {
					if (session.getAttribute("usuario") != null) {
		%>
		<head>
<meta http-equiv="refresh" content="0;url=" id="redirectMeta">
<title>Redireccionando...</title>
		</head>
		<h1>Redireccionando...</h1>
		<p>Estás siendo redirigido a otra página. Si no eres redirigido
			automáticamente, haz clic en el siguiente enlace:</p>
		<a id="redirectionLink" href="#">Enlace de redirecci�n</a>

		<script>
    // Obtener el dominio actual del navegador
    var currentDomain = window.location.hostname;

    // Obtener el puerto actual del navegador
    var currentPort = window.location.port;

    // Construir la URL de redirecci�n con el dominio y el puerto actuales
   
	var redirectionUrl = 'http://' + currentDomain + ':' + currentPort+ '/TPINT_GRUPO_9_LAB5/Redireccionar_IndexGeneral.html';
    // Obtener una referencia al elemento meta
    var metaElement = document.getElementById('redirectMeta');

    // Modificar el contenido del atributo "content" del meta tag
    metaElement.setAttribute('content', '5;url=' + redirectionUrl);

    // Actualizar el enlace de redirecci�n con la URL din�mica
    document.getElementById('redirectionLink').href = redirectionUrl;
  </script>
		<%
			} else {
		%>

		<head>
<meta http-equiv="refresh" content="5;url=" id="redirectMeta2">
<title>Redireccionando...</title>
		</head>
		<h1>Redireccionando...</h1>
		<p>Estás siendo redirigido a otra página. Si no eres redirigido
			automáticamente, haz clic en el siguiente enlace:</p>
		<a id="redirectionLink2" href="#">Enlace de redirecci�n</a>

		<script>
    // Obtener el dominio actual del navegador
    var currentDomain = window.location.hostname;

    // Obtener el puerto actual del navegador
    var currentPort = window.location.port;

    // Construir la URL de redirecci�n con el dominio y el puerto actuales
    var redirectionUrl = 'http://' + currentDomain + ':' + currentPort + '/TPINT_GRUPO_9_LAB5/Redireccionar_Login.html';
    // Obtener una referencia al elemento meta
    var metaElement = document.getElementById('redirectMeta2');

    // Modificar el contenido del atributo "content" del meta tag
    metaElement.setAttribute('content', '5;url=' + redirectionUrl);

    // Actualizar el enlace de redirecci�n con la URL din�mica
    document.getElementById('redirectionLink2').href = redirectionUrl;
  </script>
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
			var container = document.querySelector("#CointeinerProductos");
			var item = document.createElement("li");
			item.classList.add("list-group-item")
			item.classList.add("itemList")
			var productoObj = JSON.parse(producto.value.replaceAll("'", '"'));
			let repetido = false;
			let indexOfProducto
			carrito.forEach((itemList,index)=>{
				if(itemList.productoObj.id==productoObj.id){
					itemList.cantidad=(Number(itemList.cantidad)+Number(cantidad.value)).toString();
					repetido=true;
					indexOfProducto=index
				}
			})
			if(!repetido){
				productoObj.cantidad = cantidad.value;
				item.innerHTML = productoObj.nombreA + " "+productoObj.marcaA.nombreM + " " + cantidad.value;
				container.appendChild(item);
				const txtTotal = document.getElementById("txtTotal");
				total = Number(parseInt(txtTotal.value)) + productoObj.precio*cantidad.value;
				txtTotal.value = total;
				carrito.push({productoObj:productoObj,cantidad:cantidad.value,subtotal:Number(productoObj.precio*cantidad.value)})
				listaCarrito.value = JSON.stringify(carrito)
			}else{
				var itemsToLocate = document.getElementsByClassName("itemList");
				for (var i = 0; i < itemsToLocate.length; i++) {
					if(itemsToLocate[i].innerHTML.includes(productoObj.nombreA) && itemsToLocate[i].innerHTML.includes(productoObj.marcaA.nombreM)){
						itemsToLocate[i].innerHTML = productoObj.nombreA + " "+productoObj.marcaA.nombreM + " " + (Number(carrito[indexOfProducto].cantidad));
						total = Number(parseInt(txtTotal.value)) + productoObj.precio*cantidad.value;
						txtTotal.value = total;
						listaCarrito.value = JSON.stringify(carrito)
					}
				}
			}
		}
		function resetearTabla(){
			carrito = [];
			total=0;
			const container = document.querySelector("#CointeinerProductos");
			var listaCarrito = document.getElementById("listaArticulosComprar");
			const txtTotal = document.getElementById("txtTotal");
			listaCarrito.value="";
			container.innerHTML = '';
			txtTotal.value=0;
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

	<script>
      function resetForm(){
        var element = document.getElementById("resetForm");
         element.reset()
      }
      
   </script>
   		<script>
    // Obtener el dominio actual del navegador
    var currentDomain = window.location.hostname;

    // Obtener el puerto actual del navegador
    var currentPort = window.location.port;

    // Construir la URL de redirecci�n con el dominio y el puerto actuales
    var redirectionUrl = 'http://' + currentDomain + ':' + currentPort + '/TPINT_GRUPO_9_LAB5/Redireccionar_ABMLVentas.html';
    // Obtener una referencia al elemento meta
    var metaElement = document.getElementById('btnCerrarAgregar');
     metaElement.setAttribute('href',redirectionUrl);
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