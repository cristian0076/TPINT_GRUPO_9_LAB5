package daoImp;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.DaoVentaArticulo;
import entidad.Articulo;
import entidad.Cliente;
import entidad.Tipo;
import entidad.Usuario;
import entidad.Venta;
import entidad.VentaArticulo;

public class ServicioImplVentaArticuloDao implements DaoVentaArticulo{

	public ServicioImplVentaArticuloDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean agregarVentaArticulo(int idArticulo, int cantidadArticulo, float subtotal) {
		boolean noError = true;
		try {
			ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");
			ConfigHibernate ch = (ConfigHibernate) appContext.getBean("beanConfigHibernate");
			Session session = ch.abrirConexion();
			session.beginTransaction();
			Venta venta = (Venta) session.createQuery("SELECT v FROM Venta v order by v.id desc").setMaxResults(1).uniqueResult();
			Articulo articulo = (Articulo) session.createQuery("SELECT a FROM Articulo a WHERE a.id = "+idArticulo).uniqueResult();
			VentaArticulo VentaArticulo = (VentaArticulo) appContext.getBean("VentaArticuloInicial");
			VentaArticulo.setArticuloVA(articulo);
			VentaArticulo.setVentaVA(venta);
			VentaArticulo.setCantidadVA(cantidadArticulo);
			VentaArticulo.setSubtotalVA(subtotal);
			
			session.save(VentaArticulo);
			
			session.getTransaction().commit();
			ch.cerrarSession();
		} catch (Exception e) {
			e.printStackTrace(System.out);
			noError = false;
		}

		return noError;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<VentaArticulo> obtenerTodosLasVentasArticulos() {
		ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");
		ConfigHibernate ch = (ConfigHibernate) appContext.getBean("beanConfigHibernate");
		Session session = ch.abrirConexion();
		List<VentaArticulo> listaArticulos = (List<VentaArticulo>) appContext.getBean("listaVentaArticulo");

			listaArticulos = (List<VentaArticulo>) session
					.createQuery("SELECT a FROM VentaArticulo a ").list();

		ch.cerrarSession();
		return listaArticulos;
	}

}
