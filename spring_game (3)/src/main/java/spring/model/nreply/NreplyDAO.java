package spring.model.nreply;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NreplyDAO implements INreplyDAO {
	
	
	public void setMysql(SqlSessionTemplate mysql) {
		this.mysql = mysql;
	}

	@Autowired
	private SqlSessionTemplate mysql;
	
	@Override
	public boolean create(Object dto) throws Exception {
		NreplyDTO nreplydto = (NreplyDTO)dto;
		boolean flag = false;
		int cnt = mysql.insert("nreply.create",nreplydto);
		if(cnt>0) flag = true;
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		
		return mysql.selectList("nreply.list",map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		int nreplyno = (Integer)pk;
		return mysql.selectOne("nreply.read",nreplyno);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		NreplyDTO nreplydto = (NreplyDTO)dto;
		boolean flag = false;
		int cnt = mysql.update("nreply.update",nreplydto);
		if(cnt>0) flag = true;
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		int nreplyno = (Integer)pk;
		boolean flag = false;
		int cnt = mysql.delete("nreply.delete",nreplyno);
		if(cnt>0) flag = true;
		return flag;
	}

	@Override
	public int total(Object pk) throws Exception {
		 
		int n_no = (Integer)pk;
		return mysql.selectOne("nreply.total",n_no);
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}



}
