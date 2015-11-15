package br.com.ecclesia.model.financeiro;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="bancos")
public class BancoConta implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long codigo;
	
	private String nome;
	private String agencia;
	private String conta;
	private TipoBanco tipoconta;
	@OneToMany(mappedBy="banco")
	private List<ReceitaParcela> receita_parcela;
	
	@OneToMany(mappedBy="banco")
	private List<DespesaParcela> despesa_parcela;

	public TipoBanco getTipoconta() {
		return tipoconta;
	}

	public void setTipoconta(TipoBanco tipoconta) {
		this.tipoconta = tipoconta;
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getAgencia() {
		return agencia;
	}

	public void setAgencia(String agencia) {
		this.agencia = agencia;
	}

	public String getConta() {
		return conta;
	}

	public void setConta(String conta) {
		this.conta = conta;
	}

	public List<ReceitaParcela> getReceita_parcela() {
		return receita_parcela;
	}

	public void setReceita_parcela(List<ReceitaParcela> receita_parcela) {
		this.receita_parcela = receita_parcela;
	}

	public List<DespesaParcela> getDespesa_parcela() {
		return despesa_parcela;
	}

	public void setDespesa_parcela(List<DespesaParcela> despesa_parcela) {
		this.despesa_parcela = despesa_parcela;
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
		BancoConta other = (BancoConta) obj;
		if (codigo == null) {
			if (other.codigo != null)
				return false;
		} else if (!codigo.equals(other.codigo))
			return false;
		return true;
	}
	
	

}
