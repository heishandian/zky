package com.zky.model;

public class City {
	
	Integer id;
	String name;
	String countrycode;
	String district;
	Integer population;

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

	public String getCountrycode() {
		return countrycode;
	}

	public void setCountrycode(String countrycode) {
		this.countrycode = countrycode;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public Integer getPopulation() {
		return population;
	}

	public void setPopulation(Integer population) {
		this.population = population;
	}

	public City(Integer id, String name, String countrycode, String district, Integer population) {
		this.id = id;
		this.name = name;
		this.countrycode = countrycode;
		this.district = district;
		this.population = population;
	}

	public City() {
	}

	@Override
	public String toString() {
		return "City [id=" + id + ", name=" + name + ", countrycode=" + countrycode + ", district=" + district
				+ ", population=" + population + "]";
	}

	
	
}
