package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AMBLUsuarioController {

	@RequestMapping("Redireccionar_ABMLUsuario.html")
	public ModelAndView eventoRedireccionarProducto(String btnPagina)
	{
		ModelAndView MV = new ModelAndView();
		MV.setViewName("ABMLUsuario");
		return MV;
	}
}
