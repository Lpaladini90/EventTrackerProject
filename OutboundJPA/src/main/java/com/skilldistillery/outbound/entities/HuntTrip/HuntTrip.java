package com.skilldistillery.outbound.entities.hunttrip;


import java.time.LocalDate;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="hunt_trip")
public class HuntTrip {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String name;
	
	private String description;
	
	@Column(name="start_date")
	private LocalDate startDate;
	
	@Column(name="end_date")
	private LocalDate endDate;
	
	private boolean success;

	public HuntTrip() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDate getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}

	public LocalDate getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	@Override
	public String toString() {
		return "HuntTrip [id=" + id + ", name=" + name + ", description=" + description + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", success=" + success + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(description, endDate, id, name, startDate, success);
	}

	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		HuntTrip other = (HuntTrip) obj;
		return Objects.equals(description, other.description) && Objects.equals(endDate, other.endDate)
				&& Objects.equals(id, other.id) && Objects.equals(name, other.name)
				&& Objects.equals(startDate, other.startDate) && success == other.success;
	}

	
	
}