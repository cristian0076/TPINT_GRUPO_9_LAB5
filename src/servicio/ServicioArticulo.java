package servicio;

import java.util.List;

import entidad.Articulo;

public interface ServicioArticulo {
	public List<Articulo> obtenerTodosLosArticulosSegunPagina(String pagina,String modoFiltro, String textoFiltro);
	public List<Articulo> obtenerTodosLosArticulos(String modoFiltro, String textoFiltro);
	public boolean agregarArticulo(String nombre,String descripcion,String tipo,String marca);
	public int modificarArticulo(int id,String nombre,String descripcion,String tipo,String marca);
	public int eliminarArticulo(int id);
}
