package com.skilldistillery.outbound.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.outbound.entities.hunttrip.HuntTrip;
import com.skilldistillery.outbound.entities.user.User;
import com.skilldistillery.outbound.repository.HuntTripRepository;
import com.skilldistillery.outbound.repository.UserRepository;


@Service
public class HuntTripServicesImpl implements HuntTripServices {

	@Autowired
	private HuntTripRepository huntRepo;

	@Autowired
	private UserRepository userRepo;
	
	@Override
	public List<HuntTrip> findAllHuntTrips(String username) {
		return huntRepo.findByUser_Username(username);
	}


	@Override
	public HuntTrip findById(String username,int huntId) {
		Optional<HuntTrip> huntOp = huntRepo.findById(huntId);
		User user = userRepo.findByUsername(username);
		HuntTrip hunt = null;
		if(user !=null) {
		if(huntOp.isPresent()) {
			hunt = huntOp.get();
			hunt.setUser(user);
		}
		
		}
		return hunt;
	}


	@Override 
	public HuntTrip createHuntingTrip(String username,HuntTrip hunt) {
		User user = userRepo.findByUsername(username);
		if(user!= null) {
			hunt.setUser(user);
		}
		return huntRepo.saveAndFlush(hunt);
	}

 

	@Override
	public boolean deleteHuntTrip(String username, int huntId) {
		boolean deleted = false;
		
		Optional<HuntTrip> huntOp = huntRepo.findById(huntId);
		
		if(huntOp.isPresent() && huntOp.get().getUser().getUsername().equals(username)) {
			huntRepo.deleteById(huntId);
			deleted=true;
			
		}
	return 	deleted;
	} 



	@Override
	public HuntTrip updateHuntingTrip(String username, HuntTrip hunt, int huntId) {
		hunt.setId(huntId);
		User user = userRepo.findByUsername(username);
		hunt.setUser(user);
	
		return huntRepo.save(hunt); 
	}
 

	
	
	
	
	
	
}
