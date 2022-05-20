package com.skilldistillery.outbound.entities.gearlist;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class GearListTest {

	private  static EntityManagerFactory emf;
	private EntityManager em;
	private GearList list;
	
	
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
		list = em.find(GearList.class, 1);
		
	}

	
	
	@AfterEach
	void tearDown() throws Exception {
		em.close();
		list = null;
	}
	
	@Test
	@DisplayName("Testing connecting from gear list to the database")
	void test_connecting_from_gear_list_to_db() {

//		mysql> select * from gear_list where id = 1;
//		+----+-------------------------+
//		| id | description             |
//		+----+-------------------------+ 
//		|  1 | Antelope Hunt Gear List |
//		+----+-------------------------+
//		1 row in set (0.00 sec)



		 
		assertNotNull(list);
		assertNotNull(list.getId());
		assertEquals("Antelope Hunt Gear List", list.getDescription());
		
	}

}
