package com.zky.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.zky.service.IUserService;
import com.zky.util.JsonMessage;
import com.zky.vo.User;

@Controller
@RequestMapping("/system")
public class LoginController {
	@Autowired
	private IUserService iuserService;
	
	@RequestMapping("login.do")
	public String systemLogin(){
		return "login";
	}
	
	@RequestMapping("logincheck.do")
	@ResponseBody
	public String loginCheck(HttpServletRequest request,HttpServletResponse response,@RequestBody User user){
		JsonMessage jsonMessage = new JsonMessage();
		System.out.println(user.getName());
		User dbuser = iuserService.getUserByName(user.getName());
		if ( dbuser == null ) {
			jsonMessage.setKey("accounterror");
		} else if ( user.getPassword().equals(dbuser.getPassword())) {
			jsonMessage.setKey("sucess");
		} else {
			jsonMessage.setKey("passworderror");
		}
		return JSON.toJSONString(jsonMessage);
	}
}
