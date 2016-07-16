package br.com.ecclesia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	
	@RequestMapping("/")  //retorna index - arrumar tela de login, alterar para novo usuario com opção de login tbm
	public String index(){
		return "index";
	}

}