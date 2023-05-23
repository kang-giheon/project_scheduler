package com.scheduler.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/view")
public class viewController {

	@RequestMapping
	public String View(Model model) {
		return "view";
	}
}
