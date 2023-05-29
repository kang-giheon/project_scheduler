package com.scheduler.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.scheduler.dto.ScheduleDTOImpl;
import com.scheduler.service.ScheduleService;
import net.sf.json.JSONArray; 

@Controller
public class scheduleController {
	
	@Resource
	private ScheduleService service;
	
	@GetMapping("/lookup")
	public String lookup(HttpSession session, Model model) {
		
		return "lookup";
	}
	
	@PostMapping("/schedule")
	public String returningSchedule(HttpServletRequest request,Model model) throws Exception {
		List<ScheduleDTOImpl> list = new ArrayList<>();
		  try {
			  List<Map<String,Object>> info = new ArrayList<Map<String,Object>>();
			    info = JSONArray.fromObject(request.getParameter("arg1"));
		      
		      for (Map<String, Object> memberInfo : info) {
		    	  ScheduleDTOImpl dto = new ScheduleDTOImpl();
		    	  dto.setSubject(memberInfo.get("subject").toString());
		    	  dto.setStartDate(memberInfo.get("startDate").toString());
		    	  dto.setEndDate(memberInfo.get("endDate").toString());
		    	  dto.setMemo(memberInfo.get("memo").toString());
		    	  list.add(dto);
		      }  
		  } catch (Exception e) {
		 }
		model.addAttribute("showSchedule",list); 
		  
		return "schedule";
	}
}
