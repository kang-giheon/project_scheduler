package com.scheduler.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scheduler.dto.ScheduleDTOImpl;

import net.sf.json.JSONArray;

@Controller
public class LoginController {

	@GetMapping("/login")
	public String Main(Model model) {
		
		return "login";
	}
	
	
    @GetMapping("/login/loginfailed")  
    public String loginerror(Model model) {  
        model.addAttribute("error", "true");  
        return "login"; 
    }  
}
