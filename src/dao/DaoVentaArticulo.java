package dao;

import java.util.Date;

public interface DaoVentaArticulo {
	public boolean agregarVentaArticulo(int idArticulo, int cantidadArticulo, float subtotal);
}
