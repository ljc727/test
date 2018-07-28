package com.jc.controller.user;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
	@RequestMapping("/hello")
	public String hello() {
		return "hello";
	}
	
	@RequestMapping("/calendar")
	public String calendar(String day, Model model) {
		
		if (day == null) {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			model.addAttribute("today", sdf.format(date));			
			
			
			JSONArray jArr = new JSONArray();
			
			JSONObject obj1 = new JSONObject();
			obj1.put("title","테스트 \n 테스트");
			obj1.put("start","2015-12-12");
			

			jArr.add(obj1);
			System.out.println("112");
			
			model.addAttribute("data", jArr.toString());
			
		} else {
			
			String[] dtArr = day.split("-");
			String v = dtArr[0] + dtArr[1];
			
			
			
			JSONArray jArr = new JSONArray();
			JSONObject obj1 = new JSONObject();
			JSONObject obj2 = new JSONObject();
			
			if ("201512".equals(v)) {
				obj1.put("title","테스트111111111111111111111111111111111111111111131313131412424214");
				obj1.put("start","2015-12-12");
				obj1.put("description","testestetset");
				obj2.put("title","테스트 \n 테스트");
				obj2.put("start","2015-12-24");
				
			} else if ("201511".equals(v)) {
				obj1.put("title","14스트 \n 테24스트");
				obj1.put("start","2015-11-17");
				obj2.put("title","테24스트 \n 테스트");
				obj2.put("start","2015-11-26");
				
			} else if ("201601".equals(v)) {
				obj1.put("title","2222");
				obj1.put("start","2016-01-03");
				obj2.put("title","1111");
				obj2.put("start","2016-01-03");
				
				JSONObject obj3 = new JSONObject();
				JSONObject obj4 = new JSONObject();
				
				obj3.put("title","4444");
				obj3.put("start","2016-01-03");
				obj4.put("title","5333");
				obj4.put("start","2016-01-03");
				
				jArr.add(obj3);
				jArr.add(obj4);
				
			} else if ("201602".equals(v)) {
				obj1.put("title","테스트 \n 테스트");
				obj1.put("start","2016-02-15");
				obj2.put("title","테스트 \n 테스트");
				obj2.put("start","2016-02-27");
				
			} else if ("201603".equals(v)) {
				obj1.put("title","테스트 \n 테스트");
				obj1.put("start","2016-03-04");
				obj2.put("title","테스트 \n 테스트");
				obj2.put("start","2016-03-21");
				
			} else {
				model.addAttribute("today", day);
				model.addAttribute("data", "");
				return "calendar";
			}

			jArr.add(obj1);
			jArr.add(obj2);
			
			model.addAttribute("today", day);
			model.addAttribute("data", jArr.toString());
		}
		
		
		
		return "calendar";
	}
	
	
	@RequestMapping("/ajax")
	public void ajax(String start, HttpServletResponse response) {
		 
		
		String personJson = "{\'title\':\'"+"aaaaa"
                 +"\',\'start\':\'"+"2015-12-05"+"\'}";
		try {
			response.getWriter().print(personJson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
