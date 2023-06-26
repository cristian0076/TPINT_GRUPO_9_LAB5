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

@Entity
@Table(name = "ventaarticulo")
public class VentaArticulo {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne(cascade = { CascadeType.ALL })
	@JoinColumn(name="ventaVA")
	private Venta ventaVA;
	@ManyToOne(cascade = { CascadeType.ALL })
	@JoinColumn(name="articuloVA")
	private Articulo articuloVA;
	private int cantidadVA;
	private float subtotalVA;

	public VentaArticulo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Venta getVentaVA() {
		return ventaVA;
	}

	public void setVentaVA(Venta ventaVA) {
		this.ventaVA = ventaVA;
	}

	public Articulo getArticuloVA() {
		return articuloVA;
	}

	public void setArticuloVA(Articulo articuloVA) {
		this.articuloVA = articuloVA;
	}

	public int getCantidadVA() {
		return cantidadVA;
	}

	public void setCantidadVA(int cantidadVA) {
		this.cantidadVA = cantidadVA;
	}

	public float getSubtotalVA() {
		return subtotalVA;
	}

	public void setSubtotalVA(float subtotalVA) {
		this.subtotalVA = subtotalVA;
	}

	@Override
	public String toString() {
		return "VentaArticulo [id=" + id + ", ventaVA=" + ventaVA + ", articuloVA=" + articuloVA + ", cantidadVA="
				+ cantidadVA + ", subtotalVA=" + subtotalVA + "]";
	}



}
