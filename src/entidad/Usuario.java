package entidad;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;

@Entity
@Table(name = "Usuario")
public class Usuario {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;	
	private String usuarioU;	
	private String contraseniaU;
	@ManyToOne(cascade = { CascadeType.ALL })
	@JoinColumn(name="empleadoU")
	private Empleado empleadoU;
	@ManyToOne(cascade = { CascadeType.ALL })
	@JoinColumn(name="tipoCuentaU")
	private TipoCuenta tipoCuentaU;
	private boolean EstadoU;

	public boolean isEstadoU() {
		return EstadoU;
	}

	public void setEstadoU(boolean estadoU) {
		EstadoU = estadoU;
	}

	public Usuario() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsuarioU() {
		return usuarioU;
	}

	public void setUsuarioU(String usuarioU) {
		this.usuarioU = usuarioU;
	}

	public String getContraseniaU() {
		return contraseniaU;
	}

	public void setContraseniaU(String contraseniaU) {
		this.contraseniaU = contraseniaU;
	}

	public Empleado getEmpleadoU() {
		return empleadoU;
	}

	public void setEmpleadoU(Empleado empleadoU) {
		this.empleadoU = empleadoU;
	}

	public TipoCuenta getTipoCuentaU() {
		return tipoCuentaU;
	}

	public void setTipoCuentaU(TipoCuenta tipoCuentaU) {
		this.tipoCuentaU = tipoCuentaU;
	}

	@Override
	public String toString() {
		return "Usuario [id=" + id + ", usuarioU=" + usuarioU + ", contraseniaU=" + contraseniaU + ", empleadoU="
				+ empleadoU + ", tipoCuentaU=" + tipoCuentaU + "]";
	}

    }
