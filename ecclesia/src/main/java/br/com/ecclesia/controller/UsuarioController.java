package br.com.ecclesia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.ecclesia.model.seguranca.Permissao;
import br.com.ecclesia.model.seguranca.Usuario;
import br.com.ecclesia.repository.seguranca.PermissaoRepository;
import br.com.ecclesia.repository.seguranca.UsuarioRepository;

@Controller
@RequestMapping("/usuario")
public class UsuarioController {

	@Autowired
	private UsuarioRepository usuarioRepository;

	@Autowired
	private PermissaoRepository permissaoRepository;

	@RequestMapping(value = "/")
	public String novo() {
		return "usuario/form";
	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String salvar(Usuario usuario, BindingResult erros, Model model,
			RedirectAttributes redirect) {
		String password = usuario.getPassword();
		String encodePassword = usuario.getEncodePassword(password);
		usuario.setPassword(encodePassword);
		usuario.addPermissao(getPermissao());
		redirect.addFlashAttribute("mensagem", "Usuário criado com sucesso");
		usuarioRepository.save(usuario);
		return "redirect:/login";
	}

	private Permissao getPermissao() {
		Permissao permissao = permissaoRepository.findByPermissao("ROLE_USER");
		if (permissao == null) {
			permissao = new Permissao();
			permissao.setPermissao("ROLE_USER");
			permissaoRepository.save(permissao);
		}
		return permissao;
	}
}
