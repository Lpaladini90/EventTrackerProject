package com.skilldistillery.outbound.entities.hunttrip;



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
//			mysql> select * from hunt_trip where id =1;
//			+----+--------------------+------------+----------+-----------------------------------------------------+---------+
//			| id | name               | start_date | end_date | description                                         | success |
//			+----+--------------------+------------+----------+-----------------------------------------------------+---------+
//			|  1 | Fall Antelope Hunt | NULL       | NULL     | Wyoming Hunt in the fall for antelope and mule deer |       1 |
//			+----+--------------------+------------+----------+-----------------------------------------------------+---------+
//			1 row in set (0.01 sec)
			assertNotNull(hunt);
			assertEquals("Fall Antelope Hunt", hunt.getName());
			
		}
		

		
}
	
