package com.skilldistillery.outbound.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.outbound.entities.hunttrip.HuntTrip;

public interface HuntTripRepository extends JpaRepository<HuntTrip, Integer> {
 
	List<HuntTrip> findByUser_Username(String username);

	
	//List<HuntTrip> findByLikeNameDescriptionLikeOrSpeciesLike(@Param("k")String keyword1, @Param("k")String keyword2, @Param("k")String keyword3);
	
	
	
	
}
