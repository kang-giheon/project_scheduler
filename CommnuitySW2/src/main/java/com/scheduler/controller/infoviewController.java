package com.scheduler.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/infoview")
public class infoviewController {

	@RequestMapping
	public String View(Model model) {
		return "infoview";
	}
}
