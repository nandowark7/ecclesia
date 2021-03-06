package br.com.ecclesia.model.financeiro;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import br.com.ecclesia.model.departamentos.Departamento;
import br.com.ecclesia.model.secretaria.Congregacao;
import br.com.ecclesia.model.secretaria.Pessoa;

@Entity
@Table(name="receita_cabecalho")
public class Receita implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long codigo;
	
	private String documento;
	
	@ManyToOne
	@JoinColumn(name="codigo_cliente")
	private Pessoa clientes;
	
	@ManyToOne
	@JoinColumn(name="codigo_plano")
	private PlanoContas plano;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date emissao;
	
	@ManyToOne
	@JoinColumn(name="codigo_congregacao")
	private Congregacao congregacoes;
	
	@ManyToOne
	@JoinColumn(name="codigo_departamento")
	private Departamento departamentos;
	
	@OneToMany(mappedBy="receita", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<ReceitaParcela> parcelas;
	
	public List<ReceitaParcela> getParcelas() {
		return parcelas;
	}

	public void setParcelas(List<ReceitaParcela> parcelas) {
		this.parcelas = parcelas;
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public String getDocumento() {
		return documento;
	}

	public void setDocumento(String documento) {
		this.documento = documento;
	}

	public Pessoa getClientes() {
		return clientes;
	}

	public void setClientes(Pessoa clientes) {
		this.clientes = clientes;
	}

	public PlanoContas getPlano() {
		return plano;
	}

	public void setPlano(PlanoContas plano) {
		this.plano = plano;
	}

	public Date getEmissao() {
		return emissao;
	}

	public void setEmissao(Date emissao) {
		this.emissao = emissao;
	}

	public Congregacao getCongregacoes() {
		return congregacoes;
	}

	public void setCongregacoes(Congregacao congregacoes) {
		this.congregacoes = congregacoes;
	}

	public Departamento getDepartamentos() {
		return departamentos;
	}

	public void setDepartamentos(Departamento departamentos) {
		this.departamentos = departamentos;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((codigo == null) ? 0 : codigo.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Receita other = (Receita) obj;
		if (codigo == null) {
			if (other.codigo != null)
				return false;
		} else if (!codigo.equals(other.codigo))
			return false;
		return true;
	}
	
	

}
