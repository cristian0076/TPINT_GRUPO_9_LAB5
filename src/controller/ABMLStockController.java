package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entidad.Articulo;
import entidad.Marca;
import entidad.Stock;
import entidad.Tipo;
import servicioImpl.ServicioImplArticulo;
import servicioImpl.ServicioImplMarca;
import servicioImpl.ServicioImplStock;
import servicioImpl.ServicioImplTipo;
@Controller
public class ABMLStockController {
	
	ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");

	@RequestMapping("Redireccionar_ABMLStock.html")
	public ModelAndView eventoRedireccionarStock(String btnPagina, HttpServletRequest request,String ddlFiltroStock, String txtFiltroStock)
	{
		ServicioImplArticulo derImplArticulo = (ServicioImplArticulo) appContext.getBean("serviceBeanArticulo");
		List<Articulo> todosLosArticulos = derImplArticulo.obtenerTodosLosArticulos("0", "");
		ModelAndView MV = new ModelAndView();
		MV.addObject("Productos", todosLosArticulos);
		System.out.println(todosLosArticulos);
		if(ddlFiltroStock==null)
			ddlFiltroStock="0";
		if(txtFiltroStock==null)
			txtFiltroStock="";
		MV = fetchData(MV, btnPagina,ddlFiltroStock,txtFiltroStock);
		return MV;
	}
	
	@RequestMapping("AgregarStock_ABMLStock.html")
	public ModelAndView eventoAgregarStock(String txtProducto,String txtCantidad,String txtPrecioC,String txtVencimiento)
	{
		ServicioImplArticulo derImplArticulo = (ServicioImplArticulo) appContext.getBean("serviceBeanArticulo");
		List<Articulo> todosLosArticulos = derImplArticulo.obtenerTodosLosArticulos("0", "");
		boolean status = false;
		ServicioImplStock derImplStock = (ServicioImplStock) appContext.getBean("serviceBeanStock");
		status  = derImplStock.agregarStock(txtProducto, txtCantidad, txtPrecioC, txtVencimiento);
		ModelAndView MV = new ModelAndView();
		MV.addObject("pudoAgregarse", status);
		MV = fetchData(MV, "0","0","");
		MV.addObject("Productos", todosLosArticulos);
		System.out.println(todosLosArticulos);
		MV.setViewName("ABMLStock");
		return MV;
	}
	
	private ModelAndView fetchData(ModelAndView MV, String pagina, String ddlFiltroStock, String txtFiltroStock) {
		if (pagina == null)
			pagina = "0";
		ServicioImplStock derImplStock = (ServicioImplStock) appContext.getBean("serviceBeanStock");
		List<Stock> todosLosStocks = derImplStock.obtenerTodosLosStock(ddlFiltroStock, txtFiltroStock);
		List<Stock> Stocks = derImplStock.obtenerTodosLosStockSegunPagina(pagina, ddlFiltroStock, txtFiltroStock);
		MV.addObject("stocks", Stocks);
		MV.addObject("cantPaginas", Math.ceil(todosLosStocks.size() / 5));
		MV.addObject("paginaActual",pagina);
		MV.setViewName("ABMLStock");
		ServicioImplArticulo derImplArticulo = (ServicioImplArticulo) appContext.getBean("serviceBeanArticulo");
		List<Articulo> todosLosArticulos = derImplArticulo.obtenerTodosLosArticulos("0", "");
		MV.addObject("Productos", todosLosArticulos);
		return MV;
	}
	
}
