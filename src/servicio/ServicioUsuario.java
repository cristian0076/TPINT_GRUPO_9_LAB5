package servicio;

import entidad.Usuario;

public interface ServicioUsuario {

	Usuario obtenerUnRegistro(String nombreUser, String claveUser);
}
