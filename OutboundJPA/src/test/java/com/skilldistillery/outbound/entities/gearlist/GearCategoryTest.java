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

class GearCategoryTest {

	private  static EntityManagerFactory emf;
	private EntityManager em;
	private GearCategory cat;
	
	
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
		cat = em.find(GearCategory.class, 1);
		
	}

	
	
	@AfterEach
	void tearDown() throws Exception {
		em.close();
		cat = null;
	}
	
	@Test
	@DisplayName("Testing connecting from gear category category to the database")
	void test_connecting_from_gear_category_to_db() {

//		mysql> select * from gear_category where id =1;
//		+----+-----------+
//		| id | gear_type |
//		+----+-----------+
//		|  1 | Backpack  |
//		+----+-----------+
//		1 row in set (0.00 sec)

		
		assertNotNull(cat);
		assertNotNull(cat.getId());
		assertEquals("Backpack", cat.getGearType());
	}
}
