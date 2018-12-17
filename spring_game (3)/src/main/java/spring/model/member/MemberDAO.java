package spring.model.member;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO implements IMemeberDAO{
	
	@Autowired
	private SqlSessionTemplate mysql;
	

	public void setMysql(SqlSessionTemplate mysql) {
		this.mysql = mysql;
	}

	@Override
	public boolean create(Object dto) throws Exception {

		MemberDTO memberDTO = (MemberDTO) dto; 
		
		boolean flag = false;
		int cnt = mysql.insert("member.create", memberDTO);
		if(cnt>0) flag = true;
		
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		
		return mysql.selectList("member.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {

		String id = (String)pk;
		
		return mysql.selectOne("member.read", id);
	}

	@Override
	public boolean update(Object dto) throws Exception {

		MemberDTO memberDTO = (MemberDTO)dto;
		boolean flag = false;
		int cnt = mysql.update("member.update", memberDTO);
		if(cnt>0) flag = true;
		
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		
		String id = (String)pk;
		boolean flag = false;
		int cnt = mysql.delete("member.delete", id);
		if(cnt>0) flag = true;
		
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		
		return mysql.selectOne("member.total", map);
	}

	@Override
	public boolean dupliID(String id) {
		
		boolean flag = false;
		int cnt = mysql.selectOne("member.dupliID", id);
		if(cnt>0) flag = true;
		
		return flag;
	}

	@Override
	public boolean dupliNic(String nicname) {
		
		boolean flag = false;
		int cnt = mysql.selectOne("member.dupliNic", nicname);
		if(cnt>0) flag = true;
		
		return flag;
	}

	@Override
	public boolean loginCheck(Map map) {
		boolean flag = false;
		
		int cnt = mysql.selectOne("member.loginCheck", map);
		if(cnt>0) flag = true;
		
		return flag;
	}

	@Override
	public String searchID(Map map) {

		return mysql.selectOne("member.searchID", map);
	}

	@Override
	public String searchPW(Map map) {
		
		return mysql.selectOne("member.searchPW", map);
	}

	@Override
	public Map getGradeAnicname(String id) {
		// TODO Auto-generated method stub
		return mysql.selectOne("member.getGrade", id);
	}

	@Override
	public int total(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
