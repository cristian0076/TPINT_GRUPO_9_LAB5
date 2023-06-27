<%@page import="entidad.VentaArticulo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidad.Usuario"%>
<%@page import="entidad.Venta"%>
<%@page import="entidad.VentaArticulo"%>
<%@page import="entidad.Articulo"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
#myChart{
	margin:100px auto;
	width: 500px;
}
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

.cards {
	display: flex;
	flex-direction: row;
	gap: 15px;
	margin: 0 auto;
	margin-bottom: 100px;
}

.cards .red {
	background-color: #f43f5e;
}

.cards .blue {
	background-color: #3b82f6;
}

.cards .green {
	background-color: #22c55e;
}

.cards .card {
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	text-align: center;
	height: 100px;
	width: 250px;
	border-radius: 10px;
	color: white;
	cursor: pointer;
	transition: 400ms;
}

.cards .card p.tip {
	font-size: 1.5em;
	font-weight: 700;
}

.cards .card p.second-text {
	font-size: .8em;
}

.cards .card:hover {
	transform: scale(1.1, 1.1);
}
.cards


:hover
>
.card


:not

 

(
:hover

 

)
{
filter


:

 

blur


(10
px
);


	

transform


:

 

scale


(0
.9
,
0
.9


);
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
				if (session.getAttribute("usuario") != null && usuario.getTipoCuentaU().getId() == 2) {
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
			if (session.getAttribute("usuario") != null && usuario.getTipoCuentaU().getId() == 2) {
		%>
		<!-- Titulo -->
		<h2 class="my-3 ml-2 text-center">Detalle de ventas</h2>

		<!-- Busqueda / Filtro -->
		<div class=" w-50 mx-auto">
			<form action="Redireccionar_ABMLVentaContador.html"
				class="d-flex flex-row justify-content-center w-100">
				<input type="date" class="border mr-3 txtFiltroVentaContadorInicio"
					style="width: 200px;" id="txtFiltroVentaContadorInicio"
					name="txtFiltroVentaContadorInicio" value="2023-06-27"> <input
					type="date" style="width: 200px;"
					class="border mr-3 txtFiltroVentaContadorFin"
					id="txtFiltroVentaContadorFin" name="txtFiltroVentaContadorFin"
					value="2023-06-27">
				<div class="input-group-append mr-3">
					<button class="btn btn-primary" type="submit">Buscar</button>
				</div>
			</form>
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
						<td style="transition: all 0.5s;"><span>${item.isStockDescontadoV() ? 'Si' : 'No'}</span></td>
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
		<form action="Redireccionar_ABMLVentaContador.html" method="post">
			<input type="date" class="border mr-3 txtFiltroVentaContadorInicio"
				style="width: 200px;" id="txtFiltroVentaContadorInicio"
				name="txtFiltroVentaContadorInicio" value="2023-06-27" hidden>
			<input type="date" style="width: 200px;"
				class="border mr-3 txtFiltroVentaContadorFin"
				id="txtFiltroVentaContadorFin" name="txtFiltroVentaContadorFin"
				hidden value="2023-06-27">
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
		<!-- Totales -->
		<div class="cards">
			<div class="card red">
				<p class="tip">$${sumaVenta }</p>
				<p class="second-text">Total VENTA</p>
			</div>
			<div class="card blue">
				<p class="tip">$${sumaCompra }</p>
				<p class="second-text">Total COMPRA</p>
			</div>
			<div class="card green">
				<p class="tip">$${ganancia }</p>
				<p class="second-text">GANANCIA</p>
			</div>
		</div>

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
			var redirectionUrl = 'http://' + currentDomain + ':' + currentPort
					+ '/TPINT_GRUPO_9_LAB5/Redireccionar_IndexGeneral.html';

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
			var redirectionUrl = 'http://' + currentDomain + ':' + currentPort
					+ '/TPINT_GRUPO_9_LAB5/Redireccionar_Login.html';

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
	const inputsInicio = document.getElementsByClassName("txtFiltroVentaContadorInicio");
	const inputsFin = document.getElementsByClassName("txtFiltroVentaContadorFin");
	
	for (let i = 0; i < inputsInicio.length; i++) {
		inputsInicio[i].addEventListener("change", (event) => {
			sessionStorage.setItem("txtFiltroVentaContadorInicio", event.target.value);
		});
	}
	
	for (let i = 0; i < inputsFin.length; i++) {
		inputsFin[i].addEventListener("change", (event) => {
			sessionStorage.setItem("txtFiltroVentaContadorFin", event.target.value);
		});
	}
	
	window.addEventListener("load", function() {
		for (let i = 0; i < inputsInicio.length; i++) {
			if(sessionStorage.getItem("txtFiltroVentaContadorInicio")!=null)
			inputsInicio[i].value = sessionStorage.getItem("txtFiltroVentaContadorInicio");
		}
		for (let i = 0; i < inputsFin.length; i++) {
			if(sessionStorage.getItem("txtFiltroVentaContadorInicio")!=null)
			inputsFin[i].value = sessionStorage.getItem("txtFiltroVentaContadorFin");
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