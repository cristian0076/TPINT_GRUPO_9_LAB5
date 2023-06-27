package servicioImpl;

import java.util.Date;
import java.util.List;

import dao.DaoVenta;
import entidad.Cliente;
import entidad.TablaTemporal;
import entidad.Usuario;
import entidad.Venta;
import entidad.VentaArticulo;
import dao.DaoUsuario;
import servicio.ServicioVentas;

public class ServicioImplVentas implements ServicioVentas {

	private DaoVenta dataAccess = null;

	public ServicioImplVentas() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DaoVenta getDataAccess() {
		return dataAccess;
	}

	public void setDataAccess(DaoVenta dataAccess) {
		this.dataAccess = dataAccess;
	}

	@Override
	public List<Venta> obtenerTodasLasVentasSegunPagina(String pagina, String modoFiltro, String textoFiltro) {
		return dataAccess.obtenerTodasLasVentasSegunPagina(pagina, modoFiltro, textoFiltro);
	}

	@Override
	public List<Venta> obtenerTodasLasVentas(String modoFiltro, String textoFiltro) {
		return dataAccess.obtenerTodasLasVentas(modoFiltro, textoFiltro);
	}

	@Override
	public boolean agregarVenta(Date fecha, String id_Cliente, String id_usuario, float total) {
		return dataAccess.agregarVenta(fecha, id_Cliente, id_usuario, total);
	}

	@Override
	public int eliminarVenta(int id) {
		return dataAccess.eliminarVenta(id);
	}

	@Override
	public boolean actualizarVenta(int id) {
		return dataAccess.actualizarVenta(id);
	}

	@Override
	public List<Venta> obtenerTodasLasVentasSegunPaginaYFecha(String pagina, String txtFiltroVentaContadorInicio,
			String txtFiltroVentaContadorFin) {
		return dataAccess.obtenerTodasLasVentasSegunPaginaYFecha(pagina, txtFiltroVentaContadorInicio,txtFiltroVentaContadorFin);
	}

	@Override
	public List<Venta> obtenerTodasLasVentasYFecha(String txtFiltroVentaContadorInicio,
			String txtFiltroVentaContadorFin) {
		return dataAccess.obtenerTodasLasVentasYFecha( txtFiltroVentaContadorInicio,txtFiltroVentaContadorFin);

	}

	@Override
	public List<TablaTemporal>  obtenerTablaTemporal() {
		return dataAccess.obtenerTablaTemporal();

	}

}
