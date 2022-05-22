package com.skilldistillery.outbound.controllers;

import java.security.Principal;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.outbound.entities.user.User;
import com.skilldistillery.outbound.services.AuthService;

@RestController
@CrossOrigin({ "*", "http://localhost:4201" })
public class AuthController {

	
	@Autowired
	private AuthService aServ;
	
	@PostMapping(path = "/register")
	public User register(@RequestBody User user, 
			HttpServletResponse res) {
		
	    if (user == null) {
	        res.setStatus(400);
	    }
	    
	    user = aServ.register(user);
	    return user;
	}

	@GetMapping(path = "/authenticate")
	public User authenticate(Principal principal) {
		
	    return aServ.getUserByUsername(principal.getName());
	}
	
}
