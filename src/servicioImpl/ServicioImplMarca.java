package servicioImpl;

import java.util.List;
import dao.DaoMarca;
import entidad.Marca;
import servicio.ServicioMarca;

public class ServicioImplMarca implements ServicioMarca{
	
	private DaoMarca dataAccess = null;
	
	public ServicioImplMarca() {
		super();
	}
	
	public DaoMarca getDataAccess() {
		return dataAccess;
	}

	public void setDataAccess(DaoMarca dataAccess) {
		this.dataAccess = dataAccess;
	}

	@Override
	public List<Marca> obtenerTodasLasMarcas() {
		
		return dataAccess.obtenerTodasLasMarcas();
	}

}
