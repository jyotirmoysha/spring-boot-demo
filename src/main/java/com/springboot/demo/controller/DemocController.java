package com.springboot.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/demo")
public class DemocController {
	
	@GetMapping("/hello")
	public String sayHello() {
		return "Hello Jyotirmoy, Welcome to DevOps Testing";
	}

}
