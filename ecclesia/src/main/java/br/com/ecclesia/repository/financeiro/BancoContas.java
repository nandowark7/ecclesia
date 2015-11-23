package br.com.ecclesia.repository.financeiro;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.ecclesia.model.financeiro.BancoConta;

@Repository
@Transactional
public class BancoContas implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private EntityManager em;
	
	public List<BancoConta> todas() {
		Query query = em.createQuery("select b from BancoConta b");
		return (List<BancoConta>) query.getResultList();
	}
	public List<BancoConta> todas2() {
		Query query = em.createQuery("select b from BancoConta b where codigo >0");
		return (List<BancoConta>) query.getResultList();
	}
	public BancoConta findByCodigo(Long codigo) {
		return em.find(BancoConta.class, codigo);
	}

	public void inserir(BancoConta banco) {
		
		em.persist(banco);
		
	}
	
	public void alterar(BancoConta banco) {
		
		em.merge(banco);
		
	}
	
	public void excluir(Long codigo) {
		BancoConta banco = em.find(BancoConta.class, codigo);
		em.remove(banco);
		
	}

}
