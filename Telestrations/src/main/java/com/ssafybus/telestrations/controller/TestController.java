package com.ssafybus.telestrations.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class TestController {
	
	@RequestMapping(value = "/canvas", method = RequestMethod.GET)
	private String canvas(){		
		
		return "/paint/canvas";
	}
}
