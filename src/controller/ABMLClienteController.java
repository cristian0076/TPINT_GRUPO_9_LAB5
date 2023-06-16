package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ABMLClienteController {

 	@RequestMapping("Redireccionar_ABMLCliente.html")
	public ModelAndView eventoRedireccionarVenta(String btnPagina)
	{
		ModelAndView MV = new ModelAndView();
		MV.setViewName("ABMLCliente");
		return MV;
	}
}
