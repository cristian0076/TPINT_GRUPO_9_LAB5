package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GeneralController {
	
	ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");
	
	@RequestMapping("Redireccionar_IndexGeneral.html")
	public ModelAndView eventoRedireccionarIndex()
	{
		ModelAndView MV = (ModelAndView) appContext.getBean("beanModelView");
		MV.setViewName("Index");
		return MV;
	}
	@RequestMapping("Salir.html")
    public ModelAndView eventoRedireccionarSalir(HttpServletRequest request, String btnSalir)
    {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // Cierra la sesi�n y elimina los datos almacenados
        }
        ModelAndView MV = (ModelAndView) appContext.getBean("beanModelView");
        MV.setViewName("Login");
        return MV;
    }

}
