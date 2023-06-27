package controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AMBLUsuarioController {
	
	ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");

	@RequestMapping("Redireccionar_ABMLUsuario.html")
	public ModelAndView eventoRedireccionarProducto(String btnPagina)
	{
		ModelAndView MV = (ModelAndView) appContext.getBean("beanModelView");
		MV.setViewName("ABMLUsuario");
		return MV;
	}
}
