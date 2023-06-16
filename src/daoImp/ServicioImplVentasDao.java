package daoImp;

import java.sql.Date;
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

	@Override
	public List<Venta> obtenerTodasLasVentasSegunPagina(String pagina) {
		ConfigHibernate ch = new ConfigHibernate();
		Session session = ch.abrirConexion();

		List<Venta> listaVentas = (List<Venta>) session.createQuery("SELECT a FROM Venta a")
				.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
		ch.cerrarSession();
		return listaVentas;
	}

	@Override
	public List<Venta> obtenerTodasLasVentas() {
		ConfigHibernate ch = new ConfigHibernate();
		Session session = ch.abrirConexion();

		List<Venta> listaVentas = (List<Venta>) session.createQuery("SELECT a FROM Venta a").list();
		ch.cerrarSession();
		return listaVentas;
	}

	@Override
	public boolean agregarVenta(int id,Date fecha, Cliente id_Cliente, Usuario id_usuario, float total) {
		boolean noError = true;

		try {
			ConfigHibernate ch = new ConfigHibernate();
			Session session = ch.abrirConexion();
			session.beginTransaction();
			
			Cliente ClienteBD = (Cliente) session.createQuery("SELECT m FROM Cliente m WHERE m.id = "+id_Cliente.getId()).uniqueResult();
			Usuario UsuarioBD = (Usuario) session.createQuery("SELECT m FROM Usuario m WHERE m.id = "+id_usuario.getId()).uniqueResult();

			ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");
			Venta Venta = (Venta) appContext.getBean("VentaInicial");
			Venta.setId(id);;
			Venta.setFecha_V(fecha);
			Venta.setId_Cliente(ClienteBD);
			Venta.setId_usuario(UsuarioBD);
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

}