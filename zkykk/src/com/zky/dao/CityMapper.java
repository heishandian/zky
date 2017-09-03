package com.zky.dao;

import java.util.List;

import com.zky.commons.MaxAndMin;
import com.zky.model.City;
import com.zky.util.SearchCondition;

public interface CityMapper {
	public int getNumOfPopByInterval(MaxAndMin startAndEnd);
	
	public MaxAndMin getMaxAndMinPopulation();
	
	public int bachDeleteCities(List<City> cities);
	
	public int count(SearchCondition condition);
	
	public List<City> selectCitiesByPaging(SearchCondition condition);
	
	public List<City> getAllCities();
	
	public int save(City city);

	public int batchSave(List<City> cities);
	
	public int update(City city);
	
	public int delete(int cityId);
	
	public City selectByID(int id);
	
}
