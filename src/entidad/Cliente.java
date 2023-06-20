package entidad;

import java.util.Date;

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
@Table(name = "Cliente")
public class Cliente {
	@Id
	@Column(name = "ID_C")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Autowired
	private String DNI_C;
	@Autowired
	private String Nombre_C;
	@Autowired
	private String Apellido_C;
	@Autowired
	private String Sexo_C;
	@Autowired
	private Date Fecha_Nacimiento_C;
	@Autowired
	private String Direccion_C;
	@Autowired
	private String Localidad_C;
	@Autowired
	private String Mail_C;
	@Autowired
	private String Telefono_C;
	@Autowired
	private boolean EstadoC;

	public boolean isEstadoC() {
		return EstadoC;
	}

	public void setEstadoC(boolean estadoC) {
		EstadoC = estadoC;
	}

	public Cliente() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDNI_C() {
		return DNI_C;
	}

	public void setDNI_C(String dNI_C) {
		DNI_C = dNI_C;
	}

	public String getNombre_C() {
		return Nombre_C;
	}

	public void setNombre_C(String nombre_C) {
		Nombre_C = nombre_C;
	}

	public String getApellido_C() {
		return Apellido_C;
	}

	public void setApellido_C(String apellido_C) {
		Apellido_C = apellido_C;
	}

	public String getSexo_C() {
		return Sexo_C;
	}

	public void setSexo_C(String sexo_C) {
		Sexo_C = sexo_C;
	}

	public Date getFecha_Nacimiento_C() {
		return Fecha_Nacimiento_C;
	}

	public void setFecha_Nacimiento_C(Date fecha_Nacimiento_C) {
		Fecha_Nacimiento_C = fecha_Nacimiento_C;
	}

	public String getDireccion_C() {
		return Direccion_C;
	}

	public void setDireccion_C(String direccion_C) {
		Direccion_C = direccion_C;
	}

	public String getLocalidad_C() {
		return Localidad_C;
	}

	public void setLocalidad_C(String localidad_C) {
		Localidad_C = localidad_C;
	}

	public String getMail_C() {
		return Mail_C;
	}

	public void setMail_C(String mail_C) {
		Mail_C = mail_C;
	}

	public String getTelefono_C() {
		return Telefono_C;
	}

	public void setTelefono_C(String telefono_C) {
		Telefono_C = telefono_C;
	}
	
	@Override
	public String toString() {
		return "Cliente [id=" + id + ", DNI_C=" + DNI_C + ", Nombre_C=" + Nombre_C + ", Apellido_C=" + Apellido_C
				+ ", Sexo_C=" + Sexo_C + ", Fecha_Nacimiento_C=" + Fecha_Nacimiento_C + ", Direccion_C=" + Direccion_C
				+ ", Localidad_C=" + Localidad_C + ", Mail_C=" + Mail_C + ", Telefono_C=" + Telefono_C + ", EstadoC="
				+ EstadoC + "]";
	}

		
}
