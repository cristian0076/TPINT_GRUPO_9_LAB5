package entidad;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;

@Entity
@Table(name = "Venta")
public class Venta {
	@Id
	@Column(name = "ID_V")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Autowired
	private Date Fecha_V;
	@Autowired
	@ManyToOne(cascade = { CascadeType.ALL })
	@JoinColumn(name="ID_Cliente_V")
	private Cliente Id_Cliente;
	@Autowired
	@ManyToOne(cascade = { CascadeType.ALL })
	@JoinColumn(name="ID_Usuario_V")
	private Usuario Id_usuario;
	@Autowired
	private float Total_V;
	@Autowired
	private boolean EstadoV;
	private boolean StockDescontadoV;
	
	public boolean isEstadoV() {
		return EstadoV;
	}


	public void setEstadoV(boolean estadoV) {
		EstadoV = estadoV;
	}


	public Cliente getId_Cliente() {
		return Id_Cliente;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public Date getFecha_V() {
		return Fecha_V;
	}


	public void setFecha_V(Date fecha_V) {
		Fecha_V = fecha_V;
	}


	public Usuario getId_usuario() {
		return Id_usuario;
	}


	public void setId_usuario(Usuario id_usuario) {
		Id_usuario = id_usuario;
	}


	public float getTotal_V() {
		return Total_V;
	}


	public void setTotal_V(float total_V) {
		Total_V = total_V;
	}


	public void setId_Cliente(Cliente id_Cliente) {
		Id_Cliente = id_Cliente;
	}





	public boolean isStockDescontadoV() {
		return StockDescontadoV;
	}


	public void setStockDescontadoV(boolean stockDescontadoV) {
		StockDescontadoV = stockDescontadoV;
	}


	@Override
	public String toString() {
		return "Venta [id=" + id + ", Fecha_V=" + Fecha_V + ", Id_Cliente=" + Id_Cliente + ", Id_usuario=" + Id_usuario
				+ ", Total_V=" + Total_V + ", EstadoV=" + EstadoV + ", StockDescontadoV=" + StockDescontadoV + "]";
	}
		
}
