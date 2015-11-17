package br.com.ecclesia.controller.financeiro;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.JsonNodeFactory;
import com.fasterxml.jackson.databind.node.ObjectNode;

import br.com.ecclesia.model.financeiro.BancoConta;
import br.com.ecclesia.model.financeiro.Receita;
import br.com.ecclesia.model.financeiro.ReceitaParcela;
import br.com.ecclesia.repository.departamento.Departamentos;
import br.com.ecclesia.repository.financeiro.ParcelasReceitas;
import br.com.ecclesia.repository.financeiro.PlanoContasRepo;
import br.com.ecclesia.repository.financeiro.Receitas;
import br.com.ecclesia.repository.secretaria.Congregacoes;
import br.com.ecclesia.repository.secretaria.Pessoas;

@Controller
@RequestMapping("/financeiro/lancamentos/receitas/")
public class ReceitaController implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private Receitas repository;
	
	@Autowired
	private Pessoas clienteRepository;
	
	@Autowired
	private PlanoContasRepo planoRepository;
	@Autowired
	private Congregacoes congregacaoRepository;
	@Autowired
	private Departamentos departamentoRepository;
	
	@Autowired
	private ParcelasReceitas parcelaRepository;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		populaView(model);
		return "pages/financeiro/lancamentos/receitas/index";
	}
	
	private void populaView(Model model) {
		model.addAttribute("parcelas", parcelaRepository.todas());
		model.addAttribute("receitas", repository.todas());
		model.addAttribute("clientes", clienteRepository.todas2());
		model.addAttribute("plano", planoRepository.todasR());
		model.addAttribute("congregacoes", congregacaoRepository.todas());
		model.addAttribute("departamentos", departamentoRepository.todas());
		
	}

	@RequestMapping(value = "novo/", method = RequestMethod.GET)
	public String inserir(Model model) {
		model.addAttribute("receita", new Receita());
		model.addAttribute("clientes", clienteRepository.todas2());
		model.addAttribute("plano", planoRepository.todasR());
		model.addAttribute("congregacoes", congregacaoRepository.todas());
		model.addAttribute("departamentos", departamentoRepository.todas());
		return "pages/financeiro/lancamentos/receitas/cadastro";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String salvar(@Valid Receita receita, BindingResult erros, RedirectAttributes redirect, Model model) {
		if (erros.hasErrors()) {
			return "pages/financeiro/lancamentos/receitas/cadastro";
		}
		
		for (ReceitaParcela parcela : receita.getParcelas()) {
			if (parcela.getCodigo() < 1) {
				parcela.setCodigo(null);
			}
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
		Receita receita = repository.findByCodigo(codigo);
		
		JsonNodeFactory nodeFactory = new JsonNodeFactory(true);
		
		ObjectMapper mapper = new ObjectMapper();
		ArrayNode array = mapper.createArrayNode();
		
		SimpleDateFormat dt = new SimpleDateFormat("dd/MM/yyyy"); 
		for (ReceitaParcela parcela : receita.getParcelas()) {
			ObjectNode node = nodeFactory.objectNode();
			
			node.put("codigo", parcela.getCodigo());
			if (parcela.getVencimento() != null) {
				node.put("vencimento", dt.format(parcela.getVencimento()));
			}
			node.put("descricao", parcela.getDescricao());
			node.put("valor", parcela.getValor());
			node.put("acrescimo", parcela.getAcrescimo());
			node.put("desconto", parcela.getDesconto());
			node.put("total", parcela.getTotal());
			
			array.add(node);
		}
		
		model.addAttribute("parcelas", array.toString());
		
		model.addAttribute("receita", receita);
		return "pages/financeiro/lancamentos/receitas/cadastro";
	}
	
	@RequestMapping(value = "/{codigo}/excluir", method = RequestMethod.GET)
	public String excluir(@PathVariable Long codigo, Model model) {
		repository.excluir(codigo);
		
		return "redirect:/financeiro/lancamentos/receitas/";
	}

}
