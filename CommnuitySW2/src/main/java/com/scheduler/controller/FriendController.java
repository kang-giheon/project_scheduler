package com.scheduler.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.scheduler.dto.ScheduleDTOImpl;

@RequestMapping("/friend")
@Controller
public class FriendController {

	@GetMapping
	public String returnPage(HttpSession session,Model model) {
		List<ScheduleDTOImpl> list = new ArrayList<>();
		model.addAttribute("showSchedule",list);
		return "friend";
	}
}
