package com.zky.vo;

public class CityVO {
	
	private String id;
	private String name;
	private String countrycode;
	private String district;
	private String population;
	private String flag;
	public String getId() {
		return id;
	}
	public void setId(String id) {
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
	public String getPopulation() {
		return population;
	}
	public void setPopulation(String population) {
		this.population = population;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	@Override
	public String toString() {
		return "CityVO [id=" + id + ", name=" + name + ", countrycode=" + countrycode + ", district=" + district
				+ ", population=" + population + ", flag=" + flag + "]";
	}

	
	
}
