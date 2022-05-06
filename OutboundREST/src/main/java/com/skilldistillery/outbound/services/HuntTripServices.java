package com.skilldistillery.outbound.services;

import java.util.List;

import com.skilldistillery.outbound.entities.HuntTrip;
 
public interface HuntTripServices {

	List<HuntTrip> findAllHuntTrips();

	
	HuntTrip findById(int huntId);
	
	HuntTrip createHuntingTrip(HuntTrip hunt);
	
	boolean deleteHuntTrip(int huntId);
	
	HuntTrip updateHuntingTrip(HuntTrip hunt, int huntId);
	
	
	
	
	
}
