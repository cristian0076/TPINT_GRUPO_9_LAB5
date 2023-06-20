package dao;

import java.util.List;

import entidad.Cliente;

public interface DaoCliente {
	public List<Cliente> obtenerTodosLosClientesSegunPagina(String pagina,String modoFiltro, String textoFiltro);
	public List<Cliente> obtenerTodosLosClientes(String modoFiltro, String textoFiltro);
	public boolean agregarCliente(String txtDni,String txtNombre, String txtApellido, String txtDireccion,String txtFechaNac,String txtLocalidad, String txtMail, String txtSexo, String txtTelefono);
	public int modificarCliente(int id,String txtDni,String txtNombre, String txtApellido, String txtDireccion,String txtFechaNac,String txtLocalidad, String txtMail, String txtSexo, String txtTelefono);
	public int eliminarCliente(int id);
}
