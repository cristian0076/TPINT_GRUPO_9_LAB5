package servicioImpl;

import dao.DaoArticulo;
import dao.DaoVentaArticulo;
import servicio.ServicioVentaArticulo;

public class ServicioImplVentaArticulo implements ServicioVentaArticulo{

	private DaoVentaArticulo dataAccess = null;

	
	@Override
	public boolean agregarVentaArticulo(int idArticulo, int cantidadArticulo, float subtotal) {
		return dataAccess.agregarVentaArticulo(idArticulo, cantidadArticulo, subtotal);
	}


	public ServicioImplVentaArticulo() {
		super();
		// TODO Auto-generated constructor stub
	}


	public DaoVentaArticulo getDataAccess() {
		return dataAccess;
	}


	public void setDataAccess(DaoVentaArticulo dataAccess) {
		this.dataAccess = dataAccess;
	}

}
