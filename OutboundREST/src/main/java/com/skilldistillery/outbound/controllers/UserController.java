package com.skilldistillery.outbound.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.outbound.data.UserDAO;

@RestController
@RequestMapping("outbound")
public class UserController { 

	@Autowired
	private UserDAO dao;
	
	
	@GetMapping("ping")
	public String getPing() {
		return "pong";
	}
	
	
	
	
	
	
}
