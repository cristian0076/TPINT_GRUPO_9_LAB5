package daoImp;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.DaoVenta;
import entidad.Venta;
import servicio.ServicioVentas;
import entidad.Cliente;
import entidad.Marca;
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

}