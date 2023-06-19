package daoImp;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import dao.DaoTipo;
import entidad.Tipo;

public class ServicioImplTipoDao implements DaoTipo{

	@SuppressWarnings("unchecked")
	@Override
	public List<Tipo> obtenerTodosLosTipos() {
		ConfigHibernate ch = new ConfigHibernate();
		Session session = ch.abrirConexion();
		
		List<Tipo> listaTipos = new ArrayList<Tipo>();
		listaTipos = (List<Tipo>) session.createQuery("SELECT t FROM Tipo t WHERE t.status = 1").list();
			
		ch.cerrarSession();
		return listaTipos;
	}

}
