package br.com.ecclesia.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import br.com.ecclesia.repository.seguranca.UsuarioRepository;
import br.com.ecclesia.service.seguranca.UsuarioService;

public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private UsuarioRepository repository;
	
	/**
	 * Service utilizado para autenticar o usuário.
	 */
    @Override
    @Bean
    public UserDetailsService userDetailsService() {
        return new UsuarioService(repository);
    }
    
    /**
     * Configuração do Builder de autenticação do Spring, ajustado a maneira de criptografia e também qual é o
     * autenticado.
     * 
     * @param auth
     */
    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) {
        try {
            auth.userDetailsService(userDetailsService()).passwordEncoder(passwordEncoder());
        } catch (Exception e) {
            throw new SecurityException(e);
        }
    }
    
    /**
     * Bean responsável por criptografar a senha com base no {@link BCryptPasswordEncoder}
     * 
     * @return
     */
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(10);
    }
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable()
		.formLogin().loginPage("/login").defaultSuccessUrl("/")
		.failureUrl("/login?error=bad_credentials")
		.permitAll().and().authorizeRequests()
        .antMatchers("/usuario/**").permitAll().antMatchers("/**").hasRole("USER");
	}
	
	@Override
    public void configure(WebSecurity webSecurity) throws Exception {
        webSecurity.ignoring().antMatchers("/static/**");
    }
}
