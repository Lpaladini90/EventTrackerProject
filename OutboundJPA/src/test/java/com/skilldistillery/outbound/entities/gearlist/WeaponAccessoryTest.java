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

class WeaponAccessoryTest {

	private  static EntityManagerFactory emf;
	private EntityManager em;
	private WeaponAccessory acc;
	
	
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
		acc = em.find(WeaponAccessory.class, 1);
		
		
	}

	
	
	@AfterEach
	void tearDown() throws Exception {
		em.close();
		acc = null;
	}
	
	@Test
	@DisplayName("Testing connecting from weapon accessory to the database")
	void test_connecting_from_weapon_accessory_to_db() {

//		mysql> select * from weapon_accessories where id =1;
//		+----+----------+----------+-----------------+--------+
//		| id | brand    | model    | description     | weight |
//		+----+----------+----------+-----------------+--------+
//		|  1 | Spot Hog | Wiseguy  | Archery release |  0.125 |
//		+----+----------+----------+-----------------+--------+
//		1 row in set (0.00 sec)



		 
		assertNotNull(acc);
		assertNotNull(acc.getId());
		assertEquals("Spot Hog", acc.getBrand());
		
	}

}
