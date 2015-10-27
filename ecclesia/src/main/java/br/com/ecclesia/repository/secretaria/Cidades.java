package br.com.ecclesia.repository.secretaria;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.ecclesia.model.secretaria.Cidade;

@Repository
@Transactional
public class Cidades implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private EntityManager em;
	
	public List<Cidade> todas() {
		Query query = em.createQuery("select c from Cidade c");
		return (List<Cidade>) query.getResultList();
		//return Arrays.asList(em.find(Cidade.class, 1L));
	}
	
	public Cidade findByCodigo(Long codigo) {
		return em.find(Cidade.class, codigo);
	}

	public void inserir(Cidade cidade) {
		
		em.persist(cidade);
		
	}
	
	public void alterar(Cidade cidade) {
		
		em.merge(cidade);
		
	}
	
	public void excluir(Long codigo) {
		Cidade cidade = em.find(Cidade.class, codigo);
		em.remove(cidade);
		
	}

}
