package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entidad.Usuario;
import servicioImpl.ServicioImplUsuario;

@Controller
public class LoginController {
	
	ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");
			
	
	@RequestMapping("Redireccionar_Login.html")
	public ModelAndView eventoRedireccionarLogin(String txtUsuario, String txtClave)
	{
		ModelAndView MV = new ModelAndView();
		MV.setViewName("Login");
		return MV;
	}
	
	@RequestMapping("Redireccionar_Index.html")
	public ModelAndView eventoRedireccionarIndex(String txtUsuario, String txtClave,HttpServletRequest request)
	{	
		ServicioImplUsuario serImplUsuario = (ServicioImplUsuario)appContext.getBean("serviceBean");
		Usuario usuario = serImplUsuario.obtenerUnRegistro(txtUsuario,txtClave);
		
		ModelAndView MV = new ModelAndView();
		if(usuario==null) {
			String Message = "Verifica las credenciales.";
			MV.addObject("Message",Message);
			MV.setViewName("Login");
			return MV;
		}
		if(usuario.getUsuarioU().equals(txtUsuario) && usuario.getContraseniaU().equals(txtClave)) {
			MV.addObject("Usuario",usuario);
			MV.setViewName("Index");
			HttpSession session = request.getSession(true);
			session.setAttribute("usuario", usuario);
			session.setMaxInactiveInterval(3600);
			return MV;
		}else {
			String Message = "Verifica las credenciales.";
			MV.addObject("Message",Message);
			MV.setViewName("Login");
			return MV;
		}
	}

}
