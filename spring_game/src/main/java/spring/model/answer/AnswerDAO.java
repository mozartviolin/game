package spring.model.answer;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AnswerDAO implements IAnswerDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag = false;
		AnswerDTO answerDTO = (AnswerDTO)dto;
		int cnt = mybatis.insert("answer.create", answerDTO);
		if(cnt>0)flag = true;	
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object read(Object pk) throws Exception {
		int subjectno = Integer.parseInt((String)pk);				
		return mybatis.selectOne("answer.read", subjectno);		
	}

	@Override
	public boolean update(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag = false;
		int subjectno = Integer.parseInt((String)pk);
		int cnt = mybatis.delete("answer.delete",subjectno);
		if(cnt>0)flag = true;		
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public boolean updatepoll(Map map) {		
		boolean flag = false;
		int cnt = mybatis.update("answer.updatepoll",map);
		if(cnt>0)flag = true;		
		return flag;
	}
	
	public int result1View(int subjectno) {
		return mybatis.selectOne("answer.result1View", subjectno);
	}
	public int result2View(int subjectno) {
		return mybatis.selectOne("answer.result2View", subjectno);
	}
	public int result3View(int subjectno) {
		return mybatis.selectOne("answer.result3View", subjectno);
	}

}
