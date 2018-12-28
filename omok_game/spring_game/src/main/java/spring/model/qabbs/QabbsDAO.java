package spring.model.qabbs;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QabbsDAO implements IQabbsDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag = false;	
		int cnt = mybatis.insert("qabbs.create", (QabbsDTO)dto);
		if(cnt>0)flag = true;	
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		return mybatis.selectList("qabbs.list", map);
	}
	
	@Override
	public Object read(Object pk) throws Exception {
		int qano = (Integer)pk;		
		QabbsDTO qabbsDTO = mybatis.selectOne("qabbs.read", qano);
		return qabbsDTO;
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag = false;
		int cnt = mybatis.update("qabbs.update", (QabbsDTO)dto);
		if(cnt>0)flag = true;		
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag = false;
		int qano = (Integer)pk;
		int cnt = mybatis.delete("qabbs.delete", qano);
		if(cnt>0)flag = true;
		
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		return mybatis.selectOne("qabbs.total", map);
	}
	
	@Override
	public boolean replyCreate(QabbsDTO qabbsDTO) {
		boolean flag = false;
		int cnt = mybatis.insert("qabbs.replyCreate", qabbsDTO);
		if(cnt>0)flag = true;				
		return flag;
		
	}
	
	@Override
	public void upAnsnum(Map map){
		mybatis.update("qabbs.upAnsnum", map);
		
	}
	
	@Override
	public QabbsDTO replyRead(int qano) {		
		return mybatis.selectOne("qabbs.replyRead", qano);
	}
	
	@Override
	public boolean passCheck(Map map) {
		boolean flag = false;
		int cnt = mybatis.selectOne("qabbs.passCheck", map);
		if(cnt>0) flag = true;		
		return flag;	
	}
	
	@Override
	public boolean checkRefnum(int qano) {
		boolean flag = false;		
		int cnt = mybatis.selectOne("qabbs.checkRefnum", qano);
		if(cnt>0) flag=true;			
		return flag;	
	}
	
	@Override
	public void upViewcount(int qano) {
		
		mybatis.update("qabbs.upViewcount", qano);
		
	}
	
	@Override
	public void mViewcount(int qano) {
		
		mybatis.update("qabbs.mViewcount", qano);
	}

}
