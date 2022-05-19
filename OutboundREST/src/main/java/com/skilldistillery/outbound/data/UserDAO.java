package com.skilldistillery.outbound.data;

import java.util.List;

import com.skilldistillery.outbound.entities.User.User;

public interface UserDAO {

	List<User> findAll();
	
	User findUserById(int id);
	
}
