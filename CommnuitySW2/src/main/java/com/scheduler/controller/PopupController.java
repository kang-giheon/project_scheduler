package com.scheduler.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.scheduler.dto.ScheduleDTOImpl;

import net.sf.json.JSONArray;

@RequestMapping("/schedulePopup")
@Controller
public class PopupController {
	
	
	@PostMapping
	public String showPopup(HttpSession session,HttpServletRequest request, Model model) throws Exception {
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
		  }catch (Exception e) {
				 }
		ScheduleDTOImpl obj = new ScheduleDTOImpl();
		obj.setStartDate(request.getParameter("arg2"));
		obj.setEndDate(request.getParameter("arg3"));
		model.addAttribute("obj",obj);
		model.addAttribute("schedule",list);
		model.addAttribute("email",(String)session.getAttribute("email"));
		
		return "schedulePopup";
	}
	
	@PostMapping("/update")
	public String updateSchedule(HttpSession session,@ModelAttribute ScheduleDTOImpl sc,Model model) {
		model.addAttribute("obj",sc);
		model.addAttribute("email",(String)session.getAttribute("email"));
		return "updateSchedule";
	}
}
