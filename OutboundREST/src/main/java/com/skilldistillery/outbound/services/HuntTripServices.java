package com.skilldistillery.outbound.services;

import java.util.List;

import com.skilldistillery.outbound.entities.hunttrip.HuntTrip;
 
public interface HuntTripServices {


	public List<HuntTrip> findAllHuntTrips(String username);
	
	public HuntTrip findById(String username,int huntId);
	
	public HuntTrip createHuntingTrip(String username,HuntTrip hunt);
	
	public HuntTrip updateHuntingTrip(String username,HuntTrip hunt, int huntId);
	
	public boolean deleteHuntTrip(String username, int huntId);
	
	
}
