package br.com.ecclesia.service.seguranca;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import br.com.ecclesia.model.seguranca.Usuario;
import br.com.ecclesia.repository.seguranca.UsuarioRepository;

@Service
public class UsuarioService implements UserDetailsService {

	private UsuarioRepository usuarioRepositorio;
	
	@Autowired
	public UsuarioService(UsuarioRepository usuarioRepository) {
		this.usuarioRepositorio = usuarioRepository;
	}
	
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		Usuario usuario = usuarioRepositorio.findByUsername(username);
		if (usuario == null) {
			throw new UsernameNotFoundException("Login invalido");
		}
		return usuario;
	}
	
	public Usuario getUsuarioLogado() {
		return new Usuario();
	}

}
