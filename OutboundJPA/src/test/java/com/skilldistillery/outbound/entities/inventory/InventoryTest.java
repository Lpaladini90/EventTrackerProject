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

class InventoryTest {

	private  static EntityManagerFactory emf;
	private EntityManager em;
	private Inventory inv;
	
	
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
		inv = em.find(Inventory.class, 1);
		
	}

	
	
	@AfterEach
	void tearDown() throws Exception {
		em.close();
		inv = null;
	}

	
	
	@Test
	@DisplayName("Testing entity Inventory to database")
	void test_entity_inventory_to_database_connection() {
		
//		mysql> select * from inventory where id = 1;
//		+----+---------+
//		| id | user_id |
//		+----+---------+
//		|  1 |       1 |
//		+----+---------+
//		1 row in set (0.00 sec)
		
		assertNotNull(inv);
		assertNotNull(inv.getId());
		assertEquals(1, inv.getId());
		
	}


}
