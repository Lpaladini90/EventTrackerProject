package com.skilldistillery.outbound.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.outbound.entities.HuntTrip;
import com.skilldistillery.outbound.repository.HuntTripRepository;


@Service
public class HuntTripServicesImpl implements HuntTripServices {

	@Autowired
	private HuntTripRepository huntRepo;

	
	@Override
	public List<HuntTrip> findAllHuntTrips() {
		return huntRepo.findAll();
	}


	@Override
	public HuntTrip findById(int huntId) {
		Optional<HuntTrip> huntOp = huntRepo.findById(huntId);
		HuntTrip hunt = null;
		if(huntOp.isPresent()) {
			hunt = huntOp.get();
		}
		
		return hunt;
	}


	@Override 
	public HuntTrip createHuntingTrip(HuntTrip hunt) {
		
		return huntRepo.saveAndFlush(hunt);
	}

 

	@Override
	public boolean deleteHuntTrip(int huntId) {
		boolean deleted = false;
		Optional<HuntTrip> huntOp = huntRepo.findById(huntId);
		if(huntOp.isPresent()) {
			huntRepo.deleteById(huntId);
			deleted=true;
			
		}
	return 	deleted;
	} 



	@Override
	public HuntTrip updateHuntingTrip(HuntTrip hunt, int huntId) {
		hunt.setId(huntId);
		if(huntRepo.existsById(huntId)) {
			return huntRepo.save(hunt);
		}
	
		return null; 
	}


//	@Override
//	public List<HuntTrip> searchHuntByKeyword(String keyword) {
//		
//		keyword = ""
//		
//		return null;
//	}


//	@Override
//	public List<HuntTrip> findBySpecies(String species) {
//		
//		return huntRepo.findBySpecies(species); 
//	}

	
	
	
	
	
	
}
