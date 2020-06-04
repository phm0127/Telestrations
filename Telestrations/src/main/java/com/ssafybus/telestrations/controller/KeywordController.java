package com.ssafybus.telestrations.controller;

import java.util.Arrays;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/keyword")
public class KeywordController {
	
	static String[] keywordList = {"감자", "몰라", "양아치", "블로거", "순살", "체크남방", "가지치기", "DFS", "조회남", "고구마", "치킨"};
	static String[] user = {"u1", "u2", "u3", "u4", "u5", "u6"};
	static String[] keywordArr;
	
	@RequestMapping(value = "/keyInfo", method = RequestMethod.GET)
	public String getKeyword(Model model, HttpSession session) {
			
		int tmpUserIdx = (int)(Math.random()*user.length);
		session.setAttribute("user", user[tmpUserIdx]);
		
		if(keywordArr == null || keywordArr[tmpUserIdx].equals("")) setKeyword();
		
		model.addAttribute("keyword", keywordArr[tmpUserIdx]);
		
		return "/game/keyInfo";
	}
	
	public void setKeyword() {
		boolean[] used = new boolean[keywordList.length];
		keywordArr = new String[user.length];
		
		for (int i = 0; i < user.length; i++) {
			int val;
			
			while(true) {
				val = (int)(Math.random()*(keywordList.length));
				
				if(!used[val]) {
					used[val] = true;
					keywordArr[i] = keywordList[val];
					break;
				}
			}
		}
	}
	
}
