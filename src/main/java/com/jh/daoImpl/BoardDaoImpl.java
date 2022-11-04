package com.jh.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jh.dao.BoardDao;
import com.jh.dto.BoardDto;
import com.jh.dto.MemberDto;

@Repository
public class BoardDaoImpl implements BoardDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BoardDto> getBoardList(int page) {
		return sqlSession.selectList("com.jh.mapper.BoardMapper.getBoard", page);
	}

	@Override
	public int getTotalPage() {
		return sqlSession.selectOne("com.jh.mapper.BoardMapper.totalPage");
	}
	
	@Override
	public BoardDto getBoardDetail(int bno) {
		return sqlSession.selectOne("com.jh.mapper.BoardMapper.getBoardDetail", bno);
	}
	
	@Override
	public void setBoardDetail(BoardDto dto) {
		sqlSession.insert("com.jh.mapper.BoardMapper.setBoardDetail", dto);
	}
	
	@Override
	public void updateBoardDetail(BoardDto dto) {
		sqlSession.update("com.jh.mapper.BoardMapper.updateBoardDetail", dto);
	}

	@Override
	public void deleteBoardDetail(int bno) {
		sqlSession.delete("com.jh.mapper.BoardMapper.deleteBoardDetail", bno);
		
	}

	@Override
	public int getBno(int memberId) {
		return sqlSession.selectOne("com.jh.mapper.BoardMapper.getBno", memberId);
	}



}
