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

import br.com.ecclesia.model.secretaria.Congregacao;
import br.com.ecclesia.repository.secretaria.Cidades;
import br.com.ecclesia.repository.secretaria.Congregacoes;
import br.com.ecclesia.repository.secretaria.Regionais;

@Controller
@RequestMapping("/secretaria/cadastro/congregacao")
public class CongregacaoController {

	@Autowired
	private Cidades cidadeRepository;

	@Autowired
	private Regionais regionalRepository;
	
	@Autowired
	private Congregacoes repository;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		populaView(model);
		return "pages/secretaria/cadastro/congregacao/index";
	}

	
	@RequestMapping(value = "novo/", method = RequestMethod.GET)
	public String inserir(Model model) {
		model.addAttribute("regionais", regionalRepository.todas());
		model.addAttribute("congregacao", new Congregacao());
		return "pages/secretaria/cadastro/congregacao/cadastro";

	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String salvar(@Valid Congregacao congregacao, BindingResult erros, RedirectAttributes redirect, Model model) {
		if (erros.hasErrors()) {
			return "pages/secretaria/cadastro/congregacao/cadastro";
		}
		if (congregacao.getCodigo() != null) {
			repository.alterar(congregacao);
		} else {
			repository.inserir(congregacao);
		}
		redirect.addFlashAttribute("mensagem", "Congregação salva com sucesso");
		return "redirect:/secretaria/cadastro/congregacao/";
	}

	@RequestMapping(value = "/{codigo}", method = RequestMethod.GET)
	public String alterar(@PathVariable Long codigo, Model model) {
		model.addAttribute("regionais", regionalRepository.todas());
		model.addAttribute("congregacao", repository.findByCodigo(codigo));
		return "pages/secretaria/cadastro/congregacao/cadastro";
	}

	@RequestMapping(value = "/{codigo}/excluir", method = RequestMethod.GET)
	public String excluir(@PathVariable Long codigo, Model model) {
		repository.excluir(codigo);

		return "redirect:/secretaria/cadastro/congregacao/";
	}

	private void populaView(Model model) {
		model.addAttribute("congregacoes", repository.todas());
		model.addAttribute("regionais", regionalRepository.todas());
		//model.addAttribute("cidades", cidadeRepository.todas());
	}

}
