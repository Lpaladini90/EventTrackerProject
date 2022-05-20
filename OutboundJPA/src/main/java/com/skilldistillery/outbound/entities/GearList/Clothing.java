package com.skilldistillery.outbound.entities.gearlist;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Clothing {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String brand;
	
	private String model;
	
	private String description;
	
	private double weight;
	
	private int quantity;
	
	@Column(name="items_packed")
	private boolean itemsPacked;
	
	@Column(name="items_worn")
	private boolean itemsWorn;

	public Clothing() {
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public boolean isItemsPacked() {
		return itemsPacked;
	}

	public void setItemsPacked(boolean itemsPacked) {
		this.itemsPacked = itemsPacked;
	}

	public boolean isItemsWorn() {
		return itemsWorn;
	}

	public void setItemsWorn(boolean itemsWorn) {
		this.itemsWorn = itemsWorn;
	}

	@Override
	public String toString() {
		return "Clothing [id=" + id + ", brand=" + brand + ", model=" + model + ", description=" + description
				+ ", weight=" + weight + ", quantity=" + quantity + ", itemsPacked=" + itemsPacked + ", itemsWorn="
				+ itemsWorn + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(brand, description, id, itemsPacked, itemsWorn, model, quantity, weight);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Clothing other = (Clothing) obj;
		return Objects.equals(brand, other.brand) && Objects.equals(description, other.description)
				&& Objects.equals(id, other.id) && itemsPacked == other.itemsPacked && itemsWorn == other.itemsWorn
				&& Objects.equals(model, other.model) && quantity == other.quantity
				&& Double.doubleToLongBits(weight) == Double.doubleToLongBits(other.weight);
	}
	
	
	
}
