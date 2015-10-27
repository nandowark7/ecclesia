package br.com.ecclesia.controller.secretaria;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.ecclesia.model.secretaria.Regional;
import br.com.ecclesia.repository.secretaria.Cidades;

@Controller
@RequestMapping("/secretaria/cadastro/regional")
public class RegionalController {
	
	@Autowired
	private Cidades cidadeRepository;
	
	//@Autowired
	//private Regionais repository;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		//populaView(model);
		return "pages/secretaria/cadastro/regional/index";
	}

	@RequestMapping(value = "novo/", method = RequestMethod.GET)
	public String novo(Model model) {
		model.addAttribute("cidades", cidadeRepository.todas());
		model.addAttribute("regional", new Regional());
		return "pages/secretaria/cadastro/regional/cadastro";
		
	}
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String inserir(Regional regional) {
		System.out.println(regional);
		return "pages/secretaria/cadastro/regional/cadastro";
	}

	/*private void populaView(Model model) {
		List<Regional> regionais = Arrays.asList(new Regional(1L, "São Lourenço do Oeste"), new Regional(2L, "Chapecó"),
				new Regional(3L, "Pato Branco"));
		model.addAttribute("regionais", regionais);

	}*/

}
