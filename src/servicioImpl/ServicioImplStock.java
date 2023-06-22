package servicioImpl;

import java.util.List;

import dao.DaoStock;
import entidad.Stock;
import servicio.ServicioStock;

public class ServicioImplStock implements ServicioStock {

	private DaoStock dataAccess = null;
	
	

	public ServicioImplStock() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public DaoStock getDataAccess() {
		return dataAccess;
	}



	public void setDataAccess(DaoStock dataAccess) {
		this.dataAccess = dataAccess;
	}


	@Override
	public boolean agregarStock(String idArticulo, String cantidad, String precio, String fechaVencimiento) {

		return dataAccess.agregarStock(idArticulo, cantidad, precio, fechaVencimiento);
	}

	@Override
	public List<Stock> obtenerTodosLosStockSegunPagina(String pagina, String modoFiltro, String textoFiltro) {
		
		return dataAccess.obtenerTodosLosStockSegunPagina(pagina, modoFiltro, textoFiltro);
	}

	@Override
	public List<Stock> obtenerTodosLosStock(String modoFiltro, String textoFiltro) {
		
		return dataAccess.obtenerTodosLosStock(modoFiltro, textoFiltro);
	}

}
