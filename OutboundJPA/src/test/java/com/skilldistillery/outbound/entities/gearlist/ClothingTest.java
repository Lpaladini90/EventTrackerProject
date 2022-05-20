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

class ClothingTest {

	private  static EntityManagerFactory emf;
	private EntityManager em;
	private Clothing clothing;
	
	
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
		clothing = em.find(Clothing.class, 1);
		
	}

	
	
	@AfterEach
	void tearDown() throws Exception {
		em.close();
		clothing = null;
	}
	
	@Test
	@DisplayName("Testing connecting from clothing category to the database")
	void test_connecting_from_clothing_category_to_db() {

//mysql> select * from clothing where id=1;
//+----+-----------+----------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+--------------+------------+--------------+
//| id | brand     | model                | description                                                                                                                                                                                          | weight | items_packed | items_worn | gear_list_id |
//+----+-----------+----------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+--------------+------------+--------------+
//|  1 | FirstLite | Corrugate Guide Pant | These nylon pants are constructed around a simple design concept that allows the hunter uninhibited freedom of movement while providing easy access to storage by way of our 3D double cargo pockets |    0.5 |            0 |          1 |            1 |
//+----+-----------+----------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+--------------+------------+--------------+
//1 row in set (0.00 sec)
		
		assertNotNull(clothing);
		assertNotNull(clothing.getId());
		assertEquals("Corrugate Guide Pant", clothing.getModel());
	}

}
