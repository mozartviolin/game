package spring.model.user;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.model.member.MemberDTO;




@Repository
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
		
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	
	
	public boolean create(String nicname) {
		boolean flag = false;
		int cnt=mybatis.insert("userlist.create",nicname);
		if(cnt>0)
			flag=true;
		return flag;

	}
	
	public boolean delete(String nicname) {
		boolean flag = false;
		int cnt = mybatis.delete("userlist.delete",nicname);
		if(cnt>0)
			flag=true;
		return flag;

	}
	
	public List<UserDTO> list() {
		return mybatis.selectList("userlist.list");
	}





}
