package com.zky.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zky.commons.MaxAndMin;
import com.zky.dao.CityMapper;
import com.zky.model.City;
import com.zky.service.ICityService;
import com.zky.util.SearchCondition;

@Service("cityService")
public class CityServiceImpl implements ICityService{
	
	@Resource
	private CityMapper cityDao;
	
	@Override
	public City selectByID(int id) {
		return cityDao.selectByID(id);
	}

	@Override
	public int save(City city) {
		return cityDao.save(city);
	}

	@Override
	public int batchSave(List<City> cities) {
		return cityDao.batchSave(cities);
	}

	@Override
	public int update(City city) {
		return cityDao.update(city);
	}

	@Override
	public int delete(int cityId) {
		return cityDao.delete(cityId);
	}

	@Override
	public List<City> selectCitiesByPaging(SearchCondition condition) {
		return cityDao.selectCitiesByPaging(condition);
	}

	@Override
	public List<City> getAllCities() {
		return cityDao.getAllCities();
	}

	@Override
	public int count(SearchCondition condition) {
		return cityDao.count(condition);
	}

	@Override
	public int bachDeleteCities(List<City> cities) {
		return cityDao.bachDeleteCities(cities);
	}

	@Override
	public MaxAndMin getMaxAndMinPopulation() {
		return cityDao.getMaxAndMinPopulation();
	}

	@Override
	public int getNumOfPopByInterval(MaxAndMin startAndEnd) {
		return cityDao.getNumOfPopByInterval(startAndEnd);
	}

	

}
