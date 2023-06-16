package dao;

import entidad.Usuario;

public interface DaoUsuario {

	public Usuario obtenerUsuarioPorNombreYClave(String nombreUser,String claveUser);
}
