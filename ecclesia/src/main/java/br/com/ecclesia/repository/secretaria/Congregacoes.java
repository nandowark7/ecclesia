package br.com.ecclesia.repository.secretaria;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.ecclesia.model.secretaria.Congregacao;
import br.com.ecclesia.model.secretaria.Regional;

@Repository
@Transactional
public class Congregacoes implements Serializable {

	private static final long serialVersionUID = 1L;
	
	


	@Autowired
	private EntityManager em;

	public List<Congregacao> todas() {
		Query query = em.createQuery("select c from Congregacao c");
		return (List<Congregacao>) query.getResultList();
	}
	
	public Congregacao findByCodigo(Long codigo) {
		return em.find(Congregacao.class, codigo);
	}

	public void inserir(Congregacao congregacao) {
		
		em.persist(congregacao);
		
	}
	
	public void alterar(Congregacao congregacao) {
		
		em.merge(congregacao);
		
	}
	
	public void excluir(Long codigo) {
		Congregacao congregacao = em.find(Congregacao.class, codigo);
		em.remove(congregacao);
		
	}

}
