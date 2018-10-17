package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/main/index.do")
	public ModelAndView main() {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("/main/index");
		
		return modelAndView;		
	}
	
	@RequestMapping(value="/member/writeForm.do")
	public ModelAndView writeForm(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("/member/writeForm");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/member/write.do", method=RequestMethod.POST)
	public ModelAndView write(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String gender = request.getParameter("gender");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String addr = request.getParameter("addr");
		
		// 데이터 저장
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO.setName(name);
		memberDTO.setId(id);
		memberDTO.setPwd(pwd);
		memberDTO.setGender(gender);
		memberDTO.setEmail1(email1);
		memberDTO.setEmail2(email2);
		memberDTO.setTel1(tel1);
		memberDTO.setTel2(tel2);
		memberDTO.setTel3(tel3);
		memberDTO.setAddr(addr);
		
		// DB
		int su = memberService.write(memberDTO);
		
		modelAndView.addObject("su", su);
		modelAndView.setViewName("/member/write");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/member/checkId.do")
	public ModelAndView checkId(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		
		String id = request.getParameter("id");

		boolean isExist = memberService.isExistId(id);
		
		modelAndView.addObject("id", id);
		modelAndView.addObject("isExist", isExist);
		modelAndView.setViewName("/member/checkId");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/member/loginForm.do")
	public ModelAndView loginForm(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("/member/loginForm");
		
		return modelAndView;		
	}
	
	@RequestMapping(value="/member/login.do")
	public ModelAndView login(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name;
		String address;
		
		name = memberService.login(id, pwd);
		
		// 페이지 이동
		if(name == null) {
			address = "/member/loginFail";
		} else {
			
			session.setAttribute("memId", id);
			session.setAttribute("memName", name);
			
			address = "/member/loginOk";
		}
		
		
		modelAndView.setViewName(address);
		
		return modelAndView;		
	}
	
	@RequestMapping(value="/member/logout.do")
	public ModelAndView logout(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();

		// session 삭제
		// 개별 삭제
		session.removeAttribute("memName");
		session.removeAttribute("memId");
		
		// 전체 삭제 : 무효화
		session.invalidate();
		
		modelAndView.setViewName("/member/logout");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/member/modifyForm.do")
	public ModelAndView modifyForm(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("memId");

		System.out.println("[modifyForm] : " + id);

		MemberDTO memberDTO = memberService.getData(id);
		
		String name = memberDTO.getName();
		id = memberDTO.getId();
		String pwd = memberDTO.getPwd();
		String gender = memberDTO.getGender();
		String email1 = memberDTO.getEmail1();
		String email2 = memberDTO.getEmail2();
		String tel1 = memberDTO.getTel1();
		String tel2 = memberDTO.getTel2();
		String tel3 = memberDTO.getTel3();
		String addr = memberDTO.getAddr();
		
		modelAndView.addObject("name", name);
		modelAndView.addObject("id", id);
		modelAndView.addObject("pwd", pwd);
		modelAndView.addObject("gender", gender);
		modelAndView.addObject("email1", email1);
		modelAndView.addObject("email2", email2);
		modelAndView.addObject("tel1", tel1);
		modelAndView.addObject("tel2", tel2);
		modelAndView.addObject("tel3", tel3);
		modelAndView.addObject("addr", addr);
		
		modelAndView.setViewName("/member/modifyForm");
		
		return modelAndView;		
	}
	
	@RequestMapping(value="/member/modify.do")
	public ModelAndView modify(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		
		String name = request.getParameter("name");
		String id = (String) session.getAttribute("memId");
		String pwd = request.getParameter("pwd");
		String gender = request.getParameter("gender");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String addr = request.getParameter("addr");
		
		// 데이터 저장
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO.setName(name);
		memberDTO.setId(id);
		memberDTO.setPwd(pwd);
		memberDTO.setGender(gender);
		memberDTO.setEmail1(email1);
		memberDTO.setEmail2(email2);
		memberDTO.setTel1(tel1);
		memberDTO.setTel2(tel2);
		memberDTO.setTel3(tel3);
		memberDTO.setAddr(addr);
		
		// DB
		int su = memberService.modify(memberDTO);
		
		modelAndView.addObject("su", su);
		modelAndView.setViewName("/member/modify");
		
		return modelAndView;
	}
	
}
