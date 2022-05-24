package com.skilldistillery.outbound.entities.user;


import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.skilldistillery.outbound.entities.gearlist.GearList;
import com.skilldistillery.outbound.entities.hunttrip.HuntTrip;
import com.skilldistillery.outbound.entities.inventory.Inventory;

@Entity
public class User {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;
	
	private String username;
	
	private String password;
	
	private String email;
	
	private String role;
	
	private boolean enabled;
	
	
	@OneToOne(mappedBy="user")
	private Inventory inventory;
	
	
	@OneToMany(mappedBy="user")
	private List<GearList> lists;
	
	@JsonIgnore
	@OneToMany(mappedBy="user")
	private List<HuntTrip> hunts;

	
	
	
	public User() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	
	
	public List<HuntTrip> getHunts() {
		return hunts;
	}

	public void setHunts(List<HuntTrip> hunts) {
		this.hunts = hunts;
	}

	
	
	
	public List<GearList> getLists() {
		return lists;
	}

	public void setLists(List<GearList> lists) {
		this.lists = lists;
	}

	
	
	public Inventory getInventory() {
		return inventory;
	}

	public void setInventory(Inventory inventory) {
		this.inventory = inventory;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", username=" + username
				+ ", password=" + password + ", email=" + email + ", role=" + role + ", enabled=" + enabled
				+ ", inventory=" + inventory + ", lists=" + lists + ", hunts=" + hunts + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(email, enabled, firstName, hunts, id, inventory, lastName, lists, password, role, username);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		return Objects.equals(email, other.email) && enabled == other.enabled
				&& Objects.equals(firstName, other.firstName) && Objects.equals(hunts, other.hunts)
				&& Objects.equals(id, other.id) && Objects.equals(inventory, other.inventory)
				&& Objects.equals(lastName, other.lastName) && Objects.equals(lists, other.lists)
				&& Objects.equals(password, other.password) && Objects.equals(role, other.role)
				&& Objects.equals(username, other.username);
	}
	
	
	
	
	
	
	
	
	
}
