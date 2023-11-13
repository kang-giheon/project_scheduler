package com.scheduler.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/noticeview")
public class noticeviewController {

	@RequestMapping
	public String View(Model model) {
		return "noticeview";
	}
}
