package br.com.ecclesia.controller.financeiro;

import java.io.Serializable;

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
import br.com.ecclesia.repository.financeiro.Clientes;
import br.com.ecclesia.repository.secretaria.Cidades;
import br.com.ecclesia.repository.secretaria.Congregacoes;
import br.com.ecclesia.repository.secretaria.Pessoas;

@Controller
@RequestMapping("/financeiro/cadastro/clientes")
public class ClienteController implements Serializable{

	private static final long serialVersionUID = 1L;

	@Autowired
	private Cidades cidadeRepository;

	@Autowired
	private Congregacoes congregacaoRepository;
	
	@Autowired
	private Clientes repository;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		populaView(model);
		return "pages/financeiro/cadastro/clientes/index";
	}

	
	@RequestMapping(value = "novo/", method = RequestMethod.GET)
	public String inserir(Model model) {
		model.addAttribute("congregacoes", congregacaoRepository.todas());
		model.addAttribute("cidades", cidadeRepository.todas());
		model.addAttribute("cliente", new Pessoa());
		return "pages/financeiro/cadastro/clientes/cadastro";

	}


	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String salvar(@Valid Pessoa cliente, BindingResult erros, RedirectAttributes redirect, Model model) {
		if (erros.hasErrors()) {
			return "pages/financeiro/cadastro/clientes/cadastro";
		}
		if (cliente.getCodigo() != null) {
			repository.alterar(cliente);
		} else {
			repository.inserir(cliente);
		}
		redirect.addFlashAttribute("mensagem", "Cliente salvo com sucesso");
		return "redirect:/financeiro/cadastro/clientes/";
	}

	@RequestMapping(value = "/{codigo}", method = RequestMethod.GET)
	public String alterar(@PathVariable Long codigo, Model model) {
		model.addAttribute("congregacoes", congregacaoRepository.todas());
		model.addAttribute("cidades", cidadeRepository.todas());
		model.addAttribute("cliente", repository.findByCodigo(codigo));
		return "pages/financeiro/cadastro/clientes/cadastro";
	}

	@RequestMapping(value = "/{codigo}/excluir", method = RequestMethod.GET)
	public String excluir(@PathVariable Long codigo, Model model) {
		repository.excluir(codigo);

		return "redirect:/financeiro/cadastro/clientes/";
	}

	private void populaView(Model model) {
		model.addAttribute("clientes", repository.todas());
		model.addAttribute("congregacoes", congregacaoRepository.todas());
		model.addAttribute("cidades", cidadeRepository.todas());
	}

}
