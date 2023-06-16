package entidad;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;

@Entity
@Table(name = "TipoCuenta")
public class TipoCuenta {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Autowired
	private String descripcionT;
	@Autowired
	private boolean EstadoT;

	public boolean isEstadoT() {
		return EstadoT;
	}

	public void setEstadoT(boolean estadoT) {
		EstadoT = estadoT;
	}

	public TipoCuenta() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescripcionT() {
		return descripcionT;
	}

	public void setDescripcionT(String descripcionT) {
		this.descripcionT = descripcionT;
	}

	@Override
	public String toString() {
		return "TipoCuenta [id=" + id + ", descripcionT=" + descripcionT + "]";
	}

}
