package com.wander;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.web.bind.annotation.RequestParam;

import com.wander.repository.LoginRepository;

@Configuration
@EnableWebSecurity
public class NotesLoginConfig extends WebSecurityConfigurerAdapter {
	
	/*protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		UserBuilder users = User.withDefaultPasswordEncoder();
		auth.inMemoryAuthentication()
		.withUser(users.username("Note").password("test123").roles("EMPLOYEE","MANAGER"))
		.withUser(users.username("Aakash").password("test123").roles("EMPLOYEE","ADMIN"));
	}*/
	@Autowired
	private LoginRepository loginRepo;
	
	protected void configure(AuthenticationManagerBuilder auth, @RequestParam ("username") String user) throws Exception {
		//UserBuilder users = User.withDefaultPasswordEncoder();
		auth.jdbcAuthentication().authoritiesByUsernameQuery(user);
	}
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		.antMatchers("/").hasRole("EMPLOYEE")
		.antMatchers("/leaders/**").hasRole("MANAGER")
		.antMatchers("/systems/**").hasRole("ADMIN")
		.and()
		.formLogin()
			.loginPage("/showMyLoginPage")
			.loginProcessingUrl("/authenticateTheUser")
			.permitAll()
			.and()
			.logout().permitAll()
			.and()
			.exceptionHandling().accessDeniedPage("/access-denied");
	}

}
