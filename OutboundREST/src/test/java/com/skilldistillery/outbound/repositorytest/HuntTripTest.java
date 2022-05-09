package com.skilldistillery.outbound.repositorytest;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.skilldistillery.outbound.entities.HuntTrip;
import com.skilldistillery.outbound.repository.HuntTripRepository;

class HuntTripTest {

	@Autowired
	private HuntTripRepository huntRepo;
	
	@Test
	@DisplayName("Find Hunt by species")
	void test_find_hunt_by_species() {
		List<HuntTrip> hunts = huntRepo.findBySpecies("elk");  
		
		assertNotNull(hunts);
		assertTrue(hunts.size()>0);
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
