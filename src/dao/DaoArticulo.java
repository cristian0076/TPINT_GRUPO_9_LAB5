package dao;

import java.util.List;

import entidad.Articulo;
import entidad.Usuario;

public interface DaoArticulo {
	public List<Articulo> obtenerTodosLosArticulosSegunPagina(String pagina,String modoFiltro, String textoFiltro);
	public List<Articulo> obtenerTodosLosArticulos(String modoFiltro, String textoFiltro);
	public boolean agregarArticulo(String nombre,String descripcion,String tipo,String marca,int preciounitario);
	public int modificarArticulo(int id,String nombre,String descripcion,String tipo,String marca, int preciounitario);
	public int eliminarArticulo(int id);
}
