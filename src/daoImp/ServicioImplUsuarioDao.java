package daoImp;


import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.DaoUsuario;
import entidad.Usuario;

public class ServicioImplUsuarioDao implements DaoUsuario{

	public ServicioImplUsuarioDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public Usuario obtenerUsuarioPorNombreYClave(String nombreUser, String claveUser) {
		ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");
		ConfigHibernate ch = (ConfigHibernate) appContext.getBean("beanConfigHibernate");
		Session session = ch.abrirConexion();
		
		Usuario usuario = (Usuario) session.createQuery("SELECT u FROM Usuario u WHERE u.usuarioU = :usuario AND u.contraseniaU = :clave").setParameter("usuario", nombreUser).setParameter("clave", claveUser).uniqueResult();
		ch.cerrarSession();
		return usuario;
	}
}
