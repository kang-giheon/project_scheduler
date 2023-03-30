package com.scheduler.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {

	@RequestMapping
	public String Main(Model model) {
		
		return "login";
	}
	
    @GetMapping("/loginfailed")  
    public String loginerror(Model model) {  
        model.addAttribute("error", "true");  
        return "login"; 
    } 
    
    @GetMapping("/logout")
    public String logout(Model model) {  
        return "login";  
    } 
}
