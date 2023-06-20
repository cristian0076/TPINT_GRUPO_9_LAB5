package servicioImpl;

import java.util.List;

import dao.DaoCliente;
import entidad.Cliente;
import servicio.ServicioCliente;

public class ServicioImplCliente implements ServicioCliente {

	private DaoCliente dataAccess = null;

	public ServicioImplCliente() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DaoCliente getDataAccess() {
		return dataAccess;
	}

	public void setDataAccess(DaoCliente dataAccess) {
		this.dataAccess = dataAccess;
	}

	@Override
	public List<Cliente> obtenerTodosLosClientesSegunPagina(String pagina, String modoFiltro, String textoFiltro) {
		return dataAccess.obtenerTodosLosClientesSegunPagina(pagina, modoFiltro, textoFiltro);
	}

	@Override
	public List<Cliente> obtenerTodosLosClientes(String modoFiltro, String textoFiltro) {
		return dataAccess.obtenerTodosLosClientes(modoFiltro, textoFiltro);
	}

	@Override
	public boolean agregarCliente(String txtDni, String txtNombre, String txtApellido, String txtDireccion,
			String txtFechaNac, String txtLocalidad, String txtMail, String txtSexo, String txtTelefono) {
		return dataAccess.agregarCliente(txtDni, txtNombre, txtApellido, txtDireccion, txtFechaNac, txtLocalidad,
				txtMail, txtSexo, txtTelefono);
	}

	@Override
	public int modificarCliente(int id, String txtDni, String txtNombre, String txtApellido, String txtDireccion,
			String txtFechaNac, String txtLocalidad, String txtMail, String txtSexo, String txtTelefono) {
		return dataAccess.modificarCliente(id, txtDni, txtNombre, txtApellido, txtDireccion, txtFechaNac, txtLocalidad, txtMail, txtSexo, txtTelefono);
	}

	@Override
	public int eliminarCliente(int id) {
		return dataAccess.eliminarCliente(id);
	}

}
