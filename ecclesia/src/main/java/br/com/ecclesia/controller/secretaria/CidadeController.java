package br.com.ecclesia.controller.secretaria;

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

import br.com.ecclesia.model.secretaria.Cidade;
import br.com.ecclesia.repository.secretaria.Cidades;

@Controller
@RequestMapping("/secretaria/cadastro/cidade")
public class CidadeController implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private Cidades repository; // Repository

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		populaView(model);
		return "pages/secretaria/cadastro/cidade/index";
	}

	private void populaView(Model model) {
		model.addAttribute("cidades", repository.todas());
	}

	@RequestMapping(value = "novo/", method = RequestMethod.GET)
	public String inserir() {
		return "pages/secretaria/cadastro/cidade/cadastro";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String salvar(@Valid Cidade cidade, BindingResult erros, RedirectAttributes redirect, Model model) {
		if (erros.hasErrors()) {
			return "pages/secretaria/cadastro/cidade/cadastro";
		}
		if (cidade.getCodigo() != null) {
			repository.alterar(cidade);
		} else {
			repository.inserir(cidade);
		}
		redirect.addFlashAttribute("mensagem", "Cidade salva com sucesso");
		return "redirect:/secretaria/cadastro/cidade/";
	}

	@RequestMapping(value = "/{codigo}", method = RequestMethod.GET)
	public String alterar(@PathVariable Long codigo, Model model) {
		model.addAttribute("cidade", repository.findByCodigo(codigo));
		return "pages/secretaria/cadastro/cidade/cadastro";
	}
	
	@RequestMapping(value = "/{codigo}/excluir", method = RequestMethod.GET)
	public String excluir(@PathVariable Long codigo, Model model) {
		repository.excluir(codigo);
		
		return "redirect:/secretaria/cadastro/cidade/";
	}
}
 