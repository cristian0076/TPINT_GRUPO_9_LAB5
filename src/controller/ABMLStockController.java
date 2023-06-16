package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class ABMLStockController {

	@RequestMapping("Redireccionar_ABMLStock.html")
	public ModelAndView eventoRedireccionarProducto()
	{
		ModelAndView MV = new ModelAndView();
		MV.setViewName("ABMLStock");
		return MV;
	}
	
}
