package br.com.ecclesia.controller.secretaria;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.ecclesia.model.secretaria.Pessoa;
import br.com.ecclesia.repository.secretaria.Cidades;
import br.com.ecclesia.repository.secretaria.Congregacoes;
import br.com.ecclesia.repository.secretaria.Pessoas;

@Controller
@RequestMapping("/secretaria/cadastro/pessoa")
public class PessoaController {

	@Autowired
	private Cidades cidadeRepository;

	@Autowired
	private Congregacoes congregacaoRepository;
	
	@Autowired
	private Pessoas repository;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		populaView(model);
		return "pages/secretaria/cadastro/pessoa/index";
	}

	
	@RequestMapping(value = "novo/", method = RequestMethod.GET)
	public String inserir(Model model) {
		model.addAttribute("congregacoes", congregacaoRepository.todas());
		model.addAttribute("cidades", cidadeRepository.todas());
		model.addAttribute("pessoa", new Pessoa());
		return "pages/secretaria/cadastro/pessoa/cadastro";

	}


	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String salvar(@Valid Pessoa pessoa, BindingResult erros, RedirectAttributes redirect, Model model) {
		if (erros.hasErrors()) {
			return "pages/secretaria/cadastro/pessoa/cadastro";
		}
		if (pessoa.getCodigo() != null) {
			repository.alterar(pessoa);
		} else {
			repository.inserir(pessoa);
		}
		redirect.addFlashAttribute("mensagem", "Membro salvo com sucesso");
		return "redirect:/secretaria/cadastro/pessoa/";
	}

	@RequestMapping(value = "/{codigo}", method = RequestMethod.GET)
	public String alterar(@PathVariable Long codigo, Model model) {
		model.addAttribute("congregacoes", congregacaoRepository.todas());
		model.addAttribute("cidades", cidadeRepository.todas());
		model.addAttribute("pessoa", repository.findByCodigo(codigo));
		return "pages/secretaria/cadastro/pessoa/cadastro";
	}

	@RequestMapping(value = "/{codigo}/excluir", method = RequestMethod.GET)
	public String excluir(@PathVariable Long codigo, Model model) {
		repository.excluir(codigo);

		return "redirect:/secretaria/cadastro/pessoa/";
	}

	private void populaView(Model model) {
		model.addAttribute("pessoas", repository.todas());
		model.addAttribute("congregacoes", congregacaoRepository.todas());
		model.addAttribute("cidades", cidadeRepository.todas());
	}

}
