package servicio;

import java.sql.Date;
import java.util.List;

import entidad.Cliente;
import entidad.Usuario;
import entidad.Venta;

public interface ServicioVentas {
	public List<Venta> obtenerTodasLasVentasSegunPagina(String pagina);
	public List<Venta> obtenerTodasLasVentas();
	public boolean agregarVenta(int id,Date fecha, Cliente id_Cliente, Usuario id_usuario, float total);
}
