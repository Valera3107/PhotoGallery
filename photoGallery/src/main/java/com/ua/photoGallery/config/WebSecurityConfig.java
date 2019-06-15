package com.ua.photoGallery.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.ua.photoGallery.security.UserDetailService;

@Configuration
@ComponentScan
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private UserDetailService userDetailService;

	public void configAuthetification(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailService).passwordEncoder(passwordEncoder());
	}

	@Bean(name = "passwordEncoder")
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		.antMatchers("/").permitAll()
		.antMatchers("/mainPage").access("hasRole('ROLE_USER')  or hasRole('ROLE_ADMIN')")
		.antMatchers("/uploadImage").access("hasRole('ROLE_ADMIN')")
		.antMatchers("/downloadImage").access("hasRole('ROLE_USER')")
		.anyRequest().permitAll().and()
		
		.formLogin().loginPage("/login")
		.defaultSuccessUrl("/home").usernameParameter("email").passwordParameter("password").and()
		.logout().logoutSuccessUrl("/login?logout").and()
		.exceptionHandling().accessDeniedPage("/403").and()
		.csrf();
	}

}
