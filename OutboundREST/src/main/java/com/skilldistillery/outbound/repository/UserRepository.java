package com.skilldistillery.outbound.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.outbound.entities.user.User;



public interface UserRepository extends JpaRepository<User, Integer>{

	User findByUsername(String username);
	
	
}
