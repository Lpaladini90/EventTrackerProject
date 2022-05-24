package com.skilldistillery.outbound.entities.inventory;

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

class ItemTest {

	private  static EntityManagerFactory emf;
	private EntityManager em;
	private Item item;
	
	
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
		item = em.find(Item.class, 1);
		
	}

	
	
	@AfterEach
	void tearDown() throws Exception {
		em.close();
		item = null;
	}

	
	
	@Test
	@DisplayName("Testing entity Item to database")
	void test_entity_item_to_database_connection() {
		
//		mysql> select * from item where id=1;
//		+----+--------+------------+----------------------------------------------------------------------------------+--------+--------------+
//		| id | brand  | model_name | description                                                                      | weight | inventory_id |
//		+----+--------+------------+----------------------------------------------------------------------------------+--------+--------------+
//		|  1 | Kifaru | Fulcrum    | Functional, versatile and durable are just a few words that describe the Fulcrum |    3.4 |            1 |
//		+----+--------+------------+----------------------------------------------------------------------------------+--------+--------------+
//		1 row in set (0.01 sec)

		
		assertNotNull(item);
		assertNotNull(item.getId());
		assertEquals("Kifaru", item.getBrand());
		
	}
}
