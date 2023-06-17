package dao;

import java.util.List;

import entidad.Articulo;
import entidad.Usuario;

public interface DaoArticulo {
	public List<Articulo> obtenerTodosLosArticulosSegunPagina(String pagina);
	public List<Articulo> obtenerTodosLosArticulos();
	public boolean agregarArticulo(String nombre,String descripcion,String tipo,String marca);
	public int eliminarArticulo(int id);
}
