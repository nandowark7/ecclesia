package br.com.ecclesia.repository.departamento;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.ecclesia.model.departamentos.Departamento;

@Repository
@Transactional
public class Departamentos implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private EntityManager em;

	public List<Departamento> todas() {
		Query query = em.createQuery("select d from Departamento d");
		return (List<Departamento>) query.getResultList();
	}
	
	public Departamento findByCodigo(Long codigo) {
		return em.find(Departamento.class, codigo);
	}

	public void inserir(Departamento departamento) {
		
		em.persist(departamento);
		
	}
	
	public void alterar(Departamento departamento) {
		
		em.merge(departamento);
		
	}
	
	public void excluir(Long codigo) {
		Departamento departamento = em.find(Departamento.class, codigo);
		em.remove(departamento);
		
	}

}
