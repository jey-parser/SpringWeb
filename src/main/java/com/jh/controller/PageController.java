package com.jh.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jh.dto.MemberDto;
import com.jh.service.MemberService;

@Controller
public class PageController {
	
	@Autowired 
	private MemberService memberService;
	
	/*
	 * 메인페이지 이동
	 */
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String home(Locale locale) {
		return "index";
	}

	/*
	 * 로그인 화면
	 */
	@GetMapping("/login") 
	public void login() {
		
	}

	/*
	 * 회원가입 화면
	 */
	@GetMapping("/signUp")
	public String signUp() {
		return "signUp";
	}

	/*
	 * 내 정보 화면
	 */
	@GetMapping("/myPage")
	public String myPage() {
		return "myPage";
	}

	/*
	 * 내가 쓴 문서
	 */
	@GetMapping("/myPost")
	public String myPost() {
		return "myPost";
	}

	/*
	 * 문서 작성 페이지
	 */
	@GetMapping("/post")
	public String postPage() {
		return "postPage";
	}
	
	/*
	 * 네이버 로그인 callback
	*/
	@GetMapping("")
	public String callBack(HttpSession session, @RequestParam String code, @RequestParam String state){
		String access_token = memberService.naverLoginService(code, state);
		List<MemberDto> list = new ArrayList<MemberDto>();
		list.add(memberService.getNaverMemberInfoService(access_token));
		int loginId = memberService.findByMemberService(memberService.getNaverMemberInfoService(access_token));
		
		session.setAttribute("memberInfoList", list);
		session.setAttribute("loginId", loginId);
		
		session.setMaxInactiveInterval(60*60);//세션 유지시간 60초 x60 = 1시간
		return "index";
	}
	
	/*
	 * 네이버 로그아웃
	*/
	@GetMapping("/logout")
	public String naverLogout(HttpSession session) {
		session.invalidate();
		return "index";
	}

}
