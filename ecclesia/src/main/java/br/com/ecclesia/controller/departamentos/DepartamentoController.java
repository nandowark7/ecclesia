package br.com.ecclesia.controller.departamentos;

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

import br.com.ecclesia.model.departamentos.Departamento;
import br.com.ecclesia.repository.departamento.Departamentos;
import br.com.ecclesia.repository.secretaria.Congregacoes;

@Controller
@RequestMapping("/departamento/cadastro/tipos")
public class DepartamentoController implements Serializable{

	private static final long serialVersionUID = 1L;

	@Autowired
	private Congregacoes congregacaoRepository;
	
	@Autowired
	private Departamentos repository;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		populaView(model);
		return "pages/departamento/cadastro/tipos/index";
	}

	
	@RequestMapping(value = "novo/", method = RequestMethod.GET)
	public String inserir(Model model) {
		model.addAttribute("congregacao", congregacaoRepository.todas());
		model.addAttribute("departamento", new Departamento());
		return "pages/departamento/cadastro/tipos/cadastro";

	}


	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String salvar(@Valid Departamento departamento, BindingResult erros, RedirectAttributes redirect, Model model) {
		if (erros.hasErrors()) {
			return "pages/departamento/cadastro/tipos/cadastro";
		}
		if (departamento.getCodigo() != null) {
			repository.alterar(departamento);
		} else {
			repository.inserir(departamento);
		}
		redirect.addFlashAttribute("mensagem", "Departamento salvo com sucesso");
		return "redirect:/departamento/cadastro/tipos/";
	}

	@RequestMapping(value = "/{codigo}", method = RequestMethod.GET)
	public String alterar(@PathVariable Long codigo, Model model) {
		model.addAttribute("congregacao", congregacaoRepository.todas());
		model.addAttribute("departamento", repository.findByCodigo(codigo));
		return "pages/departamento/cadastro/tipos/cadastro";
	}

	@RequestMapping(value = "/{codigo}/excluir", method = RequestMethod.GET)
	public String excluir(@PathVariable Long codigo, Model model) {
		repository.excluir(codigo);

		return "redirect:/departamento/cadastro/tipos/";
	}

	private void populaView(Model model) {
		model.addAttribute("departamento", repository.todas());
		model.addAttribute("congregacao", congregacaoRepository.todas());
	}

}

