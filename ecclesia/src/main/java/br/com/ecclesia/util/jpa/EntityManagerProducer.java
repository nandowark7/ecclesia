package br.com.ecclesia.util.jpa;

import java.io.Serializable;

import javax.enterprise.context.ApplicationScoped;
import javax.persistence.EntityManagerFactory;

@ApplicationScoped
public class EntityManagerProducer implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private EntityManagerFactory factory;


}
