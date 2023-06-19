package principal;

import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import daoImp.ConfigHibernate;
import entidad.Articulo;
import entidad.Empleado;
import entidad.Stock;
import entidad.TipoCuenta;
import entidad.Usuario;

public class Main {

	public static void main(String[] args) {
		
		ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");
		Articulo articulo = (Articulo)appContext.getBean("ArticuloInicial");
		Stock stock = (Stock)appContext.getBean("StockInicial");
		((ConfigurableApplicationContext)(appContext)).close();
		System.out.println(articulo.toString());
		System.out.println(stock.toString());
		
		ConfigHibernate configHibernate = new ConfigHibernate();
        Session session = configHibernate.abrirConexion();

        // Aquí puedes realizar operaciones de persistencia utilizando la sesión abierta

        configHibernate.cerrarSession();

	}

}
