package com.wander.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

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
			@RequestParam("password") String pass, @RequestParam("role") String role){
		Login login = new Login();
		login.setUserName(user);
		login.setPassword(pass);
		login.setRole(role);
		 loginService.addUser(login);
		 return "home-page";
	}
	
	@GetMapping("/showAllUsers")
	public List<Login> showAllUsers(){
		
		return loginService.showAllUsers();
	}
	//access denied jsp page
	
	@GetMapping("/access-denied")
	public String showAccessDeniedPage(){
		return "access-denied";
	}

}
