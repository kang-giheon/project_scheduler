package com.scheduler.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequestMapping("/commu")
public class CommuController {
	
	@GetMapping("/free")
	public String free(Model model) {
		return "commu/free";
	}
	@GetMapping("/notice")
	public String notice(Model model) {
		return "commu/notice";
	}
	@GetMapping("/info")
	public String info(Model model) {
		return "commu/info";
	}
}