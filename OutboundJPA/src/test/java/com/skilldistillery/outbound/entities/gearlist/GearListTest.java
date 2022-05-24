package com.skilldistillery.outbound.entities.gearlist;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class GearListTest {

	private  static EntityManagerFactory emf;
	private EntityManager em;
	private GearList gl;
	
	
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
		gl = em.find(GearList.class, 1);
		
	}

	
	
	@AfterEach
	void tearDown() throws Exception {
		em.close();
		gl = null;
	}

	
	
	@Test
	@DisplayName("Testing entity GearList to database")
	void test_entity_gearlist_to_database_connection() {
		
//		mysql> select * from gear_list where id = 1;
//		+----+--------------------+---------+-------------------+
//		| id | description        | user_id | gear_inventory_id |
//		+----+--------------------+---------+-------------------+
//		|  1 | Antelope Hunt List |       1 |                 1 |
//		+----+--------------------+---------+-------------------+
//		1 row in set (0.00 sec)
		
		assertNotNull(gl);
		assertNotNull(gl.getId());
		assertEquals("Antelope Hunt List", gl.getDescription());
		
	}
	
	
	@Test
	@DisplayName("Testing relational mapping from gearlist to user")
	void test_relational_mapping_between_gear_list_and_user() {
		
//		mysql> select * from gear_list join user on user.id= gear_list.user_id where user.id =1;
//		+----+--------------------+---------+-------------------+----+-------------+--------------------------------------------------------------+------------+-----------+------------------+-------+----------------+----------------+---------+
//		| id | description        | user_id | gear_inventory_id | id | username    | password                                                     | first_name | last_name | email            | role  | description    | phone          | enabled |
//		+----+--------------------+---------+-------------------+----+-------------+--------------------------------------------------------------+------------+-----------+------------------+-------+----------------+----------------+---------+
//		|  1 | Antelope Hunt List |       1 |                 1 |  1 | lpaladini90 | $2a$10$jUUiSZOm80cSZGNAQLHRLutd3C2sw3or3GOCUzSXzixHw6NC9Phv. | lucas      | paladini  | lpaladini@me.com | ADMIN | I like to hunt | (509) 993-8866 |       1 |
//		|  2 | Mule Deer Hunt     |       1 |                 1 |  1 | lpaladini90 | $2a$10$jUUiSZOm80cSZGNAQLHRLutd3C2sw3or3GOCUzSXzixHw6NC9Phv. | lucas      | paladini  | lpaladini@me.com | ADMIN | I like to hunt | (509) 993-8866 |       1 |
//		+----+--------------------+---------+-------------------+----+-------------+--------------------------------------------------------------+------------+-----------+------------------+-------+----------------+----------------+---------+
//		2 rows in set (0.01 sec)
		
		
		assertNotNull(gl);
		assertNotNull(gl.getId());
		assertTrue(gl.getUser().getLists().size()>0);
	}
	
	
}
