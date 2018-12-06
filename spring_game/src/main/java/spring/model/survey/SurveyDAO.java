package spring.model.survey;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SurveyDAO implements ISurveyDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
		
	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag = false;
		SurveyDTO surveyDTO = (SurveyDTO)dto;
		int cnt = mybatis.insert("survey.create", surveyDTO);
		if(cnt>0)flag = true;	
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		return mybatis.selectList("survey.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		int sno = Integer.parseInt((String)pk);
		SurveyDTO surveyDTO = mybatis.selectOne("survey.read", sno);		
		return surveyDTO;
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag = false;
		SurveyDTO surveyDTO = (SurveyDTO)dto;
		int cnt = mybatis.update("survey.update",surveyDTO);
		if(cnt>0)flag = true;		
		return flag;
		
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag = false;
		int sno = Integer.parseInt((String)pk);
		int cnt = mybatis.delete("survey.delete",sno);
		if(cnt>0)flag = true;
		
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public List oneToOneList(SqlSessionFactory sqlMapper) throws Exception {
		 
		return  mybatis.selectList("survey.oneToOneList");
	}

}
