package com.jh.daoImpl;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jh.dao.MemberDao;
import com.jh.dto.MemberDto;

@Repository    //스프링 콘테이너가 component-scan에 의해 지정한 클래스를 DAO빈으로 자동 변환
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSession sqlSession;//db 처리를 하는 객체. preparedStatement와 같음
	
	//(query_id, 조건)
	//이메일 중복확인
	@Override
	public int findByEmail(String email) {
		return sqlSession.selectOne("com.jh.mapper.AccountMapper.findByEmail", email);
	}
	
	//비밀번호 중복확인
	@Override
	public int findByPw(String pw) {
		return sqlSession.selectOne("com.jh.mapper.MemberMapper.findByPw", pw);
	}
	
	//로그인 id 찾기
	@Override
	public int findByMember(MemberDto dto) {
		return sqlSession.selectOne("com.jh.mapper.AccountMapper.findByMember", dto);
	}
	
	//이름 중복확인
	@Override
	public int findByName(MemberDto dto) {
		return sqlSession.selectOne("com.jh.mapper.MemberMapper.findByName", dto);
	}
	
	//로그인한 id 정보
	@Override
	public List<MemberDto> findByMyInfo(int loginId) {
		//List<MemberDto> list = sqlSession.selectList("com.jh.mapper.MemberMapper.getMember", loginId);
		return sqlSession.selectList("com.jh.mapper.MemberMapper.findByMyInfo", loginId);
	}
	
	//회원정보 수정
	@Override
	public void changeToNewInfo(MemberDto dto) {
		sqlSession.update("com.jh.mapper.MemberMapper.changeToNewInfo", dto);
	}
	
	//프로필 사진 업로드
	@Override
	public void changeToNewProfilePic(MemberDto dto) {
		sqlSession.update("com.jh.mapper.MemberMapper.changeToNewProfilePic", dto);
	}
	
	//회원가입
	@Override
	public void insertMember(MemberDto dto) {
		sqlSession.insert("com.jh.mapper.AccountMapper.insertMember", dto);
	}
	
	//멤버 탈퇴
	@Override
	public void deleteMember(int loginId) {
		sqlSession.delete("com.jh.mapper.MemberMapper.deleteMember", loginId);
	}

	






	
	
	
	
}
