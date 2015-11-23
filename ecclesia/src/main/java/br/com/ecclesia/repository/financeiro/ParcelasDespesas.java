package br.com.ecclesia.repository.financeiro;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.ecclesia.model.financeiro.DespesaParcela;
import br.com.ecclesia.model.financeiro.ReceitaParcela;

@Repository
@Transactional
public class ParcelasDespesas implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private EntityManager em;
	
	public List<DespesaParcela> todas() {
		Query query = em.createQuery("select d from DespesaParcela d");
		return (List<DespesaParcela>) query.getResultList();
	}
	
	public DespesaParcela findByCodigo(Long codigo) {
		return em.find(DespesaParcela.class, codigo);
	}

	public void inserir(DespesaParcela parcela) {
		
		em.persist(parcela);
		
	}
	
	public void alterar(DespesaParcela parcela) {
		
		em.merge(parcela);
		
	}
	
	public void excluir(Long codigo) {
		DespesaParcela parcela = em.find(DespesaParcela.class, codigo);
		em.remove(parcela);
		
	}

}
