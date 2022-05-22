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
		
		
//		@Test
//		@DisplayName("Testing entity HuntTrip mapping to user in database")
//		void test_entity_hunttrip_mapping_to_user_in_database_connection() {
////			mysql> select * from hunt_trip join user on user.id = hunt_trip.user_id where user.id = 1;
////			+----+-------------------------+------------+----------+-----------------------------------------------------+---------+---------+----+-----------+----------+------------+-----------+------------------+-------+----------------+----------------+---------+------------+
////			| id | name                    | start_date | end_date | description                                         | success | user_id | id | username  | password | first_name | last_name | email            | role  | description    | phone          | enabled | address_id |
////			+----+-------------------------+------------+----------+-----------------------------------------------------+---------+---------+----+-----------+----------+------------+-----------+------------------+-------+----------------+----------------+---------+------------+
////			|  1 | Fall Antelope Hunt      | NULL       | NULL     | Wyoming Hunt in the fall for antelope and mule deer |       1 |       1 |  1 | lpaladini | password | lucas      | paladini  | lpaladini@me.com | ADMIN | I like to hunt | (509) 993-8866 |    NULL |          1 |
////			|  2 | Mule Deer Fall Hunt     | NULL       | NULL     | Hunting Mule Deer in Colorado                       |       0 |       1 |  1 | lpaladini | password | lucas      | paladini  | lpaladini@me.com | ADMIN | I like to hunt | (509) 993-8866 |    NULL |          1 |
////			|  3 | Black Bear Spring Hunt  | NULL       | NULL     | Alaskan Black bear hunt in the spring               |       0 |       1 |  1 | lpaladini | password | lucas      | paladini  | lpaladini@me.com | ADMIN | I like to hunt | (509) 993-8866 |    NULL |          1 |
////			+----+-------------------------+------------+----------+-----------------------------------------------------+---------+---------+----+-----------+----------+------------+-----------+------------------+-------+----------------+----------------+---------+------------+
////			3 rows in set (0.00 sec)
////
////			mysql> 
//			assertNotNull(hunt);
//			assertEquals(1, hunt.getUser().getId());
//			
//		}

		
}
	
