package br.com.ecclesia.controller.secretaria;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.ecclesia.model.secretaria.Cidade;

@Controller
@RequestMapping("/secretaria/cadastro/sede")
public class CidadeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		populaView(model);
		return "pages/secretaria/cadastro/sede/index";
	}

	@RequestMapping(value = "novo/", method = RequestMethod.GET)
	public String novo() {
		return "pages/secretaria/cadastro/sede/cadastro";
	}
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String inserir(Cidade Sede) {
		System.out.println(Sede);
		return "pages/secretaria/cadastro/sede/cadastro";
	}

	private void populaView(Model model) {
		List<Cidade> sedes = Arrays.asList(new Cidade(1L, "São Lourenço do Oeste"));
		model.addAttribute("sedes", sedes);

	}

}
