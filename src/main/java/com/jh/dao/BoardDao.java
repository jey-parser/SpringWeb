package com.jh.dao;

import java.util.List;

import com.jh.dto.BoardDto;

public interface BoardDao {
	List<BoardDto> getBoardList(int page);
	int getTotalPage();
	BoardDto getBoardDetail(int bno);
	void setBoardDetail(BoardDto dto);
	int getBno(int memberId);
	void updateBoardDetail(BoardDto dto);
	void deleteBoardDetail(int bno);	
	
	
}
