package com.skilldistillery.outbound.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.outbound.entities.HuntTrip;

@Service
@Transactional
public class HuntTripDaoImpl implements HuntTripDAO {

	@PersistenceContext
	private EntityManager em;

	// jpql need to find all
	@Override
	public List<HuntTrip> findAll() {
		String jpql = "Select h From HuntTrip h ";
		return em.createQuery(jpql, HuntTrip.class).getResultList();
	}

	@Override
	public HuntTrip findHuntTripById(int huntId) {

		return em.find(HuntTrip.class, huntId);
	}

	@Override
	public HuntTrip createHuntTrip(HuntTrip hunt) {
		em.persist(hunt);
		return hunt;
	}

	@Override
	public HuntTrip updateHuntTrip(HuntTrip hunt, int huntId) {
		HuntTrip updatedHunt = em.find(HuntTrip.class, huntId);
		if (updatedHunt != null) {
			updatedHunt.setSpecies(hunt.getSpecies());
			updatedHunt.setDescription(hunt.getDescription());
			updatedHunt.setEndDate(hunt.getEndDate());
			updatedHunt.setSex(hunt.getSex());
			updatedHunt.setStartDate(hunt.getStartDate());
			updatedHunt.setType(hunt.getType());
			em.flush();

		}

		return updatedHunt;
	}

	@Override
	public boolean deleteHuntTrip(int huntId) {
		boolean deletedHunt = false;
		HuntTrip hunt = em.find(HuntTrip.class, huntId);
		
		if(hunt != null) {
			em.remove(hunt);
			deletedHunt = !em.contains(hunt);
		}
		
		
		return deletedHunt;
	}

}
