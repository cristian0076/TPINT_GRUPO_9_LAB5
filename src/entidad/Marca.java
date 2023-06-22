package entidad;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;

@Entity
@Table(name = "Marca")
public class Marca {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Autowired
	private String nombreM;
	@Autowired
	private String descripcionM;
	@Autowired
	private boolean EstadoM;


	public Marca() {
		super();
		// TODO Auto-generated constructor stub
	}

	public boolean isEstadoM() {
		return EstadoM;
	}

	public void setEstadoM(boolean estadoM) {
		EstadoM = estadoM;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombreM() {
		return nombreM;
	}

	public void setNombreM(String nombreM) {
		this.nombreM = nombreM;
	}

	public String getDescripcionM() {
		return descripcionM;
	}

	public void setDescripcionM(String descripcionM) {
		this.descripcionM = descripcionM;
	}

	@Override
	public String toString() {
		return "{'id':" + id + ", 'nombreM':'" + nombreM + "', 'descripcionM':'" + descripcionM + "'}";
	}

}
