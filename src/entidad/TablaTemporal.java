package entidad;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tabla_temporal")
public class TablaTemporal {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private float sumaPrecio;

	public TablaTemporal() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getSumaPrecio() {
		return sumaPrecio;
	}

	public void setSumaPrecio(float sumaPrecio) {
		this.sumaPrecio = sumaPrecio;
	}

	@Override
	public String toString() {
		return "TablaTemporal [id=" + id + ", sumaPrecio=" + sumaPrecio + "]";
	}

}
