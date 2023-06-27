package controller;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entidad.Articulo;
import entidad.Cliente;

import entidad.Usuario;
import entidad.Venta;
import entidad.VentaArticulo;
import servicioImpl.ServicioImplArticulo;
import servicioImpl.ServicioImplCliente;
import servicioImpl.ServicioImplVentaArticulo;
import servicioImpl.ServicioImplVentas;
import com.google.gson.Gson;

@Controller
public class ABMLVentasController {

	ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");

	@RequestMapping("Redireccionar_ABMLVentas.html")
	public ModelAndView eventoRedireccionarProducto(String btnPagina, HttpServletRequest request,
			String ddlFiltroVenta, String txtFiltroVenta) {
		ModelAndView MV = (ModelAndView) appContext.getBean("beanModelView");
		if (ddlFiltroVenta == null)
			ddlFiltroVenta = "0";
		if (txtFiltroVenta == null)
			txtFiltroVenta = "";
		MV = fetchData(MV, btnPagina, ddlFiltroVenta, txtFiltroVenta);
		return MV;
	}

	private ModelAndView fetchData(ModelAndView MV, String pagina, String ddlFiltroCliente, String txtFiltroCliente) {
		if (pagina == null)
			pagina = "0";
		ServicioImplVentas derImplVenta = (ServicioImplVentas) appContext.getBean("serviceBeanVenta");
		List<Venta> todosLasVentas = derImplVenta.obtenerTodasLasVentas( ddlFiltroCliente,  txtFiltroCliente);
		List<Venta> ventas = derImplVenta.obtenerTodasLasVentasSegunPagina(pagina,ddlFiltroCliente,txtFiltroCliente);
		ServicioImplCliente derImplCliente = (ServicioImplCliente) appContext.getBean("serviceBeanCliente");
		List<Cliente> todosLosClientes = derImplCliente.obtenerTodosLosClientes("0", "");
		ServicioImplArticulo derImplArticulo = (ServicioImplArticulo) appContext.getBean("serviceBeanArticulo");
		List<Articulo> todosLosArticulos = derImplArticulo.obtenerTodosLosArticulos("0", "");
		ServicioImplVentaArticulo derImplVentaArticulo = (ServicioImplVentaArticulo) appContext.getBean("serviceBeanVentaArticulo");
		List<VentaArticulo> todasLasVentasArticulos = derImplVentaArticulo.obtenerTodosLasVentasArticulos();

		MV.addObject("ventasArticulos", todasLasVentasArticulos);
		MV.addObject("productos", todosLosArticulos);
		MV.addObject("clientes", todosLosClientes);
		MV.addObject("ventas", ventas);
		MV.addObject("paginaActual", pagina);
		MV.addObject("cantPaginas", Math.ceil(todosLasVentas.size() / 5));
		MV.setViewName("ABMLVenta");
		return MV;
	}

	@RequestMapping("AgregarVenta_ABMLVenta.html")
	public ModelAndView eventoAgregarVenta(String txtFechaVentA, String txtCliente, String txtTotal,
			String txtUsuario,String listaArticulosComprar) {
		
		ModelAndView MV = (ModelAndView) appContext.getBean("beanModelView");
		try {

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-M-dd hh:mm:ss");
			Date fecha = formatter.parse(txtFechaVentA + " 00:00:00");
			float total = Float.valueOf(txtTotal);

			ServicioImplVentas derImplVenta = (ServicioImplVentas) appContext.getBean("serviceBeanVenta");
			boolean estado = derImplVenta.agregarVenta(fecha, txtCliente, txtUsuario, total);
			
			ServicioImplVentaArticulo derImplVentaArticulo = (ServicioImplVentaArticulo) appContext.getBean("serviceBeanVentaArticulo");
		    JSONParser parser = new JSONParser();
		    JSONArray jsonArray = (JSONArray) parser.parse(listaArticulosComprar);

		    for (Object obj : jsonArray) {
		        JSONObject ventaArticulo = (JSONObject) obj;
		        JSONObject productoObj = (JSONObject) ventaArticulo.get("productoObj");
		        String cantidad = (String) ventaArticulo.get("cantidad");
		        Long subtotal = (Long) ventaArticulo.get("subtotal");

		        // Realiza las operaciones necesarias con los datos obtenidos
		        int idArticulo=((Long) productoObj.get("id")).intValue();
		        int cantidadArticulo=Integer.parseInt(cantidad);
		        float subtotalArticulo=subtotal.floatValue();
		        derImplVentaArticulo.agregarVentaArticulo(idArticulo, cantidadArticulo, subtotalArticulo);
		    }
			
			MV.addObject("pudoAgregarse", estado);
			MV = fetchData(MV, "0", "0", "");
			MV.setViewName("ABMLVenta");

		} catch (Exception e) {
			e.printStackTrace(System.out);
		}
		return MV;
	}
	
	@RequestMapping("EliminarVenta_ABMLVenta.html")
	public ModelAndView eventoEliminarVenta(int btnEliminar) {

		int id = btnEliminar;
		ModelAndView MV = (ModelAndView) appContext.getBean("beanModelView");
		ServicioImplVentas derImplVenta = (ServicioImplVentas) appContext.getBean("serviceBeanVenta");
		int estado = derImplVenta.eliminarVenta(id);
		MV.addObject("pudoEliminarse", estado);
		MV = fetchData(MV, "0", "0", "");
		return MV;
	}
	
	@RequestMapping("ActualizarVenta_ABMLVenta.html")
	public ModelAndView eventoActualizarVenta(int txtIDVenta) {
		
		ModelAndView MV = (ModelAndView) appContext.getBean("beanModelView");
		try {
			ServicioImplVentas derImplVenta = (ServicioImplVentas) appContext.getBean("serviceBeanVenta");
			boolean seActualizo = derImplVenta.actualizarVenta(txtIDVenta);
			
			MV.addObject("pudoActualizarse", seActualizo);
			MV = fetchData(MV, "0", "0", "");
			MV.setViewName("ABMLVenta");

		} catch (Exception e) {
			e.printStackTrace(System.out);
		}
		return MV;
	}

}
