package servicioImpl;

import java.util.List;

import dao.DaoArticulo;
import dao.DaoUsuario;
import entidad.Articulo;
import servicio.ServicioArticulo;

public class ServicioImplArticulo implements ServicioArticulo {

	private DaoArticulo dataAccess = null;

	public ServicioImplArticulo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DaoArticulo getDataAccess() {
		return dataAccess;
	}

	public void setDataAccess(DaoArticulo dataAccess) {
		this.dataAccess = dataAccess;
	}

	@Override
	public List<Articulo> obtenerTodosLosArticulosSegunPagina(String pagina,String modoFiltro, String textoFiltro) {
		return dataAccess.obtenerTodosLosArticulosSegunPagina(pagina,modoFiltro,textoFiltro);
	}

	@Override
	public List<Articulo> obtenerTodosLosArticulos(String modoFiltro, String textoFiltro) {
		return dataAccess.obtenerTodosLosArticulos(modoFiltro,textoFiltro);
	}

	@Override
	public boolean agregarArticulo(String nombre, String descripcion, String tipo, String marca, int preciounitario) {
		return dataAccess.agregarArticulo(nombre, descripcion, tipo, marca,preciounitario);
	}

	@Override
	public int eliminarArticulo(int id) {
		return dataAccess.eliminarArticulo(id);
	}

	@Override
	public int modificarArticulo(int id,String nombre, String descripcion, String tipo, String marca,int preciounitario) {
		return dataAccess.modificarArticulo(id,nombre, descripcion, tipo, marca,preciounitario);
	}

}
