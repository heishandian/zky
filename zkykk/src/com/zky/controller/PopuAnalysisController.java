package com.zky.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.zky.commons.MaxAndMin;
import com.zky.service.ICityService;
import com.zky.util.JsonMessage;

@Controller
@RequestMapping("/analysis")
public class PopuAnalysisController { 
	@Autowired
	private ICityService iCityService;

	@RequestMapping("/gotopopuanalysisdiagrampage.do")
	public String gotoPopuAnalysisDiagramPage() {
		return "popuanalysisdiagram";
	}
	
	@RequestMapping("/getpopuanalysisdata.do") 
	@ResponseBody 
	public String getPopuAnalysisData() {
		MaxAndMin maxAndMin = iCityService.getMaxAndMinPopulation();
		MaxAndMin maxandmin = null;
		int count = 0;
		int max = maxAndMin.getMax();
		int min = maxAndMin.getMin();
		int interval = (max - min) / 10;
		String[] x = new String[10];
		int[] y = new int[10];
		for (int i = 0; i < 10; i++) {
			if (i == 0) {
				x[i] = String.valueOf("0~"+interval/10000);
				maxandmin = new MaxAndMin(0, interval);
				count = iCityService.getNumOfPopByInterval(maxandmin);
			} else if (i == 9) {
				x[i] = String.valueOf(interval/10000*9+"~"+max/10000);
				maxandmin = new MaxAndMin(interval*9, max);
				count = iCityService.getNumOfPopByInterval(maxandmin);	
			} else {
				x[i] = String.valueOf(interval/10000*(i)+"~"+interval/10000*(i+1));
				maxandmin = new MaxAndMin(interval*(i), interval*(i+1));
				count = iCityService.getNumOfPopByInterval(maxandmin);	
			}
			y[i] = count;
		}
		 Map<String,Object> map = new HashMap<String,Object>(); 
		 map.put("x",x);
		 map.put("y",y); 
		 JsonMessage jsonMessage = new JsonMessage(); 
		 jsonMessage.setData(map); 
		 return JSON.toJSONString(jsonMessage);
	}
}
