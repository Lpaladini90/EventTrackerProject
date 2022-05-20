package com.skilldistillery.outbound.entities.gearlist;

import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Weapon {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String brand;
	
	private String model;
	
	private String description;
	
	private double weight;

	public Weapon() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	@Override
	public String toString() {
		return "Weapon [id=" + id + ", brand=" + brand + ", model=" + model + ", description=" + description
				+ ", weight=" + weight + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(brand, description, id, model, weight);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Weapon other = (Weapon) obj;
		return Objects.equals(brand, other.brand) && Objects.equals(description, other.description)
				&& Objects.equals(id, other.id) && Objects.equals(model, other.model)
				&& Double.doubleToLongBits(weight) == Double.doubleToLongBits(other.weight);
	}
	
	
	
	
}
