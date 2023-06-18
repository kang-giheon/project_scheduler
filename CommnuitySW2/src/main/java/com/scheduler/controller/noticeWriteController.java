package com.scheduler.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/noticewrite")
public class noticeWriteController {

	@RequestMapping
	public String Write(Model model) {
		return "noticewrite";
	}
}