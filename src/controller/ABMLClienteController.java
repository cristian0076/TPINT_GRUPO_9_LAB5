package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entidad.Cliente;
import excepciones.AtSymbolNotFoundException;
import servicioImpl.ServicioImplCliente;

@Controller
public class ABMLClienteController {

	ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");

	@RequestMapping("Redireccionar_ABMLCliente.html")
	public ModelAndView eventoRedireccionarCliente(String btnPagina, HttpServletRequest request,
			String ddlFiltroCliente, String txtFiltroCliente) {
		ModelAndView MV = (ModelAndView) appContext.getBean("beanModelView");
		if (ddlFiltroCliente == null)
			ddlFiltroCliente = "0";
		if (txtFiltroCliente == null)
			txtFiltroCliente = "";
		MV = fetchData(MV, btnPagina, ddlFiltroCliente, txtFiltroCliente);
		return MV;
	}

	@RequestMapping("AgregarCliente_ABMLCliente.html")
	public ModelAndView eventoAgregarCliente(String txtDni, String txtNombre, String txtApellido, String txtDireccion,
			String txtFechaNac, String txtLocalidad, String txtMail, String txtSexo, String txtTelefono) {
		try {
			ModelAndView MV = (ModelAndView) appContext.getBean("beanModelView");
			AtSymbolNotFoundException excepcion = new AtSymbolNotFoundException(txtMail);
			excepcion.validateAtSymbol(txtMail);

			ServicioImplCliente derImplCliente = (ServicioImplCliente) appContext.getBean("serviceBeanCliente");
			boolean estado = derImplCliente.agregarCliente(txtDni, txtNombre, txtApellido, txtDireccion, txtFechaNac,
					txtLocalidad, txtMail, txtSexo, txtTelefono);

			MV.addObject("pudoAgregarse", estado);
			MV = fetchData(MV, "0", "0", "");
			return MV;
		} catch (Exception e) {
			ModelAndView MV = (ModelAndView) appContext.getBean("beanModelView");
			MV.addObject("MensajeError", e.getMessage());
			MV.addObject("pudoAgregarse", false);
			MV = fetchData(MV, "0", "0", "");
			return MV;
		}
	}

	@RequestMapping("EliminarCliente_ABMLCliente.html")
	public ModelAndView eventoEliminarCliente(int btnEliminar) {

		int id = btnEliminar;
		ModelAndView MV = (ModelAndView) appContext.getBean("beanModelView");
		ServicioImplCliente derImplCliente = (ServicioImplCliente) appContext.getBean("serviceBeanCliente");
		int estado = derImplCliente.eliminarCliente(id);
		MV.addObject("pudoEliminarse", estado);
		MV = fetchData(MV, "0", "0", "");
		return MV;
	}

	@RequestMapping("ModificarCliente_ABMLCliente.html")
	public ModelAndView eventoModificarCliente(int id_CM, String txtDniM, String txtNombreM, String txtApellidoM,
			String txtDireccionM, String txtFechaNacM, String txtLocalidadM, String txtMailM, String txtSexoM,
			String txtTelefonoM) {
		ModelAndView MV = (ModelAndView) appContext.getBean("beanModelView");
		ServicioImplCliente derImplCliente = (ServicioImplCliente) appContext.getBean("serviceBeanCliente");
		int estado = derImplCliente.modificarCliente(id_CM, txtDniM, txtNombreM, txtApellidoM, txtDireccionM,
				txtFechaNacM, txtLocalidadM, txtMailM, txtSexoM, txtTelefonoM);
		MV.addObject("pudoModificarse", estado);
		MV = fetchData(MV, "0", "0", "");
		return MV;
	}

	private ModelAndView fetchData(ModelAndView MV, String pagina, String ddlFiltroCliente, String txtFiltroCliente) {
		if (pagina == null)
			pagina = "0";
		ServicioImplCliente derImplCliente = (ServicioImplCliente) appContext.getBean("serviceBeanCliente");
		List<Cliente> todosLosClientes = derImplCliente.obtenerTodosLosClientes(ddlFiltroCliente, txtFiltroCliente);
		List<Cliente> clientes = derImplCliente.obtenerTodosLosClientesSegunPagina(pagina, ddlFiltroCliente,
				txtFiltroCliente);

		MV.addObject("clientes", clientes);
		MV.addObject("cantPaginas", Math.ceil(todosLosClientes.size() / 5));
		MV.addObject("paginaActual", pagina);
		MV.setViewName("ABMLCliente");
		return MV;
	}
}
