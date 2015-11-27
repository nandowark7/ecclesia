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

import br.com.ecclesia.model.financeiro.BancoConta;
import br.com.ecclesia.model.financeiro.PlanoContas;
import br.com.ecclesia.repository.financeiro.BancoContas;
import br.com.ecclesia.repository.financeiro.PlanoContasRepo;

@Controller
@RequestMapping("/financeiro/cadastro/bancos_contas")
public class BancoContaController implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private BancoContas repository;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		populaView(model);
		return "pages/financeiro/cadastro/bancos_contas/index";
	}
	
	private void populaView(Model model) {
		model.addAttribute("banco", repository.todas2());
		
	}

	@RequestMapping(value = "novo/", method = RequestMethod.GET)
	public String inserir(Model model) {
		model.addAttribute("banco", new BancoConta());
		return "pages/financeiro/cadastro/bancos_contas/cadastro";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String salvar(@Valid BancoConta banco, BindingResult erros, RedirectAttributes redirect, Model model) {
		if (erros.hasErrors()) {
			return "pages/financeiro/cadastro/bancos_contas/cadastro";
		}
		if (banco.getCodigo() != null) {
			repository.alterar(banco);
		} else {
			repository.inserir(banco);
		}
		return "redirect:/financeiro/cadastro/bancos_contas/";
	}

	@RequestMapping(value = "/{codigo}", method = RequestMethod.GET)
	public String alterar(@PathVariable Long codigo, Model model) {
		model.addAttribute("banco", repository.findByCodigo(codigo));
		return "pages/financeiro/cadastro/bancos_contas/cadastro";
	}
	
	@RequestMapping(value = "/{codigo}/excluir", method = RequestMethod.GET)
	public String excluir(@PathVariable Long codigo, Model model) {
		repository.excluir(codigo);
		
		return "redirect:/financeiro/cadastro/bancos_contas/";
	}

}
