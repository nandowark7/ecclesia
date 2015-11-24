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

import br.com.ecclesia.model.financeiro.MovimentaSaldo;
import br.com.ecclesia.model.secretaria.Pessoa;
import br.com.ecclesia.repository.financeiro.BancoContas;
import br.com.ecclesia.repository.financeiro.Clientes;
import br.com.ecclesia.repository.financeiro.Movimentos;
import br.com.ecclesia.repository.secretaria.Cidades;
import br.com.ecclesia.repository.secretaria.Congregacoes;
import br.com.ecclesia.repository.secretaria.Pessoas;

@Controller
@RequestMapping("/financeiro/lancamentos/transferencias")
public class MovimentacaoController implements Serializable{

	private static final long serialVersionUID = 1L;

	@Autowired
	private BancoContas contasRepository;

	@Autowired
	private Movimentos repository;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		populaView(model);
		return "pages/financeiro/lancamentos/transferencias/index";
	}

	
	@RequestMapping(value = "simples/", method = RequestMethod.GET)
	public String inserirSimples(Model model) {
		model.addAttribute("contas", contasRepository.todas2());
		model.addAttribute("movimento", new MovimentaSaldo());
		return "pages/financeiro/lancamentos/transferencias/simples";
	}
	
	@RequestMapping(value = "entrecontas/", method = RequestMethod.GET)
	public String inserirEntreContas(Model model) {
		model.addAttribute("contas", contasRepository.todas2());
		model.addAttribute("movimento", new MovimentaSaldo());
		return "pages/financeiro/lancamentos/transferencias/entrecontas";
	}


	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String salvar(@Valid MovimentaSaldo movimento, BindingResult erros, RedirectAttributes redirect, Model model) {
		if (erros.hasErrors()) {
			return "pages/financeiro/lancamento/transferencias/cadastro";
		}
		if (movimento.getCodigo() != null) {
			repository.alterar(movimento);
		} else {
			repository.inserir(movimento);
		}
		redirect.addFlashAttribute("mensagem", "Movimentação adicionada com sucesso");
		return "redirect:/financeiro/lancamentos/transferencias/";
	}

	@RequestMapping(value = "simples/{codigo}", method = RequestMethod.GET)
	public String alterarSimples(@PathVariable Long codigo, Model model) {
		model.addAttribute("contas", contasRepository.todas2());
		model.addAttribute("movimento", repository.findByCodigo(codigo));
		return "pages/financeiro/lancamentos/transferencias/simples";
	}
	
	@RequestMapping(value = "entrecontas/{codigo}", method = RequestMethod.GET)
	public String alterarEntreContas(@PathVariable Long codigo, Model model) {
		model.addAttribute("contas", contasRepository.todas2());
		model.addAttribute("movimento", repository.findByCodigo(codigo));
		return "pages/financeiro/lancamentos/transferencias/entrecontas";
	}

	@RequestMapping(value = "/{codigo}/excluir", method = RequestMethod.GET)
	public String excluir(@PathVariable Long codigo, Model model) {
		repository.excluir(codigo);

		return "redirect:/financeiro/lancamentos/transferencias/";
	}

	private void populaView(Model model) {
		model.addAttribute("movimentos", repository.todas());
		model.addAttribute("contas", contasRepository.todas());
	}

}
