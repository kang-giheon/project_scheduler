package com.scheduler.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/infoupdate")
public class infoupdateController {

	@RequestMapping
	public String Update(Model model) {
		return "infoupdate";
	}
}
