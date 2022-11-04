package com.jh.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.dao.BoardDao;
import com.jh.dto.BoardDto;
import com.jh.service.BoardService;
@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDao dao;
	
	@Override
	public List<BoardDto> BoardList(int page) {
		return dao.getBoardList(page);
	}

	@Override
	public int BoardTotalPage() {
		return dao.getTotalPage();
	}
	
	@Override
	public BoardDto BoardDetail(int bno) {
		return dao.getBoardDetail(bno);
	}

	@Override
	public void BoardDetailUpdate(BoardDto dto) {
		dao.updateBoardDetail(dto);
	}

	@Override
	public void BoardDelete(int bno) {
		dao.deleteBoardDetail(bno);
	}

	@Override
	public void BoardDetailInsert(BoardDto dto) {
		dao.setBoardDetail(dto);
	}

	@Override
	public int BoardBno(int memberId) {
		return dao.getBno(memberId);
	}

}
