package com.scheduler.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/info")
public class infoController {

	@RequestMapping
	public String Main(Model model) {
		
		return "info";
	}

}