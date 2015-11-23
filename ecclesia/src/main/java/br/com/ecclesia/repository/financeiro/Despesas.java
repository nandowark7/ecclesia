package br.com.ecclesia.repository.financeiro;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.ecclesia.model.financeiro.Despesa;

@Repository
@Transactional
public class Despesas implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private EntityManager em;
	
	public List<Despesa> todas() {
		Query query = em.createQuery("select d from Despesa d");
		return (List<Despesa>) query.getResultList();
	}
	
	public Despesa findByCodigo(Long codigo) {
		return em.find(Despesa.class, codigo);
	}

	public void inserir(Despesa despesa) {
		
		em.persist(despesa);
		
	}
	
	public void alterar(Despesa despesa) {
		
		em.merge(despesa);
		
	}
	
	public void excluir(Long codigo) {
		Despesa despesa = em.find(Despesa.class, codigo);
		em.remove(despesa);
		
	}

}
