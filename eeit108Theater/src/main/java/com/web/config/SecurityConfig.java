package com.web.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import com.web.service.AuthenticationService;

@EnableWebSecurity

public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private AuthenticationService authenticationService;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authenticationService);
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/").permitAll()
		.and().authorizeRequests().antMatchers("/resources/**").permitAll()
		.and().authorizeRequests().antMatchers("/admin/**").hasAuthority("1")
		.and().formLogin().loginPage("/EmpLogin").loginProcessingUrl("/EmpLogin").permitAll()
		.and().logout().logoutSuccessUrl("/EmpLogin").permitAll();
		
		http.csrf().disable();
	}
	
//	.authorizeRequests()
//    .antMatchers("/").permitAll()
//    .antMatchers("/user/**").hasAuthority("USER")
//    .and()
//    .formLogin().loginPage("/login").defaultSuccessUrl("/user")
//    .and()
//    .logout().logoutUrl("/logout").logoutSuccessUrl("/login");
	
	
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//		// TODO Auto-generated method stub
//		http.anonymous();
//	}
	
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//		// TODO Auto-generated method stub
//		http.
//			authorizeRequests()
//			.anyRequest() //對象為所有網址
//			.authenticated() //存取必須通過驗證
//			.and()
//			.formLogin() //若未不符合authorize條件，則產生預設login表單
//			.and()
//			.httpBasic(); //產生基本表單
//	}
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//		// TODO Auto-generated method stub
//		http.
//			authorizeRequests()
//				.antMatchers("/resources/**").permitAll() //resource資料夾靜態資料可匿名存取
//				.antMatchers("/index2") //對象為所有網址
//				.authenticated() //存取必須通過驗證
//			.and()
//			.formLogin() 
//				.loginPage("/EmpLogin") //則產生自訂login表單
//				.failureUrl("/EmpLogin?error") //如果認證失敗，則導往/login並帶參數error
//				.defaultSuccessUrl("/index2") //認證通過後導往的Url
//				.permitAll()
//			.and()
//			.logout()
//				.logoutSuccessUrl("/login?logout") //
//			    .permitAll();
//	}
//	@Override
//	protected void configure(AuthenticationManagerBuilder auth)
//			throws Exception {
//		// TODO Auto-generated method stub
//		auth //Builder Design Pattern
//			.inMemoryAuthentication() //自訂Runtime時的使用者帳號
//				.withUser("admin") //新增user
//				.password("admin12345") //指定密碼
//				.roles("ADMIN", "USER") //指派權限群組
//				.and() //再新增使用者
//				.withUser("user")
//				.password("user12345")
//				.roles("USER");
//	}
	
}
