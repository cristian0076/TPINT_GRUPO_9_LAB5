package daoImp;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.DaoCliente;
import entidad.Articulo;
import entidad.Cliente;
import entidad.Marca;

public class ServicioImplClienteDao implements DaoCliente {

	public ServicioImplClienteDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Cliente> obtenerTodosLosClientesSegunPagina(String pagina, String modoFiltro, String textoFiltro) {
		ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");
		ConfigHibernate ch = (ConfigHibernate) appContext.getBean("beanConfigHibernate");
		Session session = ch.abrirConexion();
		List<Cliente> listaCliente = (List<Cliente>) appContext.getBean("listaCliente");

		switch (modoFiltro) {
		case "1":
			listaCliente = (List<Cliente>) session
					.createQuery("SELECT c FROM Cliente c WHERE c.EstadoC = 1 AND c.id LIKE '%" + textoFiltro + "%'")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		case "2":
			listaCliente = (List<Cliente>) session
					.createQuery("SELECT c FROM Cliente c WHERE c.EstadoC = 1 AND c.DNI_C LIKE '%" + textoFiltro + "%'")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		case "3":
			listaCliente = (List<Cliente>) session
					.createQuery(
							"SELECT c FROM Cliente c WHERE c.EstadoC = 1 AND c.Nombre_C LIKE '%" + textoFiltro + "%'")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		case "4":
			listaCliente = (List<Cliente>) session
					.createQuery(
							"SELECT c FROM Cliente c WHERE c.EstadoC = 1 AND c.Apellido_C LIKE '%" + textoFiltro + "%'")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		case "5":
			listaCliente = (List<Cliente>) session
					.createQuery(
							"SELECT c FROM Cliente c WHERE c.EstadoC = 1 AND c.Sexo_C LIKE '%" + textoFiltro + "%'")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		case "6":
			listaCliente = (List<Cliente>) session
					.createQuery(
							"SELECT c FROM Cliente c WHERE c.EstadoC = 1 AND c.Mail_C LIKE '%" + textoFiltro + "%'")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		case "7":
			listaCliente = (List<Cliente>) session
					.createQuery(
							"SELECT c FROM Cliente c WHERE c.EstadoC = 1 AND c.Telefono_C LIKE '%" + textoFiltro + "%'")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		case "8":
			listaCliente = (List<Cliente>) session.createQuery(
					"SELECT c FROM Cliente c WHERE c.EstadoC = 1 AND c.Direccion_C LIKE '%" + textoFiltro + "%'")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		case "9":
			listaCliente = (List<Cliente>) session.createQuery(
					"SELECT c FROM Cliente c WHERE c.EstadoC = 1 AND c.Localidad_C LIKE '%" + textoFiltro + "%'")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;

		default:
			listaCliente = (List<Cliente>) session.createQuery("SELECT c FROM Cliente c WHERE c.EstadoC = 1")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		}

		ch.cerrarSession();
		return listaCliente;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Cliente> obtenerTodosLosClientes(String modoFiltro, String textoFiltro) {
		ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");
		ConfigHibernate ch = (ConfigHibernate) appContext.getBean("beanConfigHibernate");
		Session session = ch.abrirConexion();
		List<Cliente> listaCliente = (List<Cliente>) appContext.getBean("listaCliente");

		switch (modoFiltro) {
		case "1":
			listaCliente = (List<Cliente>) session
					.createQuery("SELECT c FROM Cliente c WHERE c.EstadoC = 1 AND c.id LIKE '%" + textoFiltro + "%'")
					.list();
			break;
		case "2":
			listaCliente = (List<Cliente>) session
					.createQuery("SELECT c FROM Cliente c WHERE c.EstadoC = 1 AND c.DNI_C LIKE '%" + textoFiltro + "%'")
					.list();
			break;
		case "3":
			listaCliente = (List<Cliente>) session
					.createQuery(
							"SELECT c FROM Cliente c WHERE c.EstadoC = 1 AND c.Nombre_C LIKE '%" + textoFiltro + "%'")
					.list();
			break;
		case "4":
			listaCliente = (List<Cliente>) session
					.createQuery(
							"SELECT c FROM Cliente c WHERE c.EstadoC = 1 AND c.Apellido_C LIKE '%" + textoFiltro + "%'")
					.list();
			break;
		case "5":
			listaCliente = (List<Cliente>) session
					.createQuery(
							"SELECT c FROM Cliente c WHERE c.EstadoC = 1 AND c.Sexo_C LIKE '%" + textoFiltro + "%'")
					.list();
			break;
		case "6":
			listaCliente = (List<Cliente>) session
					.createQuery(
							"SELECT c FROM Cliente c WHERE c.EstadoC = 1 AND c.Mail_C LIKE '%" + textoFiltro + "%'")
					.list();
			break;
		case "7":
			listaCliente = (List<Cliente>) session
					.createQuery(
							"SELECT c FROM Cliente c WHERE c.EstadoC = 1 AND c.Telefono_C LIKE '%" + textoFiltro + "%'")
					.list();
			break;
		case "8":
			listaCliente = (List<Cliente>) session.createQuery(
					"SELECT c FROM Cliente c WHERE c.EstadoC = 1 AND c.Direccion_C LIKE '%" + textoFiltro + "%'")
					.list();
			break;
		case "9":
			listaCliente = (List<Cliente>) session.createQuery(
					"SELECT c FROM Cliente c WHERE c.EstadoC = 1 AND c.Localidad_C LIKE '%" + textoFiltro + "%'")
					.list();
			break;

		default:
			listaCliente = (List<Cliente>) session.createQuery("SELECT c FROM Cliente c WHERE c.EstadoC = 1").list();
			break;
		}

		ch.cerrarSession();
		return listaCliente;
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean agregarCliente(String txtDni, String txtNombre, String txtApellido, String txtDireccion,
			String txtFechaNac, String txtLocalidad, String txtMail, String txtSexo, String txtTelefono) {
		boolean noError = true;

		try {
			ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");
			ConfigHibernate ch = (ConfigHibernate) appContext.getBean("beanConfigHibernate");
			Session session = ch.abrirConexion();
			session.beginTransaction();
			
			List<Cliente> listaCliente = (List<Cliente>) appContext.getBean("listaCliente");
			listaCliente = (List<Cliente>) session.createQuery("SELECT c FROM Cliente c WHERE c.EstadoC = 1 and c.DNI_C="+txtDni).list();
			if(listaCliente.size()==0) {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-M-dd hh:mm:ss");
			Date fecha = formatter.parse(txtFechaNac+" 00:00:00");
			Cliente cliente = (Cliente) appContext.getBean("ClienteInicial");
			cliente.setDNI_C(txtDni);
			cliente.setNombre_C(txtNombre);
			cliente.setApellido_C(txtApellido);
			cliente.setDireccion_C(txtDireccion);
			cliente.setFecha_Nacimiento_C(fecha);
			cliente.setLocalidad_C(txtLocalidad);
			cliente.setMail_C(txtMail);
			cliente.setSexo_C(txtSexo);
			cliente.setTelefono_C(txtTelefono);
			cliente.setEstadoC(true);
			session.save(cliente);
			}else {
				noError = false;
			}
			session.getTransaction().commit();
			ch.cerrarSession();
		} catch (Exception e) {
			e.printStackTrace(System.out);
			noError = false;
		}

		return noError;
	}

	@Override
	public int modificarCliente(int id, String txtDni, String txtNombre, String txtApellido, String txtDireccion,
			String txtFechaNac, String txtLocalidad, String txtMail, String txtSexo, String txtTelefono) {
		int estado = 0;
		try {
			ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");
			ConfigHibernate ch = (ConfigHibernate) appContext.getBean("beanConfigHibernate");
			Session session = ch.abrirConexion();
			session.beginTransaction();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-M-dd hh:mm:ss");
			Date fecha = formatter.parse(txtFechaNac+" 00:00:00");

			String hql = "UPDATE Cliente c SET c.EstadoC = 1 , c.Apellido_C = :apellido , c.DNI_C = :dni , c.Direccion_C = :direccion , c.Fecha_Nacimiento_C = :fechaNac, c.Localidad_C = :localidad, c.Mail_C = :mail, c.Nombre_C = :nombre, c.Sexo_C = :sexo, c.Telefono_C = :telefono WHERE c.id = :id";

			estado = session.createQuery(hql).setParameter("id", id).setParameter("apellido", txtApellido)
					.setParameter("dni", txtDni).setParameter("direccion", txtDireccion).setParameter("fechaNac", fecha)
					.setParameter("localidad", txtLocalidad).setParameter("mail", txtMail)
					.setParameter("nombre", txtNombre).setParameter("sexo", txtSexo)
					.setParameter("telefono", txtTelefono).executeUpdate();

			session.getTransaction().commit();
			ch.cerrarSession();
		} catch (Exception e) {
			e.printStackTrace(System.out);
			estado = 0;
		}

		return estado;
	}

	@Override
	public int eliminarCliente(int id) {
		int estado = 0;

		try {
			ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");
			ConfigHibernate ch = (ConfigHibernate) appContext.getBean("beanConfigHibernate");
			Session session = ch.abrirConexion();
			session.beginTransaction();

			String hql = "UPDATE Cliente c SET c.EstadoC = 0 WHERE c.id = :id";

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
