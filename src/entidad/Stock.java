package entidad;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

@Entity
@Table(name = "Stock")
public class Stock {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "fechaIngreso")
    private Date fechaIngreso;
    @ManyToOne(cascade = { CascadeType.ALL })
    @JoinColumn(name = "articulo_id")
    private Articulo articulo;
    @Column(name = "cantidad")
    private int cantidad;
    @Column(name = "precioCompra")
    private double precioCompra;
    @Autowired
	private boolean EstadoS;

    public boolean isEstadoS() {
		return EstadoS;
	}

	public void setEstadoS(boolean estadoS) {
		EstadoS = estadoS;
	}

	public Stock() {
    }

    public Stock(Date fechaIngreso, Articulo articulo, int cantidad, double precioCompra) {
        this.fechaIngreso = fechaIngreso;
        this.articulo = articulo;
        this.cantidad = cantidad;
        this.precioCompra = precioCompra;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(Date fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public Articulo getArticulo() {
        return articulo;
    }

    public void setArticulo(Articulo articulo) {
        this.articulo = articulo;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecioCompra() {
        return precioCompra;
    }

    public void setPrecioCompra(double precioCompra) {
        this.precioCompra = precioCompra;
    }

	@Override
	public String toString() {
		return "Stock [id=" + id + ", fechaIngreso=" + fechaIngreso + ", articulo=" + articulo + ", cantidad="
				+ cantidad + ", precioCompra=" + precioCompra + "]";
	}
    
    
}