package com.jh.web;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.jh.dao.BoardDao;
import com.jh.dto.BoardDto;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BoardTest {
	@Autowired	
	BoardDao b;
	
	@Test
	public void BoardDetail() {
		BoardDto dto = b.getBoardDetail(4);
		
		System.out.println("bno : "+dto.getBno());
		System.out.println("title : "+dto.getTitle());
		System.out.println("content : "+dto.getContent());
		System.out.println("time : "+dto.getDateTime());
		System.out.println("memberId : "+dto.getMember_id());
		System.out.println("writer : "+dto.getWriter());
		
		
	}
	@Test
	public void board() {
		BoardDto dto = new BoardDto();
		dto.setTitle("되는교ㅕ");
		dto.setContent("이거");
		dto.setWriter("name");
		dto.setMember_id(3);
		b.setBoardDetail(dto);
	}

	


}
