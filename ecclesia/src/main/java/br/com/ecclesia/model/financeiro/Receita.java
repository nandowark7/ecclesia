package br.com.ecclesia.model.financeiro;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

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
	private PlanoContas plano_conta;
	
	@Temporal(TemporalType.DATE)
	private Date emissao;
	
	@ManyToOne
	@JoinColumn(name="codigo_congregacao")
	private Congregacao congregacoes;
	
	@ManyToOne
	@JoinColumn(name="codigo_departamento")
	private Departamento departamentos;
	
	@OneToMany(mappedBy="receita")
	private List<ReceitaParcela> receita_parcela;
	
	public List<ReceitaParcela> getReceita_parcela() {
		return receita_parcela;
	}

	public void setReceita_parcela(List<ReceitaParcela> receita_parcela) {
		this.receita_parcela = receita_parcela;
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

	public PlanoContas getPlano_conta() {
		return plano_conta;
	}

	public void setPlano_conta(PlanoContas plano_conta) {
		this.plano_conta = plano_conta;
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
