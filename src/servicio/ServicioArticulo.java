package servicio;

import java.util.List;

import entidad.Articulo;

public interface ServicioArticulo {
	public List<Articulo> obtenerTodosLosArticulosSegunPagina(String pagina);
	public List<Articulo> obtenerTodosLosArticulos();
	public boolean agregarArticulo(String nombre,String descripcion,String tipo,String marca);
	public int eliminarArticulo(int id);
}
