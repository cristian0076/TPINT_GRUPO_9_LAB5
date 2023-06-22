package servicio;

import java.util.List;

import entidad.VentaArticulo;

public interface ServicioVentaArticulo {
	public boolean agregarVentaArticulo(int idArticulo, int cantidadArticulo, float subtotal);
	public List<VentaArticulo> obtenerTodosLasVentasArticulos();
}
