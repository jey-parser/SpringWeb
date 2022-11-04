package com.jh.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jh.dto.MemberDto;
import com.jh.service.MemberService;

@Controller
@RequestMapping(value = "/member", method = RequestMethod.GET)
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	HttpSession session;
	
	
	//member
	//member id 확인
	@PostMapping("")
	@ResponseBody
	public int findByMember(@RequestBody MemberDto dto, HttpSession session) {
		int result = memberService.findByMemberService(dto);
		List<MemberDto> list = memberService.findByMyInfoService(result);
		session.setAttribute("loginId", result);
		session.setAttribute("memberInfoList", list);
		session.setMaxInactiveInterval(60*60);
		return result;
	}
	
	//로그인한  member 정보 표시
	@GetMapping("/info")
	@ResponseBody
	//public String getMemberInfo(@RequestParam int loginId, Model model) {
	public String getMemberInfo(@RequestParam int loginId, HttpSession session) {
		List<MemberDto> list = memberService.findByMyInfoService(loginId);
		session.setAttribute("memberInfoList", list);
		return "myPage";
	}
	
	//member 가입
	@PostMapping("/signUp")
	public String insertMember(MemberDto dto) {
		memberService.insertMemberService(dto);
		return "login";
	}
	
	//member 정보수정
	@PutMapping("/newInfo")
	@ResponseBody
	public void changeToNewInfoService(@RequestBody MemberDto dto) {
		memberService.changeToNewInfoService(dto);
	}
	
	//프로필사진 수정
	@PutMapping("/profile")
	@ResponseBody
	public void changeToNewProfile(MemberDto dto, @RequestParam int loginId) {
		memberService.changeToNewProfilePicService(dto);
	}
	
	/*
	 * member 탈퇴
	 * loginId 세션에서 삭제
	 */
	@DeleteMapping("/{loginId}")
	public void deleteMember(@RequestParam int loginId) {
		memberService.deleteMemberService(loginId);
		session.removeAttribute("loginId");
	}
	
	/*
	 * 이메일 중복확인
	 * return cnt(1 OR 0)
	 */
	@GetMapping("/email")
	@ResponseBody
	public int findBy(@RequestBody String email) {
		return memberService.findByEmailService(email);
	}
	
	/*
	 * 비밀번호 중복확인
	 * return cnt(1 OR 0)
	 */
	@PostMapping("/pw")
	@ResponseBody
	public int findByPw(@RequestBody String pw) {
		return memberService.findByPwService(pw);
	}
	
	/*
	 * 이름 중복확인
	 * return cnt(1 OR 0)
	 */	
	@GetMapping("/name")
	@ResponseBody
	public int findByName(@RequestParam String name) {
		MemberDto dto = new MemberDto();
		dto.setName(name);
		int cnt = memberService.findByNameService(dto);
		return cnt;
	}
	
	
	
}
