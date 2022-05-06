package com.skilldistillery.outbound.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.outbound.services.HuntTripServices;

@RestController
@RequestMapping("outbound")
public class HuntTripController {

	@Autowired
	private HuntTripServices huntServ;

	
	@GetMapping("hunttrip/ping")
	public String ping() {
		return "pong";
	}
	
	
	
	
	
}
