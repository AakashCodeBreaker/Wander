package com.wander.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wander.bean.Login;
import com.wander.bean.Notes;
import com.wander.repository.LoginRepository;
@Service
public class LoginService {
	
	@Autowired
	LoginRepository loginRepo;

	public void addUser(Login login) {
		loginRepo.save(login);
		
	}
	
	public List<Login> showAllUsers() {
		List<Login> users = new ArrayList<>();
		loginRepo.findAll().forEach(users::add);
		System.out.println(users);
		return users;
		
	}

	

}
