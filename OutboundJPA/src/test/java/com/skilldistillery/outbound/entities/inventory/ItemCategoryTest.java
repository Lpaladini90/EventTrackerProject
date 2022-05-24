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

class ItemCategoryTest {

	private  static EntityManagerFactory emf;
	private EntityManager em;
	private ItemCategory cat;
	
	
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
		cat = em.find(ItemCategory.class, 1);
		
	}

	
	
	@AfterEach
	void tearDown() throws Exception {
		em.close();
		cat = null;
	}

	
	
	@Test
	@DisplayName("Testing entity Inventory to database")
	void test_entity_inventory_to_database_connection() {
		
//		mysql> select * from item_category where id = 1;
//		+----+-----------+
//		| id | gear_type |
//		+----+-----------+
//		|  1 | Backpack  |
//		+----+-----------+
//		1 row in set (0.01 sec)
		
		assertNotNull(cat);
		assertNotNull(cat.getId());
		assertEquals("Backpack", cat.getGearType());
		
	}

}
