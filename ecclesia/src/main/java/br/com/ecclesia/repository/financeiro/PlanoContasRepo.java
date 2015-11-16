package br.com.ecclesia.repository.financeiro;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.ecclesia.model.financeiro.PlanoContas;

@Repository
@Transactional
public class PlanoContasRepo implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private EntityManager em;
	
	public List<PlanoContas> todasR() {
		Query query = em.createQuery("select p from PlanoContas p where tipo=0");
		return (List<PlanoContas>) query.getResultList();
	}
	
	public List<PlanoContas> todasD() {
		Query query = em.createQuery("select d from PlanoContas d where tipo=1");
		return (List<PlanoContas>) query.getResultList();
	}
	
	public PlanoContas findByCodigo(Long codigo) {
		return em.find(PlanoContas.class, codigo);
	}

	public void inserir(PlanoContas plano) {
		
		em.persist(plano);
		
	}
	
	public void alterar(PlanoContas plano) {
		
		em.merge(plano);
		
	}
	
	public void excluir(Long codigo) {
		PlanoContas plano = em.find(PlanoContas.class, codigo);
		em.remove(plano);
		
	}

}
