package daoImp;
import dao.DaoStock;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.DaoCliente;
import entidad.Articulo;
import entidad.Cliente;
import entidad.Stock;


public class ServicioImplStockDao implements DaoStock {

	@Override
	public boolean agregarStock(String idArticulo, String cantidad, String precio, String fechaVencimiento) {
		boolean noError = true;
		ConfigHibernate ch = new ConfigHibernate();
		Session session = ch.abrirConexion();
		session.beginTransaction();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-M-dd hh:mm:ss");
		
		try {
		Date fechaVenc = formatter.parse(fechaVencimiento+" 00:00:00");
		Date fechaActual = new Date();
		Articulo ArticuloDB = (Articulo) session.createQuery("SELECT a FROM Articulo a WHERE a.id = " + idArticulo).uniqueResult();
		ApplicationContext appContext = new ClassPathXmlApplicationContext("resources/Beans.xml");
		boolean existe = false;
		existe = verificarStock(fechaActual,Integer.parseInt(cantidad),Integer.parseInt(idArticulo),fechaVenc,Integer.parseInt(precio));
		
		if(existe == true) {
			
		}else {
			Stock stock = (Stock) appContext.getBean("StockInicial");
			stock.setArticulo(ArticuloDB);
			stock.setCantidad(Integer.parseInt(cantidad));
			stock.setPrecioCompra(Integer.parseInt(precio));
			stock.setFechaIngreso(fechaActual);
			stock.setFechaVencimientoS(fechaVenc);
			stock.setEstadoS(true);
			session.save(stock);
			session.getTransaction().commit();
		}
		
		ch.cerrarSession();
		return noError;
		} catch (Exception e) {
			e.printStackTrace(System.out);
			return false;
		}
		
	}
	
	public boolean verificarStock(Date fecha, int Cantidad, int id, Date vencimiento, double precio) {
		boolean existe = false;
		int update = 0;
		try {
		ConfigHibernate ch = new ConfigHibernate();
		Session session = ch.abrirConexion();
		session.beginTransaction();
		SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
	    String fechaFormateada = formato.format(fecha);
	    String fechavenc = formato.format(vencimiento);
	    String hql1 = "SELECT s FROM Stock s JOIN s.articulo a WHERE s.EstadoS = 1 AND a.id = "+id+" AND s.fechaIngreso LIKE '%" + fechaFormateada + "%' AND s.FechaVencimientoS LIKE '%" + fechavenc +"%' ";
	    Stock StockDB = (Stock) session.createQuery(hql1).uniqueResult();
		
		if (StockDB == null) {
		    existe = false;
		} else {
		    existe = true;
		    String hql = "UPDATE Stock s SET s.cantidad = :cant, s.precioCompra = :precio WHERE s.id ="+ StockDB.getId();
		    
		    
		    int sumaCantidad = StockDB.getCantidad() + Cantidad;
		    double CostoMedio = ((StockDB.getPrecioCompra() *  StockDB.getCantidad()) + (Cantidad*precio))/ sumaCantidad;
		    //double sumaPrecio =  StockDB.getPrecioCompra() + precio;
		    System.out.println("suma: "+ sumaCantidad);
		    update = session.createQuery(hql)
		    .setParameter("cant", sumaCantidad)
		    .setParameter("precio", CostoMedio)
		    .executeUpdate();
			session.getTransaction().commit();
		}
		
		ch.cerrarSession();
		
		return existe;
		
		} catch (Exception e) {
			e.printStackTrace(System.out);
			return existe;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Stock> obtenerTodosLosStockSegunPagina(String pagina, String modoFiltro, String textoFiltro) {
		
		ConfigHibernate ch = new ConfigHibernate();
		Session session = ch.abrirConexion();
		List<Stock> listaStock = new ArrayList<Stock>();

		switch (modoFiltro) {
		case "1":
			listaStock = (List<Stock>) session
					.createQuery("SELECT s FROM Stock s WHERE s.EstadoS = 1 AND s.id LIKE '%" + textoFiltro + "%'")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		case "2":
			listaStock = (List<Stock>) session
					.createQuery(
							"SELECT s FROM Stock s WHERE s.EstadoS = 1 AND s.FechaVencimientoS LIKE '%" + textoFiltro + "%'")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		case "3":
			listaStock = (List<Stock>) session.createQuery(
					"SELECT s FROM Stock s WHERE s.EstadoS = 1 AND s.cantidad LIKE '%" + textoFiltro + "%'")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		case "4":
			listaStock = (List<Stock>) session
					.createQuery("SELECT s FROM Stock s WHERE s.EstadoS = 1 AND s.fechaIngreso LIKE '%" + textoFiltro + "%'")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		case "5":
			listaStock = (List<Stock>) session
					.createQuery("SELECT s FROM Stock s WHERE s.EstadoS = 1 AND s.precioCompra LIKE '%" + textoFiltro + "%'")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		case "6":
			listaStock = (List<Stock>) session
					.createQuery("SELECT s FROM Stock s JOIN s.articulo a WHERE s.EstadoS = 1 AND a.nombreA LIKE '%"
							+ textoFiltro + "%'")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;

		default:
			listaStock = (List<Stock>) session.createQuery("SELECT s FROM Stock s WHERE s.EstadoS = 1")
					.setFirstResult(Integer.parseInt(pagina) * 5).setMaxResults(5).list();
			break;
		}

		ch.cerrarSession();
		return listaStock;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Stock> obtenerTodosLosStock(String modoFiltro, String textoFiltro) {
		
		ConfigHibernate ch = new ConfigHibernate();
		Session session = ch.abrirConexion();
		List<Stock> listaStock = new ArrayList<Stock>();

		switch (modoFiltro) {
		case "1":
			listaStock = (List<Stock>) session
					.createQuery("SELECT s FROM Stock s WHERE s.EstadoS = 1 AND s.id LIKE '%" + textoFiltro + "%'")
					.list();
			break;
		case "2":
			listaStock = (List<Stock>) session
					.createQuery(
							"SELECT s FROM Stock s WHERE s.EstadoS = 1 AND s.FechaVencimientoS LIKE '%" + textoFiltro + "%'")
					.list();
			break;
		case "3":
			listaStock = (List<Stock>) session.createQuery(
					"SELECT s FROM Stock s WHERE s.EstadoS = 1 AND s.cantidad LIKE '%" + textoFiltro + "%'")
					.list();
			break;
		case "4":
			listaStock = (List<Stock>) session
					.createQuery("SELECT s FROM Stock s WHERE s.EstadoS = 1 AND s.fechaIngreso LIKE '%" + textoFiltro + "%'")
					.list();
			break;
		case "5":
			listaStock = (List<Stock>) session
					.createQuery("SELECT s FROM Stock s WHERE s.EstadoS = 1 AND s.precioCompra LIKE '%" + textoFiltro + "%'")
					.list();
			break;
		case "6":
			listaStock = (List<Stock>) session
					.createQuery("SELECT s FROM Stock s JOIN s.articulo a WHERE s.EstadoS = 1 AND a.nombreA LIKE '%"
							+ textoFiltro + "%'")
					.list();
			break;

		default:
			listaStock = (List<Stock>) session.createQuery("SELECT s FROM Stock s WHERE s.EstadoS = 1")
					.list();
			break;
		}

		ch.cerrarSession();
		return listaStock;
	}

}
