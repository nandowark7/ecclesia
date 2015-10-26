package br.com.ecclesia.repository.secretaria;

import java.io.Serializable;
import java.util.List;
import javax.inject.Inject;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import br.com.ecclesia.model.secretaria.Cidade;

public class Cidades implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Inject 
	private EntityManagerFactory factory;
	
	public List<Cidades> todas() {
		EntityManager manager = null;
		return null;
	}

}
