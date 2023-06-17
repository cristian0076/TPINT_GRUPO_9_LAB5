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
@Table(name = "Articulo")
public class Articulo {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Autowired
	private String nombreA;
	@Autowired
	private String descripcionA;
	
	@Autowired
	@ManyToOne(cascade = { CascadeType.ALL })
	@JoinColumn(name="marcaA")
	private Marca marcaA;
	@Autowired
	private String tipoA;
	private boolean status; // 0 inactivo, 1 activo

	public Articulo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public boolean isStatus() {
		return status;
	}



	public void setStatus(boolean status) {
		this.status = status;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombreA() {
		return nombreA;
	}

	public void setNombreA(String nombreA) {
		this.nombreA = nombreA;
	}

	public String getDescripcionA() {
		return descripcionA;
	}

	public void setDescripcionA(String descripcionA) {
		this.descripcionA = descripcionA;
	}

	public Marca getMarcaA() {
		return marcaA;
	}

	public void setMarcaA(Marca marcaA) {
		this.marcaA = marcaA;
	}

	public String getTipoA() {
		return tipoA;
	}

	public void setTipoA(String tipoA) {
		this.tipoA = tipoA;
	}



	@Override
	public String toString() {
		return "Articulo [id=" + id + ", nombreA=" + nombreA + ", descripcionA=" + descripcionA + ", marcaA=" + marcaA
				+ ", tipoA=" + tipoA + ", status=" + status + "]";
	}



}
