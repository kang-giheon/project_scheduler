package com.scheduler.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/findID")
public class findIDController {

	@RequestMapping
	public String Main(Model model) {
		
		return "findID";
	}

}