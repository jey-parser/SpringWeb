package com.jh.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jh.dto.BoardDto;
import com.jh.service.BoardService;

@Controller
@RequestMapping(value="/board", method = RequestMethod.GET)
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	HttpSession session;

	/*
	 * 게시글 출력
	 * @param int page 페이지 번호
	*/
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String board(@RequestParam int page, Model model) {
		double pageNum = Math.ceil((double)(boardService.BoardTotalPage()/10.0));
		model.addAttribute("totalPage", pageNum);
		model.addAttribute("boardList", boardService.BoardList(page));
		return "board";
	}
	
	/*
	 * 게시글 내용보기
	 * @param int bno 게시글 번호
	 * 작성자이면 -> edit모드
	 * 관리자이면 -> admin모드
	 */
	@GetMapping("/{bno}") 
	public String boardDetail(Model model, @PathVariable int bno, HttpSession session) {
		BoardDto dto = boardService.BoardDetail(bno);
		model.addAttribute("boardDetail", dto);
		
		int loginId = (int)session.getAttribute("loginId");
		if(loginId==dto.getMember_id()) {
			model.addAttribute("mode", "edit");
		} else if(loginId==1) {
			model.addAttribute("mode", "admin");
		} else {
			model.addAttribute("mode", "view");
		}
		return "detail";
	}
	
	/*
	 * @param String mode 등록 및 수정 키워드 
	 * post -> 게시글 등록
	 * modify -> 게시글 수정
	*/
	@PostMapping("/detail") 
	public String boardUpdate(@RequestParam String mode, @ModelAttribute("boardDetail") BoardDto dto, RedirectAttributes rttr) {
		int bno = dto.getBno();
		if(mode.equals("post")) {
			boardService.BoardDetailInsert(dto);
			bno = boardService.BoardBno(dto.getMember_id());
		} else {
			boardService.BoardDetailUpdate(dto);
		}
		return "redirect:http://localhost:9096/SpringWeb/board/"+bno;//새로고침하기
	}
	
	/*
	 * 게시글 삭제
	 * @param int bno 삭제할 게시글 번호
	 */
	@DeleteMapping("/del/{bno}")
	public String boardDelete(@PathVariable("bno")int bno, RedirectAttributes rttr) {
		boardService.BoardDelete(bno);
		return "redirect:http://localhost:9096/SpringWeb/board?page=1";
	}
	
	
}
