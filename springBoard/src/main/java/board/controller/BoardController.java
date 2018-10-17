package board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import board.bean.BoardDTO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardservice;
	
	@RequestMapping(value="/board/boardWriteForm.do")
	public ModelAndView boardWriteForm(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("/board/boardWriteForm");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/board/boardWrite.do", method=RequestMethod.POST)
	public ModelAndView boardWrite(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();

		String id = (String) session.getAttribute("memId");
		String name = (String) session.getAttribute("memName");
		
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		// 데이터의 개수가 많기 때문에 자바빈즈 클래스에 담아서 전달
		BoardDTO boardDTO = new BoardDTO();
		
		boardDTO.setId(id);
		boardDTO.setName(name);
		boardDTO.setSubject(subject);
		boardDTO.setContent(content);
		
		// DB
		int su = boardservice.boardWrite(boardDTO);
		
		modelAndView.addObject("su", su);
		modelAndView.setViewName("/board/boardWrite");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/board/boardList.do")
	public ModelAndView boardList(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		
		// 데이터
		String str_pg = request.getParameter("pg");
		int pg = 1;
		if(str_pg != null) {
			pg = Integer.parseInt(str_pg);
		}
		
		int endNum = pg * 5;
		int startNum = endNum - 4;
		
		List<BoardDTO> list = boardservice.boardList(startNum, endNum);
		
		int totalA = boardservice.getTotalA();				// 총 글 수
		int totalP = (totalA + 4) / 5;						// 총 페이지 수 : 정수계산이므로...
		
		int startPage = (((pg - 1) / 3 ) * 3 ) + 1;			// (2-1)/3*3+1 = 1		
		int endPage = startPage + 2;
		if(endPage > totalP) {
			endPage = totalP;
		}
		
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("list", list);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		
		modelAndView.setViewName("/board/boardList");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/board/boardView.do")
	public ModelAndView boardView(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();

		// 데이터
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		// DB
		boardservice.updateHit(seq);						// 조회수 증가
		BoardDTO boardDTO = boardservice.boardView(seq);
		
		modelAndView.addObject("boardDTO", boardDTO);
		modelAndView.addObject("seq", seq);
		modelAndView.addObject("pg", pg);
		modelAndView.setViewName("/board/boardView");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/board/boardModifyForm.do")
	public ModelAndView boardModifyForm(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		String pg = request.getParameter("pg");

		BoardDTO boardDTO = boardservice.boardView(seq);
		
		modelAndView.addObject("boardDTO", boardDTO);
		modelAndView.addObject("seq", seq);
		modelAndView.addObject("pg", pg);
		
		modelAndView.setViewName("/board/boardModifyForm");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/board/boardModify.do", method=RequestMethod.POST)
	public ModelAndView boardModify(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();

		String id = (String) session.getAttribute("memId");
		String name = (String) session.getAttribute("memName");
		
		String subject = request.getParameter("subject");
		//System.out.println(subject);
		String content = request.getParameter("content");
		//int seq = Integer.parseInt(request.getParameter("seq"));
		String str_seq = request.getParameter("seq");
		System.out.println(str_seq);
		int seq = Integer.parseInt(str_seq);
		String pg = request.getParameter("pg");
		
		// 데이터의 개수가 많기 때문에 자바빈즈 클래스에 담아서 전달
		BoardDTO boardDTO = boardservice.boardView(seq);		
		
		boardDTO.setId(id);
		boardDTO.setName(name);
		boardDTO.setSubject(subject);
		boardDTO.setContent(content);
		System.out.println("boardDTO.toString() : " + boardDTO.toString());
		// DB
		int su = boardservice.boardModify(boardDTO);
		
		modelAndView.addObject("su", su);
		modelAndView.addObject("seq", seq);
		modelAndView.addObject("pg", pg);
		
		modelAndView.setViewName("/board/boardModify");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/board/boardDelete.do")
	public ModelAndView boardDelete(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();	

		// 데이터
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		// DB
		int su = boardservice.boardDelete(seq);
		
		modelAndView.addObject("su", su);
		modelAndView.addObject("pg", pg);
		modelAndView.setViewName("/board/boardDelete");
		
		return modelAndView;
	}
	
}
