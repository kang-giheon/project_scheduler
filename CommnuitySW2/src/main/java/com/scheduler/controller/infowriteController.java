package com.scheduler.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/infowrite")
public class infowriteController {

	@RequestMapping
	public String Write(Model model) {
		return "infowrite";
	}
}