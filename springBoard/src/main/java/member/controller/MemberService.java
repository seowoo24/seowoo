package member.controller;

import member.bean.MemberDTO;

public interface MemberService {
	
	int write(MemberDTO memberDTO);
	String login(String id, String pwd);
	boolean isExistId(String id);
	MemberDTO getData(String id);
	int modify(MemberDTO memberDTO);
	
}
