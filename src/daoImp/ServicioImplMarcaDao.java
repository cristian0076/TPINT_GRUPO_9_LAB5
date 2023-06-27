package daoImp;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.DaoMarca;
import entidad.Marca;

public class ServicioImplMarcaDao implements DaoMarca{

	@SuppressWarnings("unchecked")
	@Override
	public List<Marca> obtenerTodasLasMarcas() {
		ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");
		ConfigHibernate ch = (ConfigHibernate) appContext.getBean("beanConfigHibernate");
		Session session = ch.abrirConexion();
		
		List<Marca> listaMarcas = new ArrayList<Marca>();
		listaMarcas = (List<Marca>) session.createQuery("SELECT m FROM Marca m WHERE m.EstadoM = 1").list();
			
		ch.cerrarSession();
		return listaMarcas;
		
	}

}
