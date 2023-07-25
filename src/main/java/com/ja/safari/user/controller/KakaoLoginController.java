package com.ja.safari.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@CrossOrigin(origins = "http://localhost:8181") // 프론트엔드 도메인을 허용합니다.
public class KakaoLoginController {

//    @RequestMapping("/user/kakaoLogin")
//    public String kakaoLogin(@RequestParam("code") String code) {
//        // 카카오 로그인 API와 통신하여 액세스 토큰을 받아온 후 처리하는 로직을 구현합니다.
//        // ...
//
//    	
//    	return "redirect:./kakaoLoginProcess?code="+code;
//    }
}

