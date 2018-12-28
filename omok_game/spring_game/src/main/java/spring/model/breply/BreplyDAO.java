package spring.model.breply;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BreplyDAO implements IBreplyDAO{
	
	@Autowired
	SqlSessionTemplate mysql;
	

	public void setMysql(SqlSessionTemplate mysql) {
		this.mysql = mysql;
	}
	

	@Override
	public boolean create(Object dto) throws Exception {
		
		BreplyDTO breplyDTO = (BreplyDTO) dto;
		boolean flag = false;
		int cnt = mysql.insert("breply.create", breplyDTO); 
		if(cnt>0) flag = true;
		
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		
		return mysql.selectList("breply.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		
		int breplyno = (Integer)pk;
		
		return mysql.selectOne("breply.read", breplyno);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		
		BreplyDTO breplyDTO = (BreplyDTO) dto;
		boolean flag = false;
		int cnt = mysql.update("breply.update", breplyDTO);
		if(cnt>0) flag = true;
		
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		
		int breplyno = (Integer)pk;
		boolean flag = false;
		int cnt = mysql.delete("breply.delete", breplyno);
		if(cnt>0) flag = true;
		
		return flag;
	}


	@Override
	public boolean bdelete(int bbsno) {
		
		boolean flag = false;
		int cnt = mysql.delete("breply.bdelete", bbsno);
		if(cnt>0) flag = true;
		
		return flag;
	}


	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int total(int bbsno) {
		
		return mysql.selectOne("breply.total", bbsno);
	}

	@Override
	public int rcount(int bbsno) {
		
		return mysql.selectOne("breply.rcount", bbsno);
	}

}
