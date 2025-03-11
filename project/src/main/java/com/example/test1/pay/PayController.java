package com.example.test1.pay;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PayController {

	@RequestMapping("/pay.do")
	public String pay(Model model) throws Exception {
		
		return "pay";
	}
	@RequestMapping("/auth.do")
	public String auth(Model model) throws Exception {
		
		return "auth";
	}
}
