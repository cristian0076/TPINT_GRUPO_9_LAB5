package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entidad.Articulo;
import entidad.Marca;
import entidad.Tipo;
import servicioImpl.ServicioImplArticulo;
import servicioImpl.ServicioImplMarca;
import servicioImpl.ServicioImplTipo;

@Controller
public class ABMLArticuloController {

	ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");

	@RequestMapping("Redireccionar_ABMLProducto.html")
	public ModelAndView eventoRedireccionarProducto(String btnPagina, HttpServletRequest request,String ddlFiltroProducto, String txtFiltroProducto) {
		ModelAndView MV = (ModelAndView) appContext.getBean("beanModelView");
		if(ddlFiltroProducto==null)
			ddlFiltroProducto="0";
		if(txtFiltroProducto==null)
			txtFiltroProducto="";
		MV = fetchData(MV, btnPagina,ddlFiltroProducto,txtFiltroProducto);
		return MV;
	}

	@RequestMapping("AgregarProducto_ABMLProducto.html")
	public ModelAndView eventoAgregarProducto(String txtNombre, String txtDescripcion, String txtTipo,
			String txtMarca,int txtPrecio) {
		ModelAndView MV = (ModelAndView) appContext.getBean("beanModelView");
		ServicioImplArticulo derImplArticulo = (ServicioImplArticulo) appContext.getBean("serviceBeanArticulo");
		boolean estado = derImplArticulo.agregarArticulo(txtNombre, txtDescripcion, txtTipo, txtMarca,txtPrecio);
		MV.addObject("pudoAgregarse", estado);
		MV = fetchData(MV, "0","0","");
		ServicioImplMarca derImplMarca = (ServicioImplMarca) appContext.getBean("serviceBeanMarca");
		List<Marca> Marcas = derImplMarca.obtenerTodasLasMarcas();
		ServicioImplTipo derImplTipo = (ServicioImplTipo) appContext.getBean("serviceBeanTipo");
		List<Tipo> Tipos = derImplTipo.obtenerTodosLosTipos();
		MV.addObject("Marcas", Marcas);
		MV.addObject("Tipos", Tipos);
		return MV;
	}

	@RequestMapping("EliminarProducto_ABMLProducto.html")
	public ModelAndView eventoEliminarProducto(int btnEliminar) {

		int id = btnEliminar;
		ModelAndView MV = (ModelAndView) appContext.getBean("beanModelView");
		ServicioImplArticulo derImplArticulo = (ServicioImplArticulo) appContext.getBean("serviceBeanArticulo");
		int estado = derImplArticulo.eliminarArticulo(id);
		MV.addObject("pudoEliminarse", estado);
		MV = fetchData(MV, "0","0","");
		ServicioImplMarca derImplMarca = (ServicioImplMarca) appContext.getBean("serviceBeanMarca");
		List<Marca> Marcas = derImplMarca.obtenerTodasLasMarcas();
		ServicioImplTipo derImplTipo = (ServicioImplTipo) appContext.getBean("serviceBeanTipo");
		List<Tipo> Tipos = derImplTipo.obtenerTodosLosTipos();
		MV.addObject("Marcas", Marcas);
		MV.addObject("Tipos", Tipos);
		return MV;
	}

	@RequestMapping("ModificarProducto_ABMLProducto.html")
	public ModelAndView eventoModificarProducto(int id_M, String txtNombreM, String txtDescripcionM, String txtTipoM,
			String txtMarcaM, int txtPrecioM) {
		ModelAndView MV = (ModelAndView) appContext.getBean("beanModelView");
		ServicioImplArticulo derImplArticulo = (ServicioImplArticulo) appContext.getBean("serviceBeanArticulo");
		int estado = derImplArticulo.modificarArticulo(id_M, txtNombreM, txtDescripcionM, txtTipoM, txtMarcaM,txtPrecioM);
		MV.addObject("pudoModificarse", estado);
		MV = fetchData(MV, "0","0","");
		ServicioImplMarca derImplMarca = (ServicioImplMarca) appContext.getBean("serviceBeanMarca");
		List<Marca> Marcas = derImplMarca.obtenerTodasLasMarcas();
		ServicioImplTipo derImplTipo = (ServicioImplTipo) appContext.getBean("serviceBeanTipo");
		List<Tipo> Tipos = derImplTipo.obtenerTodosLosTipos();
		MV.addObject("Marcas", Marcas);
		MV.addObject("Tipos", Tipos);
		return MV;
	}
	
	private ModelAndView fetchData(ModelAndView MV, String pagina, String ddlFiltroProducto, String txtFiltroProducto) {
		if (pagina == null)
			pagina = "0";
		ServicioImplArticulo derImplArticulo = (ServicioImplArticulo) appContext.getBean("serviceBeanArticulo");
		List<Articulo> todosLosArticulos = derImplArticulo.obtenerTodosLosArticulos(ddlFiltroProducto,txtFiltroProducto);
		List<Articulo> articulos = derImplArticulo.obtenerTodosLosArticulosSegunPagina(pagina,ddlFiltroProducto,txtFiltroProducto);

		MV.addObject("articulos", articulos);
		MV.addObject("cantPaginas", Math.ceil(todosLosArticulos.size() / 5));
		MV.addObject("paginaActual",pagina);
		MV.setViewName("ABMLProducto");
		ServicioImplMarca derImplMarca = (ServicioImplMarca) appContext.getBean("serviceBeanMarca");
		List<Marca> Marcas = derImplMarca.obtenerTodasLasMarcas();
		ServicioImplTipo derImplTipo = (ServicioImplTipo) appContext.getBean("serviceBeanTipo");
		List<Tipo> Tipos = derImplTipo.obtenerTodosLosTipos();
		MV.addObject("Marcas", Marcas);
		MV.addObject("Tipos", Tipos);
		return MV;
	}

}
