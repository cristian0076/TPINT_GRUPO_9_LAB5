package daoImp;


import org.hibernate.Session;

import dao.DaoUsuario;
import entidad.Usuario;

public class ServicioImplUsuarioDao implements DaoUsuario{

	public ServicioImplUsuarioDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public Usuario obtenerUsuarioPorNombreYClave(String nombreUser, String claveUser) {
		ConfigHibernate ch = new ConfigHibernate();
		Session session = ch.abrirConexion();
		
		Usuario usuario = (Usuario) session.createQuery("SELECT u FROM Usuario u WHERE u.usuarioU = :usuario AND u.contraseniaU = :clave").setParameter("usuario", nombreUser).setParameter("clave", claveUser).uniqueResult();
		System.out.println(usuario);
		ch.cerrarSession();
		return usuario;
	}
}
