package daoImp;

import java.util.List;

import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.DaoArticulo;
import entidad.Articulo;
import entidad.Marca;
import entidad.Usuario;
import servicioImpl.ServicioImplArticulo;

public class ServicioImplArticuloDao implements DaoArticulo {

	public ServicioImplArticuloDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<Articulo> obtenerTodosLosArticulosSegunPagina(String pagina) {
		ConfigHibernate ch = new ConfigHibernate();
		Session session = ch.abrirConexion();

		List<Articulo> listaArticulos = (List<Articulo>) session.createQuery("SELECT a FROM Articulo a WHERE a.status = 1")
				.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
		ch.cerrarSession();
		return listaArticulos;
	}

	@Override
	public List<Articulo> obtenerTodosLosArticulos() {
		ConfigHibernate ch = new ConfigHibernate();
		Session session = ch.abrirConexion();

		List<Articulo> listaArticulos = (List<Articulo>) session.createQuery("SELECT a FROM Articulo a WHERE a.status = 1").list();
		ch.cerrarSession();
		return listaArticulos;
	}

	@Override
	public boolean agregarArticulo(String nombre, String descripcion, String tipo, String marca) {
		boolean noError = true;

		try {
			ConfigHibernate ch = new ConfigHibernate();
			Session session = ch.abrirConexion();
			session.beginTransaction();
			
			Marca marcaBD = (Marca) session.createQuery("SELECT m FROM Marca m WHERE m.id = "+marca).uniqueResult();

			ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");
			Articulo articulo = (Articulo) appContext.getBean("ArticuloInicial");
			articulo.setNombreA(nombre);
			articulo.setDescripcionA(descripcion);
			articulo.setTipoA(tipo);
			articulo.setMarcaA(marcaBD);
			session.save(articulo);
			
			session.getTransaction().commit();
			ch.cerrarSession();
		} catch (Exception e) {
			e.printStackTrace(System.out);
			noError = false;
		}

		return noError;
	}

	@Override
	public int eliminarArticulo(int id) {
		int estado = 0;

		try {
			ConfigHibernate ch = new ConfigHibernate();
			Session session = ch.abrirConexion();
			session.beginTransaction();
			
			String hql = "UPDATE Articulo a SET a.status = 0 WHERE a.id = :id";
			
			 estado = session.createQuery(hql)
			        .setParameter("id", id)
			        .executeUpdate();
			
			session.getTransaction().commit();
			
			ch.cerrarSession();
		} catch (Exception e) {
			e.printStackTrace(System.out);
			estado = 0;
		}
		
		return estado;
	}

}
