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
	public List<Articulo> obtenerTodosLosArticulosSegunPagina(String pagina) {
		return dataAccess.obtenerTodosLosArticulosSegunPagina(pagina);
	}

	@Override
	public List<Articulo> obtenerTodosLosArticulos() {
		return dataAccess.obtenerTodosLosArticulos();
	}

	@Override
	public boolean agregarArticulo(String nombre, String descripcion, String tipo, String marca) {
		return dataAccess.agregarArticulo(nombre, descripcion, tipo, marca);
	}

}
