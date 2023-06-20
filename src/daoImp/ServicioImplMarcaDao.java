package daoImp;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import dao.DaoMarca;
import entidad.Marca;

public class ServicioImplMarcaDao implements DaoMarca{

	@SuppressWarnings("unchecked")
	@Override
	public List<Marca> obtenerTodasLasMarcas() {
		ConfigHibernate ch = new ConfigHibernate();
		Session session = ch.abrirConexion();
		
		List<Marca> listaMarcas = new ArrayList<Marca>();
		listaMarcas = (List<Marca>) session.createQuery("SELECT m FROM Marca m WHERE m.EstadoM = 1").list();
			
		ch.cerrarSession();
		return listaMarcas;
		
	}

}
