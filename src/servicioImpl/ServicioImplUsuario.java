package servicioImpl;

import dao.DaoUsuario;
import entidad.Usuario;

import servicio.ServicioUsuario;

public class ServicioImplUsuario implements ServicioUsuario {

	private DaoUsuario dataAccess = null;

	public ServicioImplUsuario() {

		super();
		// TODO Auto-generated constructor stub
	}

	public DaoUsuario getDataAccess() {
		return dataAccess;
	}

	public void setDataAccess(DaoUsuario dataAccess) {
		this.dataAccess = dataAccess;
	}

	@Override
	public Usuario obtenerUnRegistro(String nombreUser,String claveUser) {
		return dataAccess.obtenerUsuarioPorNombreYClave(nombreUser, claveUser);
	}

}
