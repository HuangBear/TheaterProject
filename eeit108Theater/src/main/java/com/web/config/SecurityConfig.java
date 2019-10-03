package com.web.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.web.service.AuthenticationService;
import com.web.service.EmployeeService;

@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private AuthenticationService authenticationService;
	@Autowired
    private PasswordEncoder passwordEncoder;
	@Autowired
	private DataSource dataSource;
	@Autowired
	public EmployeeService empServ;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authenticationService);
 
//		auth.jdbcAuthentication()
//         .passwordEncoder(passwordEncoder)
//         .dataSource(dataSource)
//         .usersByUsernameQuery("select email, password ,available from Employee where email=?")
//         .authoritiesByUsernameQuery("select email, permission from Employee where email=?")
//         .passwordEncoder(new BCryptPasswordEncoder());
		 
//		auth.authenticationProvider(authenticationProvider());
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		.antMatchers("/").permitAll()
		.and().authorizeRequests().antMatchers("/resources/**").permitAll()
		.and().authorizeRequests().antMatchers("/admin/css/**").permitAll()
		.and().authorizeRequests().antMatchers("/admin/**").hasAnyAuthority("1","2","3")
		
//		.and().authorizeRequests().antMatchers("/admin/**").permitAll()
		
		
		.and().formLogin()
		.loginPage("/EmpLogin").loginProcessingUrl("/EmpLoginAction")
		.successHandler((request, response, auth) -> {
            request.getSession().setAttribute("loginOK", auth.getName());
            request.getSession().setAttribute("empLoginOK", auth.getName());
            response.sendRedirect("admin/empIndexA");})
		.failureHandler((request, response, ex) -> {
			//request.getSession().setAttribute("error", "登入失敗");
			
            response.sendRedirect("EmpLogin?email=" + request.getParameter("username") + "&error");
        })
//		.failureUrl("/EmpLogin?error")
		
		.and()
		.logout().logoutUrl("/admin/perform_logout").logoutSuccessUrl("/EmpLogin?logout");
		
    
		http.csrf().disable();
	}
	
	@Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
	
//	@Bean
//	public AuthenticationProvider authenticationProvider(){
//	    DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
//	    authenticationProvider.setUserDetailsService(userDetailsService());
//	    authenticationProvider.setPasswordEncoder(passwordEncoder());
//	    //authenticationProvider.setSaltSource(saltSource());
//	    return authenticationProvider;
//	}
	
}
