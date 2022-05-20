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

class WeaponTest {

	private  static EntityManagerFactory emf;
	private EntityManager em;
	private Weapon wep;
	
	
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
		wep = em.find(Weapon.class, 1);
		
		
	}

	
	
	@AfterEach
	void tearDown() throws Exception {
		em.close();
		wep = null;
	}
	
	@Test
	@DisplayName("Testing connecting from weapon to the database")
	void test_connecting_from_weapon_to_db() {

//		mysql> select * from weapon where id =1;
//		+----+----------+--------+--------------+--------+--------------+
//		| id | brand    | model  | description  | weight | gear_list_id |
//		+----+----------+--------+--------------+--------+--------------+
//		|  1 | Matthews | Vertix | Compound Bow |   4.67 |            1 |
//		+----+----------+--------+--------------+--------+--------------+
//		1 row in set (0.00 sec)


		 
		assertNotNull(wep);
		assertNotNull(wep.getId());
		assertEquals("Matthews", wep.getBrand());
		
	}

}
