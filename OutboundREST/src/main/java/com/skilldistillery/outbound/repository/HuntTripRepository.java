package com.skilldistillery.outbound.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.outbound.entities.hunttrip.HuntTrip;

public interface HuntTripRepository extends JpaRepository<HuntTrip, Integer> {
 

	//List<HuntTrip> findByLikeNameDescriptionLikeOrSpeciesLike(@Param("k")String keyword1, @Param("k")String keyword2, @Param("k")String keyword3);
	
	
	
	
}
