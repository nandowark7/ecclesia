package br.com.ecclesia.repository.seguranca;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.ecclesia.model.seguranca.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

	Usuario findByUsername(String username);
}
