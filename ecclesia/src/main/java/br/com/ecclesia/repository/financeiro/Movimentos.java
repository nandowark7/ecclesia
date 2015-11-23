package br.com.ecclesia.repository.financeiro;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.ecclesia.model.financeiro.MovimentaSaldo;
import br.com.ecclesia.model.secretaria.Pessoa;

@Repository
@Transactional
public class Movimentos implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private EntityManager em;

	public List<MovimentaSaldo> todas() {
		Query query = em.createQuery("select c from MovimentaSaldo c");
		return (List<MovimentaSaldo>) query.getResultList();
	}
	
	public MovimentaSaldo findByCodigo(Long codigo) {
		return em.find(MovimentaSaldo.class, codigo);
	}

	public void inserir(MovimentaSaldo movimento) {
		
		em.persist(movimento);
		
	}
	
	public void alterar(MovimentaSaldo movimento) {
		
		em.merge(movimento);
		
	}
	
	public void excluir(Long codigo) {
		MovimentaSaldo movimento = em.find(MovimentaSaldo.class, codigo);
		em.remove(movimento);
		
	}

}
