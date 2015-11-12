package br.com.ecclesia.repository.secretaria;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.ecclesia.model.secretaria.Regional;

@Repository
@Transactional
public class Regionais implements Serializable {

	private static final long serialVersionUID = 1L;

	@Autowired
	private EntityManager em;

	public List<Regional> todas() {
		Query query = em.createQuery("select r from Regional r");
		return (List<Regional>) query.getResultList();
	}
	
	public Regional findByCodigo(Long codigo) {
		return em.find(Regional.class, codigo);
	}

	public void inserir(Regional regional) {
		
		em.persist(regional);
		
	}
	
	public void alterar(Regional regional) {
		
		em.merge(regional);
		
	}
	
	public void excluir(Long codigo) {
		Regional regional = em.find(Regional.class, codigo);
		em.remove(regional);
		
	}

}
