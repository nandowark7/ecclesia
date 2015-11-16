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

import br.com.ecclesia.model.financeiro.Receita;
import br.com.ecclesia.model.financeiro.ReceitaParcela;
import br.com.ecclesia.repository.financeiro.Receitas;

@Controller
@RequestMapping("/financeiro/lancamentos/receitas/")
public class ReceitaController implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private Receitas repository;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		populaView(model);
		return "pages/financeiro/lancamentos/receitas/index";
	}
	
	private void populaView(Model model) {
		model.addAttribute("receita", repository.todas());
		
	}

	@RequestMapping(value = "novo/", method = RequestMethod.GET)
	public String inserir(Model model) {
		model.addAttribute("receita", new Receita());
		return "pages/financeiro/lancamentos/receitas/cadastro";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String salvar(@Valid Receita receita, BindingResult erros, RedirectAttributes redirect, Model model) {
		if (erros.hasErrors()) {
			return "pages/financeiro/lancamentos/receitas/cadastro";
		}
		
		for (ReceitaParcela parcela : receita.getParcelas()) {
			System.out.println(parcela.getDescricao());
			parcela.setReceita(receita);
		}
		
		if (receita.getCodigo() != null) {
			repository.alterar(receita);
		} else {
			repository.inserir(receita);
		}
		return "redirect:/financeiro/lancamentos/receitas/";
	}

	@RequestMapping(value = "/{codigo}", method = RequestMethod.GET)
	public String alterar(@PathVariable Long codigo, Model model) {
		model.addAttribute("receita", repository.findByCodigo(codigo));
		return "pages/financeiro/lancamentos/receitas/cadastro";
	}
	
	@RequestMapping(value = "/{codigo}/excluir", method = RequestMethod.GET)
	public String excluir(@PathVariable Long codigo, Model model) {
		repository.excluir(codigo);
		
		return "redirect:/financeiro/lancamentos/receitas/";
	}

}
