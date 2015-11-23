package br.com.ecclesia.controller.financeiro;

import java.io.Serializable;
import java.text.SimpleDateFormat;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.JsonNodeFactory;
import com.fasterxml.jackson.databind.node.ObjectNode;

import br.com.ecclesia.model.financeiro.Despesa;
import br.com.ecclesia.model.financeiro.DespesaParcela;
import br.com.ecclesia.repository.departamento.Departamentos;
import br.com.ecclesia.repository.financeiro.Despesas;
import br.com.ecclesia.repository.financeiro.ParcelasDespesas;
import br.com.ecclesia.repository.financeiro.PlanoContasRepo;
import br.com.ecclesia.repository.secretaria.Congregacoes;
import br.com.ecclesia.repository.secretaria.Pessoas;

@Controller
@RequestMapping("/financeiro/lancamentos/despesas/")
public class DespesaController implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private Despesas repository;
	
	@Autowired
	private Pessoas fornecedorRepository;
	
	@Autowired
	private PlanoContasRepo planoRepository;
	@Autowired
	private Congregacoes congregacaoRepository;
	@Autowired
	private Departamentos departamentoRepository;
	
	@Autowired
	private ParcelasDespesas parcelaRepository;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		populaView(model);
		return "pages/financeiro/lancamentos/despesas/index";
	}
	
	private void populaView(Model model) {
		model.addAttribute("parcelas", parcelaRepository.todas());
		model.addAttribute("despesas", repository.todas());
		model.addAttribute("fornecedor", fornecedorRepository.todas3());
		model.addAttribute("plano", planoRepository.todasD());
		model.addAttribute("congregacoes", congregacaoRepository.todas());
		model.addAttribute("departamentos", departamentoRepository.todas());
		
	}

	@RequestMapping(value = "novo/", method = RequestMethod.GET)
	public String inserir(Model model) {
		model.addAttribute("despesa", new Despesa());
		model.addAttribute("fornecedor", fornecedorRepository.todas3());
		model.addAttribute("plano", planoRepository.todasD());
		model.addAttribute("congregacoes", congregacaoRepository.todas());
		model.addAttribute("departamentos", departamentoRepository.todas());
		return "pages/financeiro/lancamentos/despesas/cadastro";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String salvar(@Valid Despesa despesa, BindingResult erros, RedirectAttributes redirect, Model model) {
		if (erros.hasErrors()) {
			return "pages/financeiro/lancamentos/receitasxxxx";
		}
		
		for (DespesaParcela parcela : despesa.getParcelas()) {
			if (parcela.getCodigo() < 1) {
				parcela.setCodigo(null);
			}
			parcela.setDespesa(despesa);
		}
		
		if (despesa.getCodigo() != null) {
			repository.alterar(despesa);
		} else {
			repository.inserir(despesa);
		}
		return "redirect:/financeiro/lancamentos/despesas/";
	}

	@RequestMapping(value = "/{codigo}", method = RequestMethod.GET)
	public String alterar(@PathVariable Long codigo, Model model) {
		Despesa despesa = repository.findByCodigo(codigo);
		
		JsonNodeFactory nodeFactory = new JsonNodeFactory(true);
		
		ObjectMapper mapper = new ObjectMapper();
		ArrayNode array = mapper.createArrayNode();
		
		SimpleDateFormat dt = new SimpleDateFormat("dd/MM/yyyy"); 
		for (DespesaParcela parcela : despesa.getParcelas()) {
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
		model.addAttribute("fornecedor", fornecedorRepository.todas3());
		model.addAttribute("plano", planoRepository.todasD());
		model.addAttribute("congregacoes", congregacaoRepository.todas());
		model.addAttribute("departamentos", departamentoRepository.todas());
		model.addAttribute("despesa", despesa);
		return "pages/financeiro/lancamentos/despesas/cadastro";
	}
	
	@RequestMapping(value = "/{codigo}/excluir", method = RequestMethod.GET)
	public String excluir(@PathVariable Long codigo, Model model) {
		repository.excluir(codigo);
		
		return "redirect:/financeiro/lancamentos/despesas/";
	}

}
