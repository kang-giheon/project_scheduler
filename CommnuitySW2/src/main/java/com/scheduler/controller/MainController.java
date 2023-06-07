package com.scheduler.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MainController {
	
	@RequestMapping
	public String Main(HttpSession session,Model model) {
		model.addAttribute("email",(String)session.getAttribute("email"));
		return "main";
	}

}