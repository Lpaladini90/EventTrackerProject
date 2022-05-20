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

class ClothingLayerTest {

	private  static EntityManagerFactory emf;
	private EntityManager em;
	private ClothingLayer layer;
	
	
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
		layer = em.find(ClothingLayer.class, 1);
		
	}

	
	
	@AfterEach
	void tearDown() throws Exception {
		em.close();
		layer = null;
	}
	
	@Test
	@DisplayName("Testing connecting from clothing category to the database")
	void test_connecting_from_clothing_category_to_db() {
//		mysql> select * from clothing_layer where id=1;
//		+----+-------------+--------------------+
//		| id | type        | description        |
//		+----+-------------+--------------------+
//		|  1 | Under Layer | Under layer packed |
//		+----+-------------+--------------------+
//		1 row in set (0.00 sec)
		
		assertNotNull(layer);
		assertNotNull(layer.getId());
		assertEquals("Under Layer", layer.getType());
	}

}
