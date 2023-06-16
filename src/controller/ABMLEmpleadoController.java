package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class ABMLEmpleadoController {
	
	@RequestMapping("Redireccionar_ABMLEmpleado.html")
	public ModelAndView eventoRedireccionarProducto(String btnPagina)
	{
		ModelAndView MV = new ModelAndView();
		MV.setViewName("ABMLEmpleado");
		return MV;
	}

}
