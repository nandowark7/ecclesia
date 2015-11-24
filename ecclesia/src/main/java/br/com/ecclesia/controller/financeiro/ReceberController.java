package br.com.ecclesia.controller.financeiro;

import java.io.Serializable;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.ecclesia.model.financeiro.Receita;
import br.com.ecclesia.model.financeiro.ReceitaParcela;
import br.com.ecclesia.repository.departamento.Departamentos;
import br.com.ecclesia.repository.financeiro.BancoContas;
import br.com.ecclesia.repository.financeiro.ParcelasReceitas;
import br.com.ecclesia.repository.financeiro.PlanoContasRepo;
import br.com.ecclesia.repository.financeiro.Receitas;
import br.com.ecclesia.repository.secretaria.Congregacoes;
import br.com.ecclesia.repository.secretaria.Pessoas;

@Controller
@RequestMapping("/financeiro/lancamentos/receitas/receber")
public class ReceberController implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private Pessoas clienteRepository;
	
	@Autowired
	private ParcelasReceitas parcelaRepository;
	
	@Autowired
	private BancoContas bancoRepository;
	
	private void populaView(Model model) {
		model.addAttribute("parcelas", parcelaRepository.todas());
		model.addAttribute("clientes", clienteRepository.todas2());
		model.addAttribute("banco", bancoRepository.todas2());
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String salvar(@Valid ReceitaParcela parcela, BindingResult erros, RedirectAttributes redirect, Model model) {
		if (erros.hasErrors()) {
			return "pages/financeiro/lancamentos/receitas/cadastro";
		}
		ReceitaParcela parcelaBase = parcelaRepository.findByCodigo(parcela.getCodigo());
		parcelaBase.setBanco(parcela.getBanco());
		parcelaBase.setRecebimento(parcela.getRecebimento());
		parcelaRepository.alterar(parcelaBase);
		
		return "redirect:/financeiro/lancamentos/receitas/";
	}

	@RequestMapping(value = "/{codigo}", method = RequestMethod.GET)
	public String alterar(@PathVariable Long codigo, Model model) {
		model.addAttribute("parcela", parcelaRepository.findByCodigo(codigo));
		model.addAttribute("bancos", bancoRepository.todas2());
		return "/pages/financeiro/lancamentos/receitas/receber";
	}
}
