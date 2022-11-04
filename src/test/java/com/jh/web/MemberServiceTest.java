package com.jh.web;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.jh.dto.MemberDto;
import com.jh.service.MemberService;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MemberServiceTest {
	@Autowired
	private MemberService memberService;
	//	@Autowired
	//private MemberDao dao = new MemberDaoImpl();
	//private MemberService service = new MemberServiceImpl(dao);
	
	@Test
	public void testMemberLoginChk() {
		//System.out.println("Is service null? : " + memberdao==null);
		//System.out.println( memberdao.loginChk(new MemberDto(3, "email.com", "1234", "뿡뿡","asdsadf.jpg", "sysdate", "light")) );
	}
	
	@Test
	public void test1() {
		MemberDto dto = new MemberDto();
		int cnt = memberService.findByNameService(dto);
	}
	
	@Test 
	public void test2(){
		MemberDto dto = new MemberDto();
		dto.setLightMode("white");
	}
	
//	@Test
//	public void testMemberLoginChk() throws Exception{
//		List<MemberDto> list = dao.loginChk(1);
//	}
	
	
}
