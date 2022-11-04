package com.jh.web;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.jh.dao.MemberDao;
import com.jh.dto.MemberDto;

//단위테스트 : 메서드 하나만 실행함. 톰캣 실행하지 않고도 테스트 가능. junit test
//dao나 service 만들고 테스트. 이 테스트에서 오류가 거의 걸러짐.
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MemberDaoTest {
	@Autowired
	MemberDao dao; //자동 주입할것임 ->root context에 빈 등록!
	//
	@Test
	public void testInsert() throws Exception{
		//dao.signUp(new MemberDto(2, "jey", "1234", "jh", "", "sysdate", "white"));
	}
	
	@Test 
	public void test1() {
		MemberDto dto = new MemberDto();
		dto.setName("두리");
		System.out.println(dao.findByName(dto)); 
	}
	
}
