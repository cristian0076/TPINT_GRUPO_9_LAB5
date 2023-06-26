<%@page import="entidad.Cliente"%>
<%@page import="java.util.List"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="entidad.Usuario"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cliente</title>
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
		<h2 class="my-3 ml-2 text-center">Cliente</h2>

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
								Cliente</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form action="AgregarCliente_ABMLCliente.html" method="post"
							id="resetForm">
							<div class="modal-body">
								<span>DNI</span> <input type="text" class="form-control"
									name="txtDni" placeholder="DNI Cliente" required="required"
									maxlength="10"> <span>Nombre</span> <input type="text"
									class="form-control" name="txtNombre"
									placeholder="Nombre Cliente" required="required" maxlength="20">
								<span>Apellido</span> <input type="text" class="form-control"
									name="txtApellido" placeholder="Apellido Cliente"
									required="required" maxlength="20"> <span>Sexo</span> <select
									class="custom-select" name="txtSexo">
									<option selected value="Masculino">Masculino</option>
									<option value="Femenino">Femenino</option>
									<option value="Otro">Otro</option>
								</select> <span>Fecha de Nac.</span> <input type="date"
									name="txtFechaNac" value="2023-06-19"> <span>Localidad</span>
								<select class="form-control" name="txtLocalidad"
									required="required">
									<option value="">Selecciona una localidad</option>
									<option value="Buenos Aires">Buenos Aires</option>
									<option value="La Plata">La Plata</option>
									<option value="Mar del Plata">Mar del Plata</option>
									<option value="Bahía Blanca">Bahía Blanca</option>
									<option value="Quilmes">Quilmes</option>
									<option value="Lomas de Zamora">Lomas de Zamora</option>
									<option value="Morón">Morón</option>
									<option value="Pilar">Pilar</option>
									<option value="San Isidro">San Isidro</option>
									<option value="Tigre">Tigre</option>
									<option value="San Martín">San Martín</option>
									<option value="San Miguel">San Miguel</option>
									<option value="Avellaneda">Avellaneda</option>
									<option value="Lanús">Lanús</option>
									<option value="Berazategui">Berazategui</option>
								</select> <span>Direccion</span> <input type="text" class="form-control"
									name="txtDireccion" placeholder="Direccion" required="required">
								<span>Mail</span> <input type="text" class="form-control"
									name="txtMail" placeholder="Email del Cliente"
									required="required" maxlength="50"> <span>Telefono</span>
								<input type="tel" class="form-control" name="txtTelefono"
									placeholder="Telefono del Cliente" required="required"
									maxlength="15"
									oninput="this.value = this.value.replace(/\D/g, '')">
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
			<!-- modificar -->
			<div class="modal fade" id="modalModificar" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalCenterTitle"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle">Modificar
								Cliente</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form action="ModificarCliente_ABMLCliente.html" method="post">
							<div class="modal-body">
								<span>DNI</span> <input type="text" class="form-control"
									name="txtDniM" placeholder="DNI Cliente" required="required"
									maxlength="10"> <span>Nombre</span> <input type="text"
									class="form-control" name="txtNombreM"
									placeholder="Nombre Cliente" required="required" maxlength="20">
								<span>Apellido</span> <input type="text" class="form-control"
									name="txtApellidoM" placeholder="Apellido Cliente"
									required="required" maxlength="20"> <span>Sexo</span> <select
									class="custom-select" name="txtSexoM">
									<option selected value="Masculino">Masculino</option>
									<option value="Femenino">Femenino</option>
									<option value="Otro">Otro</option>
								</select> <span>Fecha de Nac.</span> <input type="date"
									name="txtFechaNacM" value="2023-06-19"> <span>Localidad</span>
								<select class="form-control" name="txtLocalidadM"
									required="required">
									<option value="">Selecciona una localidad</option>
									<option value="Buenos Aires">Buenos Aires</option>
									<option value="La Plata">La Plata</option>
									<option value="Mar del Plata">Mar del Plata</option>
									<option value="Bahía Blanca">Bahía Blanca</option>
									<option value="Quilmes">Quilmes</option>
									<option value="Lomas de Zamora">Lomas de Zamora</option>
									<option value="Morón">Morón</option>
									<option value="Pilar">Pilar</option>
									<option value="San Isidro">San Isidro</option>
									<option value="Tigre">Tigre</option>
									<option value="San Martín">San Martín</option>
									<option value="San Miguel">San Miguel</option>
									<option value="Avellaneda">Avellaneda</option>
									<option value="Lanús">Lanús</option>
									<option value="Berazategui">Berazategui</option>
								</select> <span>Direccion</span> <input type="text" class="form-control"
									name="txtDireccionM" placeholder="Direccion" required="required">
								<span>Mail</span> <input type="text" class="form-control"
									name="txtMailM" placeholder="Email del Cliente"
									required="required" maxlength="50"> <span>Telefono</span>
								<input type="tel" class="form-control" name="txtTelefonoM"
									placeholder="Telefono del Cliente" required="required"
									maxlength="15"
									oninput="this.value = this.value.replace(/\D/g, '')"> <input
									type="hidden" name="id_CM">
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

			<!-- Busqueda / Filtro -->
			<div class="input-group w-50 ml-3">
				<form action="Redireccionar_ABMLCliente.html" class="input-group">
					<select class="custom-select ddlFiltroCliente"
						id="ddlFiltroCliente" name="ddlFiltroCliente">
						<option selected value="0">Filtros</option>
						<option value="1">ID</option>
						<option value="2">DNI</option>
						<option value="3">Nombre</option>
						<option value="4">Apellido</option>
						<option value="5">Sexo</option>
						<option value="6">Mail</option>
						<option value="7">Telefono</option>
						<option value="8">Direccion</option>
						<option value="9">Localidad</option>
					</select> <input type="text" class="form-control txtFiltroCliente"
						aria-label="Text input with dropdown button" id="txtFiltroCliente"
						name="txtFiltroCliente">
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
					<th scope="col">DNI</th>
					<th scope="col">Nombre</th>
					<th scope="col">Apellido</th>
					<th scope="col">Sexo</th>
					<th scope="col">Fecha Nac.</th>
					<th scope="col">Direccion</th>
					<th scope="col">Localidad</th>
					<th scope="col">Correo electronico</th>
					<th scope="col">Telefono</th>
					<th scope="col"></th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${clientes}">
					<tr>
						<th scope="row">${item.getId() }</th>
						<td><span>${item.getDNI_C() }</span></td>
						<td><span>${item.getNombre_C() }</span></td>
						<td><span>${item.getApellido_C() }</span></td>
						<td><span>${item.getSexo_C() }</span></td>
						<td><span>${item.getFecha_Nacimiento_C().getDate()}/${item.getFecha_Nacimiento_C().getMonth() + 1}//${item.getFecha_Nacimiento_C().getYear()+1900 }</span></td>
						<td><span>${item.getDireccion_C() }</span></td>
						<td><span>${item.getLocalidad_C() }</span></td>
						<td><span>${item.getMail_C() }</span></td>
						<td><span>${item.getTelefono_C() }</span></td>
						<td><span>

								<button type="submit" class="btn btn-warning "
									data-toggle="modal" data-target="#modalModificar"
									onclick="cargarDatos(${item.getId()}, '${item.getDNI_C() }', '${item.getNombre_C() }', '${item.getApellido_C() }', '${item.getSexo_C() }' , '${item.getFecha_Nacimiento_C() }' , '${item.getDireccion_C() }', '${item.getLocalidad_C() }', '${item.getMail_C() }', '${item.getTelefono_C() }')">

									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-pencil-fill"
										viewBox="0 0 16 16"> <path
										d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z" />
									</svg>
								</button>
						</span></td>
						<td><span>
								<form action="EliminarCliente_ABMLCliente.html" method="post"
									onsubmit="return confirm('¿Está seguro que desea borrar el Cliente?');">
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
		<form action="Redireccionar_ABMLCliente.html" method="post">
			<select class="custom-select ddlFiltroCliente" id="ddlFiltroCliente"
				name="ddlFiltroCliente" hidden>
				<option selected value="0">Filtros</option>
				<option value="1">ID</option>
				<option value="2">DNI</option>
				<option value="3">Nombre</option>
				<option value="4">Apellido</option>
				<option value="5">Sexo</option>
				<option value="6">Mail</option>
				<option value="7">Telefono</option>
				<option value="8">Direccion</option>
				<option value="9">Localidad</option>
			</select> <input type="text" class="form-control txtFiltroCliente"
				aria-label="Text input with dropdown button" id="txtFiltroCliente"
				name="txtFiltroCliente" hidden>
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

		<!-- AGREGADO -->
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
		<div class="alert alert-danger" role="alert">Error al agregar, usuario repetido</div>
		<%
			}
					}
		%>
		<!-- ELIMINADO -->
				<%
			if (request.getAttribute("pudoEliminarse") != null) {
						Integer pudoEliminarse = (Integer) request.getAttribute("pudoEliminarse");
						if (pudoEliminarse>0) {
		%>
		<div class="alert alert-success" role="alert">Se Elimino
			correctamente!</div>
		<%
			} else {
		%>
		<div class="alert alert-danger" role="alert">Error al eliminar</div>
		<%
			}
					}
		%>
		<!-- MODIFICACION -->
				<%
			if (request.getAttribute("pudoModificarse") != null) {
						Integer pudoModificarse = (Integer) request.getAttribute("pudoModificarse");
						if (pudoModificarse>0) {
		%>
		<div class="alert alert-success" role="alert">Se modifico
			correctamente!</div>
		<%
			} else {
		%>
		<div class="alert alert-danger" role="alert">Error al modificar</div>
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
		<footer id="sticky-footer"
			class="py-4 bg-dark text-white-50 fixed-bottom">
		<div class="container text-center">
			<span class="logo-text text-white">© 2023 - By Grupo Nro 9
				LAB5 - todos los derechos reservados </span>
		</div>
		</footer>
	</f:view>

	<script type="text/javascript">
	function cargarDatos(id, dni, nombre, apellido, sexo ,fechaNac, direccion, localidad, mail, telefono){
		$('input[name="id_CM"]').val(id);
		$('input[name="txtDniM"]').val(dni);
		$('input[name="txtNombreM"]').val(nombre);
		$('input[name="txtApellidoM"]').val(apellido);
		$('input[name="txtSexoM"]').val(sexo);
		$('input[name="txtFechaNacM"]').val(fechaNac.slice(0,10));
		$('select[name="txtLocalidadM"]').val(localidad);
		$('input[name="txtDireccionM"]').val(direccion);
		$('input[name="txtMailM"]').val(mail);
		$('input[name="txtTelefonoM"]').val(telefono);
    }
	</script>
	<script type="text/javascript">
	const ddls = document.getElementsByClassName("ddlFiltroCliente");
	const inputs = document.getElementsByClassName("txtFiltroCliente");
	
	for (let i = 0; i < ddls.length; i++) {
		ddls[i].addEventListener("change", (event) => {
			sessionStorage.setItem("ddlFiltroCliente", event.target.value);
		});
	}
	
	for (let i = 0; i < inputs.length; i++) {
		inputs[i].addEventListener("change", (event) => {
			sessionStorage.setItem("txtFiltroCliente", event.target.value);
		});
	}
	
	window.addEventListener("load", function() {
		for (let i = 0; i < ddls.length; i++) {
			if(sessionStorage.getItem("ddlFiltroCliente")== null){
				 ddls[i].value = 0;
			}else{
				ddls[i].value = sessionStorage.getItem("ddlFiltroCliente");
			}
		}
		for (let i = 0; i < inputs.length; i++) {
			inputs[i].value = sessionStorage.getItem("txtFiltroCliente");
		}
		
	})
	
	</script>
	<script>
      function resetForm(){
        var element = document.getElementById("resetForm");
         element.reset()
      }
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