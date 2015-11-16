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

@Repository
@Transactional
public class Receitas implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private EntityManager em;
	
	public List<Receita> todas() {
		Query query = em.createQuery("select b from Receita b");
		return (List<Receita>) query.getResultList();
	}
	
	public Receita findByCodigo(Long codigo) {
		return em.find(Receita.class, codigo);
	}

	public void inserir(Receita receita) {
		
		em.persist(receita);
		
	}
	
	public void alterar(Receita receita) {
		
		em.merge(receita);
		
	}
	
	public void excluir(Long codigo) {
		Receita receita = em.find(Receita.class, codigo);
		em.remove(receita);
		
	}

}
