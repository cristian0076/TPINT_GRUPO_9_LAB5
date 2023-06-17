package controller;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entidad.Articulo;
import servicioImpl.ServicioImplArticulo;

@Controller
public class ABMLArticuloController {

	ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");
	
	@RequestMapping("Redireccionar_ABMLProducto.html")
	public ModelAndView eventoRedireccionarProducto(String btnPagina)
	{
		ModelAndView MV = new ModelAndView();
		MV = fetchData(MV, btnPagina);
		return MV;
	}
	
	@RequestMapping("AgregarProducto_ABMLProducto.html")
	public ModelAndView eventoAgregarProducto(String txtNombre, String txtDescripcion, String txtTipo, String txtMarca)
	{
		ModelAndView MV = new ModelAndView();
		ServicioImplArticulo derImplArticulo = (ServicioImplArticulo)appContext.getBean("serviceBeanArticulo");
		boolean estado = derImplArticulo.agregarArticulo(txtNombre, txtDescripcion, txtTipo, txtMarca);
		System.out.println(estado);
		MV.addObject("pudoAgregarse",estado);
		MV = fetchData(MV, "0");
		return MV;
	}
	
	@RequestMapping("EliminarProducto_ABMLProducto.html")
	public ModelAndView eventoEliminarProducto(int btnEliminar)
	{
		
		int id = btnEliminar;
		ModelAndView MV = new ModelAndView();
		ServicioImplArticulo derImplArticulo = (ServicioImplArticulo)appContext.getBean("serviceBeanArticulo");
		int estado = derImplArticulo.eliminarArticulo(id);
		MV.addObject("pudoEliminarse",estado);
		MV = fetchData(MV, "0");
		return MV;
	}
	
	
	private ModelAndView fetchData(ModelAndView MV, String pagina) {
		if(pagina == null)
			pagina="0";
		ServicioImplArticulo derImplArticulo = (ServicioImplArticulo)appContext.getBean("serviceBeanArticulo");
		List<Articulo> todosLosArticulos = derImplArticulo.obtenerTodosLosArticulos();
		List<Articulo> articulos = derImplArticulo.obtenerTodosLosArticulosSegunPagina(pagina);
		
		MV.addObject("articulos",articulos);
		MV.addObject("cantPaginas",Math.ceil(todosLosArticulos.size()/5));
		MV.setViewName("ABMLProducto");
		return MV;
	}
}
