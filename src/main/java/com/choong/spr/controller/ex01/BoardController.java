package com.choong.spr.controller.ex01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choong.spr.domain.ex01.BoardDto;
import com.choong.spr.domain.ex01.PageInfoDto;
import com.choong.spr.domain.ex01.ReplyDto;
import com.choong.spr.service.Ex01Service;
import com.choong.spr.service.Ex02Service;

@Controller
@RequestMapping("ex11")
public class BoardController {

	
	@Autowired
	private Ex01Service service;
	
	@Autowired
	private Ex02Service replyService;
	
	
//	@GetMapping("board/list")
//	public void listBoard(Model model) {
//		List<BoardDto> list = service.listBoard();
//		
//		model.addAttribute("boardList", list);
//	
//	}
	
	@GetMapping("board/{id}")
	public String getBoard(@PathVariable("id") int id, Model model) {
		
		BoardDto dto = service.getBoard(id);
		
		List<ReplyDto> replyList = replyService.listReplyByBoardId(id);
		
		model.addAttribute("board", dto);
		model.addAttribute("replyList", replyList);
		return "/ex11/board/get";
	}
	
	@PostMapping("board/modify")
	public String modifyBoard(BoardDto board, RedirectAttributes rttr) {
		System.out.println(board);
		boolean ok = service.updateBoard(board);
		
		if (ok) {
			rttr.addFlashAttribute("msg","Correct is complete.");
		}else {
			rttr.addFlashAttribute("msg","Correct is not complete.");
		}
		
		rttr.addAttribute("id", board.getId());
		return "redirect:/ex11/board/list";
	}
	
	@PostMapping("board/remove")
	public String removeBoard(int id, RedirectAttributes rttr) {
		boolean ok = service.removeBoardById(id);
		
		if (ok) {
			rttr.addFlashAttribute("msg","R U sure u want to delete?");
		}else {
			
		}
		return "redirect:/ex11/board/list";
	}
	
	@GetMapping("board/write")
	public void writeBoard() {
		
	}

	@PostMapping("board/write")
	public String writeBoardProcess(BoardDto board) {
		boolean ok = service.addBoard(board);
		
		if(ok) {
			
		}else {
			
		}
		
		return "redirect:/ex11/board/list";
	}
	
	@GetMapping("board/list")
	public void pageBoard(@RequestParam(name="page", defaultValue = "1")int page, Model model) {
		
		int rowPerPage = 5;
		
		List<BoardDto> list = service.listBoardPage(page, rowPerPage);
		
		int totalRecords = service.countBoardPage();
		
		int end = (totalRecords -1) / rowPerPage + 1;
		
		PageInfoDto pageInfo = new PageInfoDto();
		pageInfo.setCurrent(page);
		pageInfo.setEnd(end);
		
		model.addAttribute("boardList", list);
		model.addAttribute("pageInfo", pageInfo);
			
	} 
}









