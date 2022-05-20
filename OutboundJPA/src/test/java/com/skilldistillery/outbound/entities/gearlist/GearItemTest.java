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

class GearItemTest {

	private  static EntityManagerFactory emf;
	private EntityManager em;
	private GearItem item;
	
	
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
		item = em.find(GearItem.class, 1);
		
	}

	
	
	@AfterEach
	void tearDown() throws Exception {
		em.close();
		item = null;
	}
	
	@Test
	@DisplayName("Testing connecting from gear item to the database")
	void test_connecting_from_gear_item_to_db() {

//		mysql> select * from gear_item where id = 1;
//		+----+--------+------------+----------------------------------------------------------------------------------+--------+----------+
//		| id | brand  | model_name | description                                                                      | weight | quantity |
//		+----+--------+------------+----------------------------------------------------------------------------------+--------+----------+
//		|  1 | Kifaru | Fulcrum    | Functional, versatile and durable are just a few words that describe the Fulcrum |    3.4 |        1 |
//		+----+--------+------------+----------------------------------------------------------------------------------+--------+----------+
//		1 row in set (0.01 sec)



		
		assertNotNull(item);
		assertNotNull(item.getId());
		assertEquals("Kifaru", item.getBrand());
	}

}
