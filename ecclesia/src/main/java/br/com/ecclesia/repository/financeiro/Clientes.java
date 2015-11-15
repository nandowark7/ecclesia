package br.com.ecclesia.repository.financeiro;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.ecclesia.model.secretaria.Pessoa;

@Repository
@Transactional
public class Clientes implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private EntityManager em;

	public List<Pessoa> todas() {
		Query query = em.createQuery("select c from Pessoa c where grupo=4");
		return (List<Pessoa>) query.getResultList();
	}
	
	public Pessoa findByCodigo(Long codigo) {
		return em.find(Pessoa.class, codigo);
	}

	public void inserir(Pessoa cliente) {
		
		em.persist(cliente);
		
	}
	
	public void alterar(Pessoa cliente) {
		
		em.merge(cliente);
		
	}
	
	public void excluir(Long codigo) {
		Pessoa cliente = em.find(Pessoa.class, codigo);
		em.remove(cliente);
		
	}

}
