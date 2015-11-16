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
import br.com.ecclesia.repository.financeiro.Fornecedores;
import br.com.ecclesia.repository.secretaria.Cidades;

@Controller
@RequestMapping("/financeiro/cadastro/fornecedores/")
public class FornecedorController implements Serializable{

	private static final long serialVersionUID = 1L;

	@Autowired
	private Cidades cidadeRepository;

	
	@Autowired
	private Fornecedores repository;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		populaView(model);
		return "pages/financeiro/cadastro/fornecedores/index";
	}

	
	@RequestMapping(value = "novo/", method = RequestMethod.GET)
	public String inserir(Model model) {
		model.addAttribute("cidades", cidadeRepository.todas());
		model.addAttribute("fornecedor", new Pessoa());
		return "pages/financeiro/cadastro/fornecedores/cadastro";

	}


	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String salvar(@Valid Pessoa fornecedor, BindingResult erros, RedirectAttributes redirect, Model model) {
		if (erros.hasErrors()) {
			return "pages/financeiro/cadastro/fornecedores/cadastro";
		}
		if (fornecedor.getCodigo() != null) {
			repository.alterar(fornecedor);
		} else {
			repository.inserir(fornecedor);
		}
		redirect.addFlashAttribute("mensagem", "Fornecedor salvo com sucesso");
		return "redirect:/financeiro/cadastro/fornecedores/";
	}

	@RequestMapping(value = "/{codigo}", method = RequestMethod.GET)
	public String alterar(@PathVariable Long codigo, Model model) {
		model.addAttribute("cidades", cidadeRepository.todas());
		model.addAttribute("fornecedor", repository.findByCodigo(codigo));
		return "pages/financeiro/cadastro/fornecedores/cadastro";
	}

	@RequestMapping(value = "/{codigo}/excluir", method = RequestMethod.GET)
	public String excluir(@PathVariable Long codigo, Model model) {
		repository.excluir(codigo);

		return "redirect:/financeiro/cadastro/fornecedores/";
	}

	private void populaView(Model model) {
		model.addAttribute("fornecedores", repository.todas());
		model.addAttribute("cidades", cidadeRepository.todas());
	}

}
