package controller;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entidad.Articulo;
import entidad.Cliente;
import entidad.Venta;
import servicioImpl.ServicioImplArticulo;
import servicioImpl.ServicioImplCliente;
import servicioImpl.ServicioImplVentas;



@Controller
public class ABMLVentasController {
	
	ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");
	
	@RequestMapping("Redireccionar_ABMLVentas.html")
	public ModelAndView eventoRedireccionarProducto(String btnPagina)
	{
		ModelAndView MV = new ModelAndView();
		MV = fetchData(MV, btnPagina);

		return MV;
	}
	
	
	private ModelAndView fetchData(ModelAndView MV, String pagina) {
		if(pagina == null)
			pagina="0";
		ServicioImplVentas derImplVenta = (ServicioImplVentas)appContext.getBean("serviceBeanVenta");
		List<Venta> todosLasVentas = derImplVenta.obtenerTodasLasVentas();
		List<Venta> ventas = derImplVenta.obtenerTodasLasVentasSegunPagina(pagina);
		ServicioImplCliente derImplCliente = (ServicioImplCliente) appContext.getBean("serviceBeanCliente");
		List<Cliente> todosLosClientes = derImplCliente.obtenerTodosLosClientes("0","");
		ServicioImplArticulo derImplArticulo = (ServicioImplArticulo) appContext.getBean("serviceBeanArticulo");
		List<Articulo> todosLosArticulos = derImplArticulo.obtenerTodosLosArticulos("0","");
		
		MV.addObject("productos",todosLosArticulos);
		System.out.println(todosLosArticulos.toString());
		MV.addObject("clientes",todosLosClientes);
		System.out.println(todosLosClientes.toString());
		MV.addObject("ventas",ventas);
		MV.addObject("cantPaginas",Math.ceil(todosLasVentas.size()/5));
		MV.setViewName("ABMLVenta");
		return MV;
	}
	
}
