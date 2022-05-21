package com.skilldistillery.outbound.controllers;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.outbound.entities.hunttrip.HuntTrip;
import com.skilldistillery.outbound.services.HuntTripServices;

@RestController
@RequestMapping("api")
@CrossOrigin({ "*", "http://localhost:4200" })
public class HuntTripController {

	
	@Autowired
	private HuntTripServices huntServ;

	
	@GetMapping("outbound/ping")
	public String ping() {
		return "pong";
	}
	
	
	@GetMapping("outbound/hunttrips")
	public List<HuntTrip> indexAll(){
		return huntServ.findAllHuntTrips();
	}
	
	@GetMapping("outbound/hunttrips/{id}")
	public HuntTrip findById(@PathVariable("id")int huntId ) {
		return huntServ.findById(huntId);
		
	}
	
	@PostMapping("outbound/hunttrips")
	public HuntTrip createHunt(@RequestBody HuntTrip hunt, HttpServletResponse res) {
		HuntTrip newHunt  = huntServ.createHuntingTrip(hunt); 
		if(newHunt !=null) {
			res.setStatus(201);
		}
		
		 
		return newHunt;
	}
	
	@PutMapping("outbound/hunttrips/{id}")
	public HuntTrip updateHunt(@PathVariable("id") int huntId, 
			@RequestBody HuntTrip hunt,
			HttpServletResponse res) {
	
		
		return huntServ.updateHuntingTrip(hunt, huntId);
	}
	
	
	
	@DeleteMapping("outbound/hunttrips/{id}")
	public void deleteComment(HttpServletResponse res,@PathVariable("id")int huntId ) {
		
		boolean deleted= huntServ.deleteHuntTrip(huntId);
		try {
			if(deleted == true) {
				res.setStatus(200);
			}
		} catch (Exception e) {
			e.printStackTrace();
			res.setStatus(404);
		}
	}
	
//	@GetMapping("hunttrips/search/{species}")
//	public List<HuntTrip> getHuntsBySpecies(@PathVariable("species") String species) {
//		 
//		return huntServ.findBySpecies(species);
//	}
	
	
//	@GetMapping("outbound/hunttrips/search/{keyword}")
//	public List<HuntTrip> searchByKeyword(@PathVariable("keyword") String keyword){
//		
//		return huntServ.searchHuntByKeyword(keyword);
//	}
	
	
}
