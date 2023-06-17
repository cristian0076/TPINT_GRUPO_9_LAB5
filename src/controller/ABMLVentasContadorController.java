package controller;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entidad.Venta;
import servicioImpl.ServicioImplVentas;



@Controller
public class ABMLVentasContadorController {
		
	@RequestMapping("Redireccionar_ABMLVentaContador.html")
	public ModelAndView eventoRedireccionarVentaContador()
	{
		ModelAndView MV = new ModelAndView();
		MV.setViewName("ABMLVentaContador");
		return MV;
	}
	
	
}
