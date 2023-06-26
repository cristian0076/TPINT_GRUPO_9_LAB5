package daoImp;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.DaoVenta;
import entidad.Venta;
import entidad.VentaArticulo;
import servicio.ServicioVentas;
import entidad.Cliente;
import entidad.Marca;
import entidad.Stock;
import entidad.Usuario;

public class ServicioImplVentasDao implements DaoVenta  {

	public ServicioImplVentasDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Venta> obtenerTodasLasVentasSegunPagina(String pagina,String modoFiltro, String textoFiltro) {
		ConfigHibernate ch = new ConfigHibernate();
		Session session = ch.abrirConexion();
		List<Venta> listaVentas = new ArrayList<Venta>();

		switch (modoFiltro) {
		case "1":
			listaVentas = (List<Venta>) session
					.createQuery("SELECT c FROM Venta c WHERE c.EstadoV = 1 AND c.Fecha_V LIKE '%" + textoFiltro + "%'")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		case "2":
			listaVentas = (List<Venta>) session
					.createQuery("SELECT c FROM Venta c INNER JOIN c.Id_Cliente a WHERE c.EstadoV = 1 AND a.Nombre_C LIKE '%" + textoFiltro + "%'")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		case "3":
			listaVentas = (List<Venta>) session
					.createQuery(
							"SELECT c FROM Venta c INNER JOIN c.Id_usuario u WHERE c.EstadoV = 1 AND u.usuarioU LIKE '%" + textoFiltro + "%'")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		case "4":
			listaVentas = (List<Venta>) session
					.createQuery(
							"SELECT c FROM Venta c WHERE c.EstadoV = 1 AND c.Total_V LIKE '%" + textoFiltro + "%'")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		default:
			listaVentas = (List<Venta>) session.createQuery("SELECT c FROM Venta c WHERE c.EstadoV = 1")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		}

		ch.cerrarSession();
		return listaVentas;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Venta> obtenerTodasLasVentas(String modoFiltro, String textoFiltro) {
		ConfigHibernate ch = new ConfigHibernate();
		Session session = ch.abrirConexion();
		List<Venta> listaVentas = new ArrayList<Venta>();

		switch (modoFiltro) {
		case "1":
			listaVentas = (List<Venta>) session
					.createQuery("SELECT c FROM Venta c WHERE c.EstadoV = 1 AND c.Fecha_V LIKE '%" + textoFiltro + "%'")
					.list();
			break;
		case "2":
			listaVentas = (List<Venta>) session
					.createQuery("SELECT c FROM Venta c INNER JOIN c.Id_Cliente a WHERE c.EstadoV = 1 AND a.Nombre_C LIKE '%" + textoFiltro + "%'")
					.list();
			break;
		case "3":
			listaVentas = (List<Venta>) session
					.createQuery(
							"SELECT c FROM Venta c INNER JOIN c.Id_usuario u WHERE c.EstadoV = 1 AND u.usuarioU LIKE '%" + textoFiltro + "%'")
					.list();
			break;
		case "4":
			listaVentas = (List<Venta>) session
					.createQuery(
							"SELECT c FROM Venta c WHERE c.EstadoV = 1 AND c.Total_V LIKE '%" + textoFiltro + "%'")
					.list();
			break;
		default:
			listaVentas = (List<Venta>) session.createQuery("SELECT c FROM Venta c WHERE c.EstadoV = 1")
					.list();
			break;
		}

		ch.cerrarSession();
		return listaVentas;
	}

	@Override
	public boolean agregarVenta(Date fecha, String id_Cliente, String id_usuario, float total) {
		boolean noError = true;
		try {
			ConfigHibernate ch = new ConfigHibernate();
			Session session = ch.abrirConexion();
			session.beginTransaction();
			Cliente ClienteBD = (Cliente) session.createQuery("SELECT m FROM Cliente m WHERE m.id = "+id_Cliente).uniqueResult();
			Usuario UsuarioBD = (Usuario) session.createQuery("SELECT m FROM Usuario m WHERE m.id = "+id_usuario).uniqueResult();
			ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");
			Venta Venta = (Venta) appContext.getBean("VentaInicial");
			Venta.setFecha_V(fecha);
			Venta.setId_Cliente(ClienteBD);
			Venta.setId_usuario(UsuarioBD);
			Venta.setEstadoV(true);
			Venta.setStockDescontadoV(false);
			Venta.setTotal_V(total);
			
			session.save(Venta);
			
			session.getTransaction().commit();
			ch.cerrarSession();
		} catch (Exception e) {
			e.printStackTrace(System.out);
			noError = false;
		}

		return noError;
	}
	
	@Override
	public int eliminarVenta(int id) {
		int estado = 0;

		try {
			ConfigHibernate ch = new ConfigHibernate();
			Session session = ch.abrirConexion();
			session.beginTransaction();

			String hql = "UPDATE Venta v SET v.EstadoV = 0 WHERE v.id = :id";

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
	public boolean actualizarVenta(int id) {
		boolean sinProblemas = true;
		try {
			ConfigHibernate ch = new ConfigHibernate();
			Session session = ch.abrirConexion();
			session.beginTransaction();
			//Tomo lista de productos segun venta
			@SuppressWarnings("unchecked")
			List<VentaArticulo> listaVentas = (List<VentaArticulo>) session
					.createQuery("SELECT va FROM VentaArticulo va where va.ventaVA = "+id)
					.list();
			//Por cada producto Verifico stock
			for (VentaArticulo ventaArticulo : listaVentas) {
				int cantidadDeStock = 0;
				@SuppressWarnings("unchecked")
				List<Stock> listaStock = (List<Stock>) session
						.createQuery("SELECT s FROM Stock s where s.articulo = "+ventaArticulo.getArticuloVA().getId())
						.list();
				for (Stock stock : listaStock) {
					cantidadDeStock+=stock.getCantidad();
				}
				if(cantidadDeStock<ventaArticulo.getCantidadVA()) {
					sinProblemas=false;
				}
			}
			//Si todo sale bien ejecuto pa y actualizo el estado de la venta
			for (VentaArticulo ventaArticulo : listaVentas) {
				// Crea la consulta nativa
				Query query = session.createSQLQuery("CALL DescontarStockVenta(:pCantidadVA, :pArticuloVA)");

				// Configura los parámetros de entrada
				query.setParameter("pCantidadVA", ventaArticulo.getCantidadVA());
				query.setParameter("pArticuloVA", ventaArticulo.getArticuloVA().getId());

				// Ejecuta la consulta
				query.executeUpdate();
				
				String hql = "UPDATE Venta v SET v.StockDescontadoV = 1 WHERE v.id = :id";

				session.createQuery(hql).setParameter("id", id).executeUpdate();
			}
			
			session.getTransaction().commit();
			ch.cerrarSession();
		} catch (Exception e) {
			e.printStackTrace(System.out);
		}
		return sinProblemas;
	}

}