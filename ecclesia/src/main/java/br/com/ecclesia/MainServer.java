package br.com.ecclesia;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import br.com.ecclesia.config.WebSecurityConfig;

@Configuration
@EnableAutoConfiguration
@ComponentScan
public class MainServer extends SpringBootServletInitializer {
	public static void main(String[] args) {
		SpringApplication.run(MainServer.class, args);
	}
	
	@Bean
	public WebSecurityConfigurerAdapter webSecurityConfigurerAdapter() {
		return new WebSecurityConfig();
	}

	
}
