package servicioImpl;

import java.util.List;
import dao.DaoTipo;
import entidad.Tipo;
import servicio.ServicioTipo;

public class ServicioImplTipo implements ServicioTipo {
	
	private DaoTipo dataAccess = null;
	
	public ServicioImplTipo() {
		super();
	}
	
	public DaoTipo getDataAccess() {
		return dataAccess;
	}

	public void setDataAccess(DaoTipo dataAccess) {
		this.dataAccess = dataAccess;
	}

	@Override
	public List<Tipo> obtenerTodosLosTipos() {
		
		return dataAccess.obtenerTodosLosTipos();
	}

}
