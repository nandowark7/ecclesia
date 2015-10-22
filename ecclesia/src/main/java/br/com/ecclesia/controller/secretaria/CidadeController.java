package br.com.ecclesia.controller.secretaria;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.ecclesia.model.secretaria.Cidade;

@Controller
@RequestMapping("/secretaria/cadastro/cidade")
public class CidadeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
	//	populaView(model);
		return "pages/secretaria/cadastro/cidade/index";
	}

	@RequestMapping(value = "novo/", method = RequestMethod.GET)
	public String novo() {
		return "pages/secretaria/cadastro/cidade/cadastro";
	}
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String inserir(Cidade Cidade) {
		System.out.println(Cidade);
		return "pages/secretaria/cadastro/cidade/cadastro";
	}



}
