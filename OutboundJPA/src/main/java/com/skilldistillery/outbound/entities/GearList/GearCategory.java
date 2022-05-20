package com.skilldistillery.outbound.entities.gearlist;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class GearCategory {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name="gear_category")
	private String gearType;

	public GearCategory() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getGearType() {
		return gearType;
	}

	public void setGearType(String gearType) {
		this.gearType = gearType;
	}

	@Override
	public String toString() {
		return "GearCategory [id=" + id + ", gearType=" + gearType + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(gearType, id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		GearCategory other = (GearCategory) obj;
		return Objects.equals(gearType, other.gearType) && Objects.equals(id, other.id);
	}
	
	
	
}
