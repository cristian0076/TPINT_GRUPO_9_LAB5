package daoImp;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.DaoTipo;
import entidad.Stock;
import entidad.Tipo;

public class ServicioImplTipoDao implements DaoTipo{

	@SuppressWarnings("unchecked")
	@Override
	public List<Tipo> obtenerTodosLosTipos() {
		ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");
		ConfigHibernate ch = (ConfigHibernate) appContext.getBean("beanConfigHibernate");
		Session session = ch.abrirConexion();
		
		List<Tipo> listaTipos = (List<Tipo>) appContext.getBean("listaTipo");
		listaTipos = (List<Tipo>) session.createQuery("SELECT t FROM Tipo t WHERE t.status = 1").list();
			
		ch.cerrarSession();
		return listaTipos;
	}

}
