package com.skilldistillery.outbound.data;

import java.util.List;

import com.skilldistillery.outbound.entities.hunttrip.HuntTrip;

public interface HuntTripDAO {

	List<HuntTrip> findAll();
	
	HuntTrip findHuntTripById(int huntId);
	
	HuntTrip createHuntTrip(HuntTrip hunt);
	
	HuntTrip updateHuntTrip(HuntTrip hunt, int huntId);
	
	boolean deleteHuntTrip(int huntId);
	
	
	
	
}
