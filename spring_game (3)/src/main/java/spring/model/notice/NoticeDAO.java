package spring.model.notice;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO implements INoticeDAO {

	@Autowired
	private SqlSessionTemplate mysql;
	
	
	public void setMysql(SqlSessionTemplate mysql) {
		this.mysql = mysql;
	}

	@Override
	public boolean create(Object dto) throws Exception {
		
		NoticeDTO noticedto = (NoticeDTO)dto;
		boolean flag = false;
		int cnt = mysql.insert("notice.create", dto);
		if(cnt>0) flag = true;
		
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		
		return mysql.selectList("notice.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		
		int n_no = (Integer)pk;
		return mysql.selectOne("notice.read",n_no);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		NoticeDTO noticedto = (NoticeDTO)dto;
		boolean flag = false;
		int cnt = mysql.update("notice.update",dto);
		if(cnt>0) flag = true;
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		int n_no = (Integer)pk;
		boolean flag = false;
		int cnt = mysql.delete("notice.delete", n_no);
		if(cnt>0) flag = true;
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		
		return mysql.selectOne("notice.total",map);                                      
	}
	
	@Override
	public void upviewcnt(int n_no) {
		
		mysql.update("notice.upviewcnt",n_no);
	}

	@Override
	public int total(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
