package spring.model.bbs;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BbsDAO implements IBbsDAO {
	
	
	@Autowired
	private SqlSessionTemplate mysql;
	

	public void setMysql(SqlSessionTemplate mysql) {
		this.mysql = mysql;
	}
	

	@Override
	public boolean create(Object dto) throws Exception {
		
		BbsDTO bbsDTO = (BbsDTO)dto;
		boolean flag = false;
		int cnt = mysql.insert("bbs.create", bbsDTO);
		if(cnt>0) flag = true;
		
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {

		return mysql.selectList("bbs.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		
		int bbsno = (Integer)pk;
		
		return mysql.selectOne("bbs.read", bbsno);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		
		BbsDTO bbsDTO = (BbsDTO)dto;
		boolean flag = false;
		int cnt = mysql.update("bbs.update", bbsDTO);
		if(cnt>0) flag = true;
		
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		
		int bbsno = (Integer)pk;
		boolean flag = false;
		int cnt = mysql.delete("bbs.delete", bbsno);
		if(cnt>0) flag = true;
		
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		
		return mysql.selectOne("bbs.total", map);
	}


	@Override
	public void upViewcnt(int bbsno) {
		
		mysql.update("bbs.upViewcnt", bbsno);
	}


	@Override
	public boolean checkPW(Map map) {
		
		boolean flag = false;
		int cnt = mysql.selectOne("bbs.checkPW", map);
		if(cnt>0) flag = true;
		
		return flag;
	}

}
