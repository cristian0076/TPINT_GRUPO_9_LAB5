package dao;

import java.util.List;
import entidad.Stock;

public interface DaoStock {
	public List<Stock> obtenerTodosLosStockSegunPagina(String pagina,String modoFiltro, String textoFiltro);
	public List<Stock> obtenerTodosLosStock(String modoFiltro, String textoFiltro);
	public boolean agregarStock(String idArticulo,String cantidad,String precio, String fechaVencimiento);
}
