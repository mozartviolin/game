package spring.model.qabbs;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QReplyDAO implements IQReplyDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag = false;		
		int cnt = mybatis.insert("qreply.rcreate", (QReplyDTO)dto);
		if(cnt>0)flag=true;
		return flag;		
	}

	@Override
	public List list(Map map) throws Exception {
		return mybatis.selectList("qreply.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		int rnum = (Integer)pk;		
		return mybatis.selectOne("qreply.read", rnum);		
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag= false;
		int cnt = mybatis.update("qreply.update", (QReplyDTO)dto);
		if(cnt>0)flag=true;
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag = false;
		int rnum = (Integer)pk;
		int cnt = mybatis.delete("qreply.delete", rnum);
		if(cnt>0)flag=true;
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int qrtotal(int qano) {
		return mybatis.selectOne("qreply.total", qano);
	}
	
	public boolean bdelete(int qano) {
		boolean flag = false;
		int cnt = mybatis.delete("qreply.bdelete", qano);
		if(cnt>0)flag=true;
		return flag;
	}
	
	public int rcount(int qano){
	    return mybatis.selectOne("qreply.rcount", qano);
	}
	
}
