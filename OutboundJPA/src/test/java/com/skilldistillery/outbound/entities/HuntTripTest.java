package com.skilldistillery.outbound.entities;



import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class HuntTripTest {


		private  static EntityManagerFactory emf;
		private EntityManager em;
		private HuntTrip hunt;
		
		
		@BeforeAll
		static void setUpBeforeClass() throws Exception {
			emf = Persistence.createEntityManagerFactory("OutboundJPA");
		}

		@AfterAll
		static void tearDownAfterClass() throws Exception {
			emf.close();
		}

		
		
		@BeforeEach
		void setUp() throws Exception {
			em = emf.createEntityManager();
			hunt = em.find(HuntTrip.class, 1);
			
		}

		
		
		@AfterEach
		void tearDown() throws Exception {
			em.close();
			hunt = null;
		}

		
		
		@Test
		@DisplayName("Testing entity HuntTrip to database")
		void test_entity_hunttrip_to_database_connection() {
			assertNotNull(hunt);
			assertEquals("elk", hunt.getSpecies());
			
		}
		

		
}
	
