package controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entidad.Articulo;
import entidad.Cliente;
import entidad.TablaTemporal;
import entidad.Venta;
import entidad.VentaArticulo;
import servicioImpl.ServicioImplArticulo;
import servicioImpl.ServicioImplCliente;
import servicioImpl.ServicioImplVentaArticulo;
import servicioImpl.ServicioImplVentas;

@Controller
public class ABMLVentasContadorController {

	ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");

	@RequestMapping("Redireccionar_ABMLVentaContador.html")
	public ModelAndView eventoRedireccionarProducto(String btnPagina, HttpServletRequest request,
			String txtFiltroVentaContadorInicio, String txtFiltroVentaContadorFin) {
		ModelAndView MV = new ModelAndView();
		MV = fetchData(MV, btnPagina, txtFiltroVentaContadorInicio, txtFiltroVentaContadorFin);
		return MV;
	}

	private ModelAndView fetchData(ModelAndView MV, String pagina, String txtFiltroVentaContadorInicio,
			String txtFiltroVentaContadorFin) {
		if (pagina == null)
			pagina = "0";

		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-M-dd");
		LocalDateTime now = LocalDateTime.now();
		System.out.println(dtf.format(now) + " 00:00:00");
		if (txtFiltroVentaContadorInicio == null || txtFiltroVentaContadorFin == null) {
			ServicioImplVentas derImplVenta = (ServicioImplVentas) appContext.getBean("serviceBeanVenta");
			List<Venta> todosLasVentas = derImplVenta.obtenerTodasLasVentasYFecha(dtf.format(now) + " 00:00:00",
					dtf.format(now) + " 00:00:00");
			List<Venta> ventas = derImplVenta.obtenerTodasLasVentasSegunPaginaYFecha(pagina,
					dtf.format(now) + " 00:00:00", dtf.format(now) + " 00:00:00");
			ServicioImplVentaArticulo derImplVentaArticulo = (ServicioImplVentaArticulo) appContext
					.getBean("serviceBeanVentaArticulo");
			List<VentaArticulo> todasLasVentasArticulos = derImplVentaArticulo.obtenerTodosLasVentasArticulos();
			List<TablaTemporal> tablaTemporal = derImplVenta.obtenerTablaTemporal();
			float sumaVenta = 0;
			float sumaCompra = 0;
			for (Venta venta : todosLasVentas) {
				if (venta.isStockDescontadoV()) {
					sumaVenta += venta.getTotal_V();
					for (VentaArticulo ventaArticulo : todasLasVentasArticulos) {
						if (ventaArticulo.getVentaVA().getId() == venta.getId()) {
							for (TablaTemporal itemTablaTemporal : tablaTemporal) {
								if (itemTablaTemporal.getId() == ventaArticulo.getVentaVA().getId()) {
									sumaCompra += itemTablaTemporal.getSumaPrecio();
								}
							}
						}
					}
				}
			}
			MV.addObject("sumaVenta", sumaVenta);
			MV.addObject("sumaCompra", sumaCompra);
			MV.addObject("ganancia", sumaVenta - sumaCompra);
			MV.addObject("ventasArticulos", todasLasVentasArticulos);
			MV.addObject("ventas", ventas);
			MV.addObject("paginaActual", pagina);
			MV.addObject("cantPaginas", Math.ceil(todosLasVentas.size() / 5));
			MV.setViewName("ABMLVentaContador");
		} else {
			ServicioImplVentas derImplVenta = (ServicioImplVentas) appContext.getBean("serviceBeanVenta");
			List<Venta> todosLasVentas = derImplVenta.obtenerTodasLasVentasYFecha(
					txtFiltroVentaContadorInicio + " 00:00:00", txtFiltroVentaContadorFin + " 00:00:00");
			List<Venta> ventas = derImplVenta.obtenerTodasLasVentasSegunPaginaYFecha(pagina,
					txtFiltroVentaContadorInicio + " 00:00:00", txtFiltroVentaContadorFin + " 00:00:00");
			ServicioImplVentaArticulo derImplVentaArticulo = (ServicioImplVentaArticulo) appContext
					.getBean("serviceBeanVentaArticulo");
			List<VentaArticulo> todasLasVentasArticulos = derImplVentaArticulo.obtenerTodosLasVentasArticulos();
			List<TablaTemporal> tablaTemporal = derImplVenta.obtenerTablaTemporal();
			float sumaVenta = 0;
			float sumaCompra = 0;
			for (Venta venta : todosLasVentas) {
				if (venta.isStockDescontadoV()) {
					sumaVenta += venta.getTotal_V();
					for (VentaArticulo ventaArticulo : todasLasVentasArticulos) {
						if (ventaArticulo.getVentaVA().getId() == venta.getId()) {
							for (TablaTemporal itemTablaTemporal : tablaTemporal) {
								if (itemTablaTemporal.getId() == ventaArticulo.getVentaVA().getId()) {
									sumaCompra += itemTablaTemporal.getSumaPrecio();
								}
							}
						}
					}
				}
			}
			MV.addObject("sumaVenta", sumaVenta);
			MV.addObject("sumaCompra", sumaCompra);
			MV.addObject("ganancia", sumaVenta - sumaCompra);
			MV.addObject("ventasArticulos", todasLasVentasArticulos);
			MV.addObject("ventas", ventas);
			MV.addObject("paginaActual", pagina);
			MV.addObject("cantPaginas", Math.ceil(todosLasVentas.size() / 5));
			MV.setViewName("ABMLVentaContador");
		}
		return MV;
	}

}
