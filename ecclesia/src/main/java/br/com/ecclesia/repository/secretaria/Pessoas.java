package br.com.ecclesia.repository.secretaria;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.ecclesia.model.secretaria.Congregacao;
import br.com.ecclesia.model.secretaria.Pessoa;
import br.com.ecclesia.model.secretaria.Regional;

@Repository
@Transactional
public class Pessoas implements Serializable {

	private static final long serialVersionUID = 1L;

	@Autowired
	private EntityManager em;

	public List<Pessoa> todas() {
		Query query = em.createQuery("select p from Pessoa p where grupo in(0,1,2) or grupo is null");
		return (List<Pessoa>) query.getResultList();
	}
	public List<Pessoa> todas2() {
		Query query = em.createQuery("select p from Pessoa p where grupo in(0,1,2,4) or grupo is null");
		return (List<Pessoa>) query.getResultList();
	}
	public Pessoa findByCodigo(Long codigo) {
		return em.find(Pessoa.class, codigo);
	}

	public void inserir(Pessoa pessoa) {
		
		em.persist(pessoa);
		
	}
	
	public void alterar(Pessoa pessoa) {
		
		em.merge(pessoa);
		
	}
	
	public void excluir(Long codigo) {
		Pessoa pessoa = em.find(Pessoa.class, codigo);
		em.remove(pessoa);
		
	}

}
