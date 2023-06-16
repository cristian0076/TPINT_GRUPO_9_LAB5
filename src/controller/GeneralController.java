package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GeneralController {
	
	@RequestMapping("Redireccionar_IndexGeneral.html")
	public ModelAndView eventoRedireccionarIndex()
	{
		ModelAndView MV = new ModelAndView();
		MV.setViewName("Index");
		return MV;
	}

}
