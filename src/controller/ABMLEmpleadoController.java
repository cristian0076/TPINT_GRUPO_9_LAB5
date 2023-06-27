package controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class ABMLEmpleadoController {
	
	ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");
	
	@RequestMapping("Redireccionar_ABMLEmpleado.html")
	public ModelAndView eventoRedireccionarProducto(String btnPagina)
	{
		ModelAndView MV = (ModelAndView) appContext.getBean("beanModelView");
		MV.setViewName("ABMLEmpleado");
		return MV;
	}

}
