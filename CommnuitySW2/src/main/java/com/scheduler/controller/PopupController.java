package com.scheduler.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.scheduler.dto.ScheduleDTOImpl;

@RequestMapping("/schedulePopup")
@Controller
public class PopupController {

	@RequestMapping
	public String showPopup(HttpServletRequest request, Model model) {
		ScheduleDTOImpl obj = new ScheduleDTOImpl();
		String start = request.getParameter("arg1");
		String end = request.getParameter("arg2");
		System.out.println(start+"-"+end);
		obj.setStartDate(start);
		obj.setEndDate(end);
		
		model.addAttribute("obj",obj);
		
		return "schedulePopup";
	}
}
