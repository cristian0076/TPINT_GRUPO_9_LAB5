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
<title>ABML Stock</title>
<link href="Estilos/login.css" rel="StyleSheet" type="text/css">
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
<body style="height: 100vh; width: 100%;">
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

		<!-- Titulo -->
		<%
			if (session.getAttribute("usuario") != null && usuario.getTipoCuentaU().getId() == 1) {
		%>
		<h2 class="my-3 ml-2 text-center">Stock</h2>


		<div class="modal fade" id="modalStock" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">Añadir
							Stock</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form action="AgregarStock_ABMLStock.html" method="post"
						id="resetForm">
						<div class="modal-body">
							<span>Producto</span> <select class="form-control"
								name="txtProducto" required="required">
								<option value="" disabled selected>Seleccione un
									producto</option>
								<c:forEach var="prod" items="${Productos}">
									<option value="${prod.id}">${prod.nombreA}-
										${prod.marcaA.nombreM}</option>
								</c:forEach>
							</select> <span>Cantidad</span> <input type="number" class="form-control"
								name="txtCantidad" placeholder="Cantidad" required="required">
							<span>Precio de compra</span> <input type="number"
								class="form-control" name="txtPrecioC" placeholder="Precio"
								required="required"> <span>Fecha de vencimiento</span> <input
								type="date" class="form-control" name="txtVencimiento"
								id="txtVencimiento" placeholder="Vencimiento"
								required="required" oninput="validateDate(this)">
						</div>
						<div class="modal-footer">
							<button class="btn btn-danger" data-dismiss="modal" type="reset"
								value="Reset" onclick="resetForm()">Cerrar</button>
							<input type="submit" value="Guardar" class="btn btn-success"
								name="btnGuardar">
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- Boton agregar -->
		<button type="submit" data-toggle="modal" data-target="#modalStock"
			class="btn btn-primary my-3 w-[30px] mx-auto" data-toggle="modal"
			data-target="#exampleModalCenter">Añadir +</button>

		<!-- Busqueda / Filtro -->
		<div class="input-group w-50 ml-3 mx-auto">
			<form action="Redireccionar_ABMLStock.html" class="input-group">
				<select class="custom-select ddlFiltroStock" id="ddlFiltroStock"
					name="ddlFiltroStock">
					<option selected value="0">Filtros</option>
					<option value="1">ID</option>
					<option value="2">Fecha vencimiento</option>
					<option value="3">Cantidad</option>
					<option value="4">Fecha ingreso</option>
					<option value="5">precio de compra</option>
					<option value="6">Producto</option>
				</select> <input type="text" class="form-control txtFiltroStock"
					aria-label="Text input with dropdown button" id="txtFiltroStock"
					name="txtFiltroStock">
				<div class="input-group-append">
					<button class="btn btn-outline-primary" type="submit">Buscar</button>
				</div>
			</form>
		</div>
		</div>

		<!-- Tabla -->
		<table class="table table-striped w-75 mx-auto">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Fecha de ingreso</th>
					<th scope="col">Articulo</th>
					<th scope="col">Marca</th>
					<th scope="col">Tipo</th>
					<th scope="col">Cantidad</th>
					<th scope="col">Fecha Vencimiento</th>
					<th scope="col">Precio de compra</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${stocks}">
					<tr>
						<th scope="row">${item.id}<input type="hidden"
							value="${item.id}"></th>
						<td><span>${item.fechaIngreso.getDate()}/${item.fechaIngreso.getMonth() + 1}/${item.fechaIngreso.getYear()+1900 }</span></td>
						<td><span>${item.articulo.nombreA}</span></td>
						<td><span>${item.articulo.marcaA.nombreM}</span></td>
						<td><span>${item.articulo.tipoA.nombre}</span></td>
						<td><span>${item.cantidad}</span></td>
						<td><span>${item.getFechaVencimientoS().getDate()}/${item.getFechaVencimientoS().getMonth() + 1}/${item.getFechaVencimientoS().getYear()+1900 }</span></td>
						<td><span>${item.precioCompra}</span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


		<nav aria-label="Page navigation example" class="mx-auto">
		<form action="Redireccionar_ABMLStock.html" method="post">
			<select class="custom-select ddlFiltroStock" id="ddlFiltroStock"
				name="ddlFiltroStock" hidden>
				<option selected value="0">Filtros</option>
				<option value="1">ID</option>
				<option value="2">Fecha vencimiento</option>
				<option value="3">Cantidad</option>
				<option value="4">Fecha ingreso</option>
				<option value="5">precio de compra</option>
				<option value="6">Producto</option>
			</select> <input type="hidden" class="form-control txtFiltroStock"
				aria-label="Text input with dropdown button" id="txtFiltroStock"
				name="txtFiltroStock">
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
			boolean menor1 = true;
					if (request.getAttribute("menor1") != null) {
						menor1 = (boolean) request.getAttribute("menor1");
					}
					if (menor1 == true) {
		%>
		<div class="alert alert-danger" role="alert">La cantidad o
			precio indicado son menores a 1!</div>
		<%
			}
		%>



		<%
			boolean pudoAgregarse = false;
					int pudoModificarse = 0;
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

		<%
			} else {
					if (session.getAttribute("usuario") != null) {
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
			} else {
		%>
		<meta http-equiv="refresh" content="5;url=" id="redirectMeta">
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
    var redirectionUrl = 'http://' + currentDomain + ':' + currentPort + '/TPINT_GRUPO_9_LAB5/';

    // Obtener una referencia al elemento meta
    var metaElement = document.getElementById('redirectMeta');

    // Modificar el contenido del atributo "content" del meta tag
    metaElement.setAttribute('content', '5;url=' + redirectionUrl);

    // Actualizar el enlace de redirección con la URL dinámica
    document.getElementById('redirectionLink').href = redirectionUrl;
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

	<script type="text/javascript">
	//limitar la fecha de vencimiento al dia de hoy.
	var fechaActual = new Date();
	fechaActual.setDate(fechaActual.getDate() - 1);
	var fechaActualFormateada = fechaActual.toISOString().split("T")[0];
    var inputFecha = document.getElementById("txtVencimiento");
    inputFecha.setAttribute("min", fechaActualFormateada);
	</script>


	</script>
	<script type="text/javascript">
	const ddls = document.getElementsByClassName("ddlFiltroStock");
	const inputs = document.getElementsByClassName("txtFiltroStock");
	
	for (let i = 0; i < ddls.length; i++) {
		ddls[i].addEventListener("change", (event) => {
			sessionStorage.setItem("ddlFiltroStock", event.target.value);
		});
	}
	
	for (let i = 0; i < inputs.length; i++) {
		inputs[i].addEventListener("change", (event) => {
			sessionStorage.setItem("txtFiltroStock", event.target.value);
		});
	}
	
	window.addEventListener("load", function() {
		for (let i = 0; i < ddls.length; i++) {
			if(sessionStorage.getItem("ddlFiltroStock")== null){
				 ddls[i].value = 0;
			}else{
				ddls[i].value = sessionStorage.getItem("ddlFiltroStock");
			}
		}
		for (let i = 0; i < inputs.length; i++) {
			inputs[i].value = sessionStorage.getItem("txtFiltroStock");
		}
		
	})
	
	</script>
	<script>
      function resetForm(){
        var element = document.getElementById("resetForm");
         element.reset()
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