package com.jh.service;

import java.util.List;

import com.jh.dto.BoardDto;

public interface BoardService {
	List<BoardDto> BoardList(int page);
	int BoardTotalPage();
	BoardDto BoardDetail(int bno);
	void BoardDetailInsert(BoardDto dto);
	int BoardBno(int memberId);
	void BoardDetailUpdate(BoardDto dto);
	void BoardDelete(int bno);
}
