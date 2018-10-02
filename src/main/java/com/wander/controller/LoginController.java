package com.wander.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wander.bean.Authority;
import com.wander.bean.Login;
import com.wander.service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	
	@GetMapping("/showMyLoginPage")
	public String showMyLoginPage(){
		return "fancy-login";
	}
	
	@GetMapping("/registerTheUser")
	public String showRegisterPage(){
		return "register-page";
	}
	
	@PostMapping(value="/addUser")
	public String addUser(@RequestParam("username") String user, 
			@RequestParam("password") String pass, @RequestParam("confirmPassword") String cPass){
		Login login = new Login();
		Authority auth = new Authority();
		login.setUsername(user);
		login.setPassword("{noop}"+pass);
		login.setEnabled(1);
		auth.setUsername(user);
		auth.setAuthority("ROLE_EMPLOYEE");
		 loginService.addUser(login);
		 loginService.addAuth(auth);
		 return "fancy-login";
	}
	
	@GetMapping("/showAllUsers")
	public List<Login> showAllUsers(){
		
		return loginService.showAllUsers();
	}
	@GetMapping("/")
	public String showHome(){
		return "home-page";
	}
	
	//access denied jsp page
	
	@GetMapping("/access-denied")
	public String showAccessDeniedPage(){
		return "access-denied";
	}

}
