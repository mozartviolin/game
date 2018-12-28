package spring.model.message;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAO implements IMessageDAO{
	
	@Autowired
	private SqlSessionTemplate mysql;
	
	public void setMysql(SqlSessionTemplate mysql) {
		this.mysql = mysql;
	}
	
	@Override
	public boolean nicCheck(String meto) throws Exception {		
		boolean flag = false;
		int cnt = mysql.selectOne("message.nicCheck", meto);
		if(cnt>0) flag = true;
		return flag;
	}
	
	
	
	@Override
	public int count(int mno){
	    return mysql.selectOne("message.count", mno);
	}
	

	@Override
	public boolean create(Object dto) throws Exception {
		MessageDTO messageDTO=(MessageDTO)dto;
		boolean flag = false;
		int cnt = mysql.insert("message.create", dto);
		if(cnt>0) flag = true;
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		
		return mysql.selectList("message.list",map);
		
	}
	
	@Override
	public List fromlist(Map map) throws Exception{
		return mysql.selectList("message.fromlist",map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		int mno = (Integer)pk;
		return mysql.selectOne("message.read",mno);
	}

	@Override
	public boolean update(Object dto) throws Exception {

		return false;
		
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		int mno = (Integer)pk;
		boolean flag = false;
		int cnt = mysql.delete("message.delete",mno);
		if(cnt>0) flag = true;
		return flag;
	}
	
	@Override
	public void upviewcnt(int mno) {
		mysql.update("message.upviewcnt",mno);
	}

	@Override
	public int total(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
