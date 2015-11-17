package br.com.ecclesia.repository.financeiro;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.ecclesia.model.financeiro.BancoConta;
import br.com.ecclesia.model.financeiro.Receita;
import br.com.ecclesia.model.financeiro.ReceitaParcela;

@Repository
@Transactional
public class ParcelasReceitas implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private EntityManager em;
	
	public List<ReceitaParcela> todas() {
		Query query = em.createQuery("select b from ReceitaParcela b");
		return (List<ReceitaParcela>) query.getResultList();
	}
	
	public ReceitaParcela findByCodigo(Long codigo) {
		return em.find(ReceitaParcela.class, codigo);
	}

	public void inserir(ReceitaParcela parcela) {
		
		em.persist(parcela);
		
	}
	
	public void alterar(ReceitaParcela parcela) {
		
		em.merge(parcela);
		
	}
	
	public void excluir(Long codigo) {
		ReceitaParcela parcela = em.find(ReceitaParcela.class, codigo);
		em.remove(parcela);
		
	}

}
