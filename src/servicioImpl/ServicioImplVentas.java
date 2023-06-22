package servicioImpl;

import java.util.Date;
import java.util.List;

import dao.DaoVenta;
import entidad.Cliente;
import entidad.Usuario;
import entidad.Venta;
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

}
