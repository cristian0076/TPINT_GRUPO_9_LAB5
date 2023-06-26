package dao;


import java.util.Date;
import java.util.List;

import entidad.Articulo;
import entidad.Cliente;
import entidad.Usuario;
import entidad.Venta;

public interface DaoVenta {
	public List<Venta> obtenerTodasLasVentasSegunPagina(String pagina,String modoFiltro, String textoFiltro);
	public List<Venta> obtenerTodasLasVentas(String modoFiltro, String textoFiltro);
	public boolean agregarVenta(Date fecha, String id_Cliente, String id_usuario, float total);
	public int eliminarVenta(int id);
	public boolean actualizarVenta(int id);
}
