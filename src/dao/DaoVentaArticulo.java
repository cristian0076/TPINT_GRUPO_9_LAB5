package dao;

import java.util.List;

import entidad.VentaArticulo;

public interface DaoVentaArticulo {
	public boolean agregarVentaArticulo(int idArticulo, int cantidadArticulo, float subtotal);
	public List<VentaArticulo> obtenerTodosLasVentasArticulos();
}
