package com.scheduler.controller;


import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.scheduler.dto.ScheduleDTOImpl;
import com.scheduler.service.ScheduleService;

@Controller
@RequestMapping("/schedule")
public class scheduleController {
	
	@Resource
	private ScheduleService service;
	
	@RequestMapping
	public String returningSchedule(Model model) throws Exception {
		model.addAttribute("showSchedule",service.showSchedule()); 
		return "schedule";
	}
}
