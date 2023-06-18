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
import net.sf.json.JSONArray; 

@Controller
public class scheduleController {

	
	@GetMapping("/lookup")
	public String lookup(HttpSession session, Model model) {
		String email = (String)session.getAttribute("email");
		model.addAttribute("email",email);
		return "lookup";
	}
	
	@PostMapping("/schedule")
	public String returningSchedule(HttpSession session,HttpServletRequest request,Model model) throws Exception {
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
		    	  if(memberInfo.get("color")!=null) {
		    		  
		    		  System.out.println(memberInfo.get("memo").toString()+"수정");
		    		  dto.setColor(memberInfo.get("color").toString());
		    	  }
		    	  list.add(dto);
		      }  
		  } catch (Exception e) {
		 }
		model.addAttribute("showSchedule",list); 
		model.addAttribute("email",(String)session.getAttribute("email"));
		  
		return "schedule";
	}
}
