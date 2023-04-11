package com.scheduler.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/free")
public class freeController {

	@RequestMapping
	public String Main(Model model) {
		
		return "free";
	}

}