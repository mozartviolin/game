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
	
	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag = false;		
		int cnt = mybatis.insert("qabbs.create", dto);
		if(cnt>0)flag = true;	
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		return mybatis.selectList("qabbs.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
				
		QabbsDTO qabbsDTO = mybatis.selectOne("qabbs.read", pk);
		return qabbsDTO;
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag = false;
		int cnt = mybatis.update("qabbs.update", dto);
		if(cnt>0)flag = true;
		
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag = false;
		int cnt = mybatis.delete("qabbs.delete",pk);
		if(cnt>0)flag = true;
		
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		return mybatis.selectOne("qabbs.total", map);
	}

}
