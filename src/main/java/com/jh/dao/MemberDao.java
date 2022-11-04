package com.jh.dao;


import java.util.List;
import java.util.Map;

import com.jh.dto.BoardDto;
import com.jh.dto.MemberDto;

//sql 결과값을 dao로 옮김
public interface MemberDao {
	int findByEmail(String email);
	int findByPw(String pw);
	int findByMember(MemberDto dto);
	int findByName(MemberDto dto);
	List<MemberDto> findByMyInfo(int loginId);

	void changeToNewInfo(MemberDto dto);
	void changeToNewProfilePic(MemberDto dto);
	void insertMember(MemberDto dto);
	void deleteMember(int loginId);
	
}
