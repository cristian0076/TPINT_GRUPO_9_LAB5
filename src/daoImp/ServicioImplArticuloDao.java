package daoImp;

import java.util.ArrayList;
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

	@SuppressWarnings("unchecked")
	@Override
	public List<Articulo> obtenerTodosLosArticulosSegunPagina(String pagina, String modoFiltro, String textoFiltro) {
		ConfigHibernate ch = new ConfigHibernate();
		Session session = ch.abrirConexion();
		List<Articulo> listaArticulos = new ArrayList<Articulo>();

		switch (modoFiltro) {
		case "1":
			listaArticulos = (List<Articulo>) session
					.createQuery("SELECT a FROM Articulo a WHERE a.status = 1 AND a.id LIKE '%" + textoFiltro + "%'")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		case "2":
			listaArticulos = (List<Articulo>) session
					.createQuery(
							"SELECT a FROM Articulo a WHERE a.status = 1 AND a.nombreA LIKE '%" + textoFiltro + "%'")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		case "3":
			listaArticulos = (List<Articulo>) session.createQuery(
					"SELECT a FROM Articulo a WHERE a.status = 1 AND a.descripcionA LIKE '%" + textoFiltro + "%'")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		case "4":
			listaArticulos = (List<Articulo>) session
					.createQuery("SELECT a FROM Articulo a WHERE a.status = 1 AND a.tipoA LIKE '%" + textoFiltro + "%'")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		case "5":
			listaArticulos = (List<Articulo>) session
					.createQuery("SELECT a FROM Articulo a JOIN a.marcaA m WHERE a.status = 1 AND m.nombreM LIKE '%"
							+ textoFiltro + "%'")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;

		default:
			listaArticulos = (List<Articulo>) session.createQuery("SELECT a FROM Articulo a WHERE a.status = 1")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		}

		ch.cerrarSession();
		return listaArticulos;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Articulo> obtenerTodosLosArticulos(String modoFiltro, String textoFiltro) {
		ConfigHibernate ch = new ConfigHibernate();
		Session session = ch.abrirConexion();
		List<Articulo> listaArticulos = new ArrayList<Articulo>();

		switch (modoFiltro) {
		case "1":
			listaArticulos = (List<Articulo>) session
					.createQuery("SELECT a FROM Articulo a WHERE a.status = 1 AND a.id LIKE '%" + textoFiltro + "%'")
					.list();
			break;
		case "2":
			listaArticulos = (List<Articulo>) session
					.createQuery(
							"SELECT a FROM Articulo a WHERE a.status = 1 AND a.nombreA LIKE '%" + textoFiltro + "%'")
					.list();
			break;
		case "3":
			listaArticulos = (List<Articulo>) session.createQuery(
					"SELECT a FROM Articulo a WHERE a.status = 1 AND a.descripcionA LIKE '%" + textoFiltro + "%'")
					.list();
			break;
		case "4":
			listaArticulos = (List<Articulo>) session
					.createQuery("SELECT a FROM Articulo a WHERE a.status = 1 AND a.tipoA LIKE '%" + textoFiltro + "%'")
					.list();
			break;
		case "5":
			listaArticulos = (List<Articulo>) session
					.createQuery("SELECT a FROM Articulo a JOIN a.marcaA m WHERE a.status = 1 AND m.nombreM LIKE '%"
							+ textoFiltro + "%'")
					.list();
			break;

		default:
			listaArticulos = (List<Articulo>) session.createQuery("SELECT a FROM Articulo a WHERE a.status = 1").list();
			break;
		}
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

			Marca marcaBD = (Marca) session.createQuery("SELECT m FROM Marca m WHERE m.id = " + marca).uniqueResult();

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

			estado = session.createQuery(hql).setParameter("id", id).executeUpdate();

			session.getTransaction().commit();

			ch.cerrarSession();
		} catch (Exception e) {
			e.printStackTrace(System.out);
			estado = 0;
		}

		return estado;
	}

	@Override
	public int modificarArticulo(int id, String nombre, String descripcion, String tipo, String marca) {
		int estado = 0;
		System.out.println(marca);
		try {
			ConfigHibernate ch = new ConfigHibernate();
			Session session = ch.abrirConexion();
			session.beginTransaction();

			Marca marcaBD = (Marca) session.createQuery("SELECT m FROM Marca m WHERE m.id = " + marca).uniqueResult();
			String hql = "UPDATE Articulo a SET a.status = 1 , a.nombreA = :nombre , a.descripcionA = :descripcion , a.tipoA = :tipo , a.marcaA = :marca WHERE a.id = :id";

			estado = session.createQuery(hql).setParameter("id", id).setParameter("nombre", nombre)
					.setParameter("descripcion", descripcion).setParameter("tipo", tipo).setParameter("marca", marcaBD)
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
