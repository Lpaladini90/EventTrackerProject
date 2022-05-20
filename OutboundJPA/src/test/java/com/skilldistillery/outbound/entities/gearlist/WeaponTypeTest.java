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

class WeaponTypeTest {
	private  static EntityManagerFactory emf;
	private EntityManager em;
	private WeaponType type;
	
	
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
		type = em.find(WeaponType.class, 1);
		
		
	}

	
	
	@AfterEach
	void tearDown() throws Exception {
		em.close();
		type = null;
	}
	
	@Test
	@DisplayName("Testing connecting from weapon type to the database")
	void test_connecting_from_weapon_type_to_db() {

//		mysql> select * from weapon_type where id=1;
//		+----+-------+-------------+
//		| id | name  | description |
//		+----+-------+-------------+
//		|  1 | Rifle | rifle       |
//		+----+-------+-------------+
//		1 row in set (0.00 sec)

		 
		assertNotNull(type);
		assertNotNull(type.getId());
		assertEquals("Rifle", type.getName());
		
	}

}
