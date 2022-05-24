package com.skilldistillery.outbound.entities.user;

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

class UserTest {

	private  static EntityManagerFactory emf;
	private EntityManager em;
	private User user;
	
	
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
		user = em.find(User.class, 1);
		
	}

	
	
	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	
	
	@Test
	@DisplayName("Testing entity User to database")
	void test_entity_user_to_database_connection() {
		
//		mysql> select * from user where id = 1;
//		+----+-----------+----------+------------+-----------+------------------+-------+----------------+----------------+---------+------------+
//		| id | username  | password | first_name | last_name | email            | role  | description    | phone          | enabled | address_id |
//		+----+-----------+----------+------------+-----------+------------------+-------+----------------+----------------+---------+------------+
//		|  1 | lpaladini | password | lucas      | paladini  | lpaladini@me.com | ADMIN | I like to hunt | (509) 993-8866 |       1 |          1 |
//		+----+-----------+----------+------------+-----------+------------------+-------+----------------+----------------+---------+------------+
//		1 row in set (0.00 sec)
		
		assertNotNull(user);
		assertNotNull(user.getId());
		assertEquals("lucas", user.getFirstName());
		assertEquals("lpaladini@me.com", user.getEmail());
		
	}
	
	@Test
	@DisplayName("Testing entity User relational mapping to hunttrip in database")
	void test_entity_user_relational_mapping_to_hunttrip_in_database_connection() {
		
//		mysql> select * from user join hunt_trip on hunt_trip.user_id = user.id where user.id =1;
//		+----+-----------+----------+------------+-----------+------------------+-------+----------------+----------------+---------+------------+----+-------------------------+------------+----------+-----------------------------------------------------+---------+---------+
//		| id | username  | password | first_name | last_name | email            | role  | description    | phone          | enabled | address_id | id | name                    | start_date | end_date | description                                         | success | user_id |
//		+----+-----------+----------+------------+-----------+------------------+-------+----------------+----------------+---------+------------+----+-------------------------+------------+----------+-----------------------------------------------------+---------+---------+
//		|  1 | lpaladini | password | lucas      | paladini  | lpaladini@me.com | ADMIN | I like to hunt | (509) 993-8866 |       1 |          1 |  1 | Fall Antelope Hunt      | NULL       | NULL     | Wyoming Hunt in the fall for antelope and mule deer |       1 |       1 |
//		|  1 | lpaladini | password | lucas      | paladini  | lpaladini@me.com | ADMIN | I like to hunt | (509) 993-8866 |       1 |          1 |  2 | Mule Deer Fall Hunt     | NULL       | NULL     | Hunting Mule Deer in Colorado                       |       0 |       1 |
//		|  1 | lpaladini | password | lucas      | paladini  | lpaladini@me.com | ADMIN | I like to hunt | (509) 993-8866 |       1 |          1 |  3 | Black Bear Spring Hunt  | NULL       | NULL     | Alaskan Black bear hunt in the spring               |       0 |       1 |
//		+----+-----------+----------+------------+-----------+------------------+-------+----------------+----------------+---------+------------+----+-------------------------+------------+----------+-----------------------------------------------------+---------+---------+
//		3 rows in set (0.00 sec)
		
		assertNotNull(user);
		assertNotNull(user.getId());
		assertTrue(user.getHunts().size()>0);
		 
	}
	
	@Test
	@DisplayName("Testing relational mapping from user to gear list")
	void test_relational_mapping_from_user_to_gearlist() {
//		mysql> select * from user join gear_list on user.id= gear_list.user_id where user.id =1;
//		+----+-------------+--------------------------------------------------------------+------------+-----------+------------------+-------+----------------+----------------+---------+----+--------------------+---------+-------------------+
//		| id | username    | password                                                     | first_name | last_name | email            | role  | description    | phone          | enabled | id | description        | user_id | gear_inventory_id |
//		+----+-------------+--------------------------------------------------------------+------------+-----------+------------------+-------+----------------+----------------+---------+----+--------------------+---------+-------------------+
//		|  1 | lpaladini90 | $2a$10$jUUiSZOm80cSZGNAQLHRLutd3C2sw3or3GOCUzSXzixHw6NC9Phv. | lucas      | paladini  | lpaladini@me.com | ADMIN | I like to hunt | (509) 993-8866 |       1 |  1 | Antelope Hunt List |       1 |                 1 |
//		+----+-------------+--------------------------------------------------------------+------------+-----------+------------------+-------+----------------+----------------+---------+----+--------------------+---------+-------------------+
//		1 rows in set (0.00 sec)
		
		assertNotNull(user);
		assertNotNull(user.getId());
		assertEquals("Mule Deer Hunt", user.getLists().get(1).getDescription());
		assertTrue(user.getLists().size()>0);
	}
	
	
	@Test
	@DisplayName("Testing relational mapping from user to gear list")
	void test_relational_mapping_from_user_to_inventory() {
		
//		mysql> selectmysql> select * from inventory join user on user.id = inventory.user_id where user.id =1;
//		+----+---------+----+-------------+--------------------------------------------------------------+------------+-----------+------------------+-------+----------------+----------------+---------+
//		| id | user_id | id | username    | password                                                     | first_name | last_name | email            | role  | description    | phone          | enabled |
//		+----+---------+----+-------------+--------------------------------------------------------------+------------+-----------+------------------+-------+----------------+----------------+---------+
//		|  1 |       1 |  1 | lpaladini90 | $2a$10$jUUiSZOm80cSZGNAQLHRLutd3C2sw3or3GOCUzSXzixHw6NC9Phv. | lucas      | paladini  | lpaladini@me.com | ADMIN | I like to hunt | (509) 993-8866 |       1 |
//		+----+---------+----+-------------+--------------------------------------------------------------+------------+-----------+------------------+-------+----------------+----------------+---------+
//		1 row in set (0.00 sec)(0.00 sec)
		
		assertNotNull(user);
		assertNotNull(user.getId());
	}
	
	
	
}
