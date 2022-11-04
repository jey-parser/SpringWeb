package com.jh.service;



import java.util.List;

import com.jh.dto.BoardDto;
import com.jh.dto.MemberDto;

public interface MemberService { //dao를 실행하는 것
	int findByEmailService(String email);
	int findByPwService(String pw);
	int findByMemberService(MemberDto dto);
	int findByNameService(MemberDto dto);
	List<MemberDto> findByMyInfoService(int loginId);
	
	void changeToNewInfoService(MemberDto dto);
	void changeToNewProfilePicService(MemberDto dto);
	void insertMemberService(MemberDto dto);
	void deleteMemberService(int loginId);
	
	String naverLoginService(String code, String state);
	MemberDto getNaverMemberInfoService(String access_token);
}
