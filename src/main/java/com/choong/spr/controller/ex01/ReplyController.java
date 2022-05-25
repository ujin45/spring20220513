package com.choong.spr.controller.ex01;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choong.spr.domain.ex01.ReplyDto;
import com.choong.spr.service.Ex02Service;

@Controller
@RequestMapping("ex12")
public class ReplyController {

	@Autowired
	private Ex02Service service;
	
	@PostMapping("reply/add")
	public String addReply(ReplyDto reply, RedirectAttributes rttr) {
		
		boolean success = service.addReply(reply);
		
		if (success) {
			rttr.addFlashAttribute("message", "댓글 등록 완료");
		}
		return "redirect:/ex11/board/" + reply.getBoardId(); 
	}
	
	@PostMapping("reply/modify")
	public String modifyReply(ReplyDto reply) {
		boolean success = service.modifyReply(reply);
		
		return "redirect:/ex11/board/";
	}
	
	@PostMapping("reply/remove")
	public String removeReply(ReplyDto reply) {
		boolean success = service.removeReplyById(reply.getId());
		
		return "redirect:/ex11/board/"; 
	}
	
	
	
}







