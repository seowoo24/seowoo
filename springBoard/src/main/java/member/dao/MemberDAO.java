package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sun.org.apache.bcel.internal.generic.GETFIELD;

import member.bean.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int write(MemberDTO memberDTO) {		
		return sqlSession.insert("mybatis.memberMapper.write", memberDTO);
	}
	
	public String login(String id, String pwd) {
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("id", id);
		map.put("pwd", pwd);
		System.out.println(map.get("id") + " " + map.get("pwd"));
		return sqlSession.selectOne("mybatis.memberMapper.login", map);
	}
	
	public boolean isExistId(String id) {
		boolean isExist = false;
		
		if(sqlSession.selectOne("mybatis.memberMapper.isExistId", id) != null) {
			isExist = true;
		}
		
		return isExist;
	}
	
	public MemberDTO getData(String id) {
		return sqlSession.selectOne("mybatis.memberMapper.getData", id);
		
	}
	
	public int modify(MemberDTO memberDTO) {
		return sqlSession.update("mybatis.memberMapper.modify", memberDTO);
	}
	
}