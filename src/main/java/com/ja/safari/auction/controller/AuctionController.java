package com.ja.safari.auction.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auction/*")
public class AuctionController {

	// 경매 메인 페이지
	@RequestMapping("mainPage")
	public String main() {
		
		return "/auction/mainPage";
	}
	
}
