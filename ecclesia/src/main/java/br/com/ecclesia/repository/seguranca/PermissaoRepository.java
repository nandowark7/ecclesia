package br.com.ecclesia.repository.seguranca;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.ecclesia.model.seguranca.Permissao;

public interface PermissaoRepository extends JpaRepository<Permissao, Long> {

	Permissao findByPermissao(String permissao);
}
