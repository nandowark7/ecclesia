package br.com.ecclesia.model.secretaria;

public class Sede {
	private Long id;
	private String nome;

	public Sede() {

	}

	public Sede(Long id) {
		this.id = id;
	}

	public Sede(Long id, String nome) {
		this.id = id;
		this.nome = nome;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

}
