package com.zky.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.zky.model.City;
import com.zky.service.ICityService;
import com.zky.util.ExcelView;
import com.zky.util.JsonMessage;
import com.zky.util.SearchCondition;
import com.zky.util.SysPagingUtil;
import com.zky.vo.CityVO;

@Controller
@RequestMapping("/city")       
public class CityController {
	@Autowired
	private ICityService iCityService;
	
	@RequestMapping("/gotohomepage.do")
	public String gotoHomePage(){
		return "home";
	}
	
	@RequestMapping("/gotoeasyuipage.do")
	public String gotoEasyUIPage(){
		return "easyui";
	}
	
	@RequestMapping(value={"/getcitiesbypaging.do"})
	@ResponseBody
	public Object getCitiesByPaging( HttpServletRequest request, HttpServletResponse response) throws IOException{
		String type = String.valueOf(request.getParameter("type"));
		String pageSize = String.valueOf(request.getParameter("rows"));
		String pageNum = String.valueOf(request.getParameter("page"));
		String name = ("".equals(request.getParameter("name") ))? null :(String.valueOf(request.getParameter("name")));
		String countycode = ("".equals(request.getParameter("countrycode")))? null :(String.valueOf(request.getParameter("countrycode")));
		SearchCondition searchCondition = new  SearchCondition(Integer.parseInt(pageSize)*(Integer.parseInt(pageNum)-1),
				Integer.parseInt(pageSize), name, countycode) ;
		List<City> cities = iCityService.selectCitiesByPaging(searchCondition);
		String numberOfItems = String.valueOf(iCityService.count(searchCondition));
		
		if (type.equals("search")) {//这里为查询
            SysPagingUtil sysPagingUtil = new SysPagingUtil();//包装结果发送给easyUI网格
            sysPagingUtil.setTotal(numberOfItems);
            sysPagingUtil.setRows(cities);
            String jsonData = JSON.toJSONString(sysPagingUtil);
            return jsonData;
        } else {//这里是下载Excel视图
            Map<String, Object> downloadData = new HashMap<String, Object>();
            downloadData.put("data", cities);
            return new ModelAndView(new ExcelView(), downloadData);
        }
	}
	
	@RequestMapping(value={"/deletecities.do"})
	@ResponseBody
	public String deleteCities( HttpServletRequest request, HttpServletResponse response,@RequestBody List<City> cityids) throws IOException{
		JsonMessage jsonMessage = new JsonMessage();
		jsonMessage.setKey("success");
		try{
			iCityService.bachDeleteCities(cityids);
		}catch(Exception e){
			e.printStackTrace();
			jsonMessage.setKey("failure");
		}
		String jsonData = JSON.toJSONString(jsonMessage);
		return jsonData;
	}
	
	@RequestMapping(value={"/addandupdatecity.do"})
	@ResponseBody
	public String addAndUpdateCity( HttpServletRequest request, HttpServletResponse response,@RequestBody CityVO cityVO) throws IOException{
		JsonMessage jsonMessage = new JsonMessage();
		jsonMessage.setKey("success");
		if (cityVO.getFlag().equals("update")) {
			try {
				City updateCity = new City(Integer.parseInt(cityVO.getId()),cityVO.getName(),cityVO.getCountrycode(),cityVO.getDistrict(),
						Integer.parseInt(cityVO.getPopulation()));
				System.out.println(updateCity);
				iCityService.update(updateCity);
			} catch (Exception e) {
				e.printStackTrace();
				jsonMessage.setKey("failure");
			}
		} else {
			
			try {
				City insertCity = new City(Integer.parseInt(cityVO.getId()),cityVO.getName(),cityVO.getCountrycode(),cityVO.getDistrict(),
						Integer.parseInt(cityVO.getPopulation()));
				iCityService.save(insertCity);
			} catch (Exception e) {
				e.printStackTrace();
				jsonMessage.setKey("failure");
			}
		}
		String jsonData = JSON.toJSONString(jsonMessage);
		return jsonData;
	}
}
