package com.scheduler.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scheduler.dto.ScheduleDTOImpl;
import com.scheduler.service.ScheduleService;

@RequestMapping("/schedulePopup")
@Controller
public class PopupController {
	
	@Resource
	private ScheduleService service;
	
	@RequestMapping(method=RequestMethod.GET)
	public String showPopup(HttpServletRequest request, Model model) throws Exception {
		//원래는 db이용해서 받은 인자로 해당 요일 일정들 출력한 후 model객체에 담아 넘겨야 함. 
		ScheduleDTOImpl obj = new ScheduleDTOImpl();
		String start = request.getParameter("arg1");
		String end = request.getParameter("arg2");
		obj.setStartDate(start);
		obj.setEndDate(end);
		model.addAttribute("obj",obj);
		model.addAttribute("schedule",service.showSchedulePickDate(obj));
		
		return "schedulePopup";
	}
	
	@PostMapping
	public Map<Object,Object> addSchedule(@RequestBody ScheduleDTOImpl sc) throws Exception{
		System.out.println(sc.getSubject());
		Map<Object,Object>map = new HashMap<Object,Object>();
		service.addSchedule(sc);
		
		return map;
	}
	
	@PostMapping("/update")
	public void updateSchedule(@ModelAttribute("ScheduleDTO")ScheduleDTOImpl sc) {
		
	}
	@PostMapping("/delete")
	public void deleteSchedule(@ModelAttribute("ScheduleDTO")ScheduleDTOImpl sc) {
		
	}
}
