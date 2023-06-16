package servicioImpl;

import java.sql.Date;
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
	public List<Venta> obtenerTodasLasVentasSegunPagina(String pagina) {
		return dataAccess.obtenerTodasLasVentasSegunPagina(pagina);
	}

	@Override
	public List<Venta> obtenerTodasLasVentas() {
		return dataAccess.obtenerTodasLasVentas();
	}

	@Override
	public boolean agregarVenta(int id,Date fecha, Cliente id_Cliente, Usuario id_usuario, float total) {
		return dataAccess.agregarVenta( id, fecha,  id_Cliente,  id_usuario, total);
	}

}
