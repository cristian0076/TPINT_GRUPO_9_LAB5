package entidad;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;

@Entity
@Table(name = "Empleado")
public class Empleado {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String legajoE;
	private String dniE;
	private String nombreE;
	private String apellidoE;
	private String sexoE;
	private Date fechaNacimientoE;
	private String direccionE;
	private String localidadE;
	private String mailE;
	private String telefonoE;
	private boolean EstadoE;
	public boolean isEstadoE() {
		return EstadoE;
	}

	public void setEstadoE(boolean estadoE) {
		EstadoE = estadoE;
	}

	public Empleado() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLegajoE() {
		return legajoE;
	}

	public void setLegajoE(String legajoE) {
		this.legajoE = legajoE;
	}

	public String getDniE() {
		return dniE;
	}

	public void setDniE(String dniE) {
		this.dniE = dniE;
	}

	public String getNombreE() {
		return nombreE;
	}

	public void setNombreE(String nombreE) {
		this.nombreE = nombreE;
	}

	public String getApellidoE() {
		return apellidoE;
	}

	public void setApellidoE(String apellidoE) {
		this.apellidoE = apellidoE;
	}

	public String getSexoE() {
		return sexoE;
	}

	public void setSexoE(String sexoE) {
		this.sexoE = sexoE;
	}

	public Date getFechaNacimientoE() {
		return fechaNacimientoE;
	}

	public void setFechaNacimientoE(Date fechaNacimientoE) {
		this.fechaNacimientoE = fechaNacimientoE;
	}

	public String getDireccionE() {
		return direccionE;
	}

	public void setDireccionE(String direccionE) {
		this.direccionE = direccionE;
	}

	public String getLocalidadE() {
		return localidadE;
	}

	public void setLocalidadE(String localidadE) {
		this.localidadE = localidadE;
	}

	public String getMailE() {
		return mailE;
	}

	public void setMailE(String mailE) {
		this.mailE = mailE;
	}

	public String getTelefonoE() {
		return telefonoE;
	}

	public void setTelefonoE(String telefonoE) {
		this.telefonoE = telefonoE;
	}

	@Override
	public String toString() {
		return "Empleado [id=" + id + ", legajoE=" + legajoE + ", dniE=" + dniE + ", nombreE=" + nombreE
				+ ", apellidoE=" + apellidoE + ", sexoE=" + sexoE + ", fechaNacimientoE=" + fechaNacimientoE
				+ ", direccionE=" + direccionE + ", localidadE=" + localidadE + ", mailE=" + mailE + ", telefonoE="
				+ telefonoE + "]";
	}

}
