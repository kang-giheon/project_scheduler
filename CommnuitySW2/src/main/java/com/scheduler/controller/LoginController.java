package com.scheduler.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/login")
public class LoginController {

	@GetMapping
	public String Main(Model model) {
		
		return "login";
	}
	
	//@PostMapping
	//public Map<Object,Object> emailsession(HttpSession session,@RequestParam("email") String email,Model model) throws Exception {
	//	Map<Object,Object>map = new HashMap<Object,Object>();
	//	session.setAttribute("email", email);
	//	return map;
	//}
	
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
