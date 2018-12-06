package spring.model.survey;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import spring.model.qabbs.QabbsDAO;
import spring.model.qabbs.QabbsDTO;

public class SurveyTest {
	
	private static SurveyDAO surveyDAO;
	private static BeanFactory beans;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource=new ClassPathResource("daoTest.xml");
		beans = new XmlBeanFactory(resource);
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		surveyDAO=(SurveyDAO)beans.getBean("survey");
	}

	@After
	public void tearDown() throws Exception {
	}
	
	private static SqlSessionFactory sqlMapper;
	
	@Ignore
	@Test
	public void testCreate() {
		SurveyDTO dto=new SurveyDTO();
		dto.setSubject("게임 만족도 ?");
				
		try {
			assertTrue(surveyDAO.create(dto));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Ignore
	@Test
	public void testDelete() {
		try {
			assertTrue(surveyDAO.delete(31));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Ignore
	@Test
	public void testUpdate() {
		SurveyDTO surveyDTO=new SurveyDTO();		
		surveyDTO.setSubject("제목수정");		
		
		try {
			assertTrue(surveyDAO.update(surveyDTO));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Ignore
	@Test
	public void testRead() {
		SurveyDTO surveyDTO =null;
		try {
			surveyDTO =(SurveyDTO)surveyDAO.read(31);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		assertNotNull(surveyDTO);
		
	}
	
	@Ignore
	@Test
	public void testList() {
		Map map=new HashMap();
		map.put("col", "");
		map.put("word","");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<SurveyDTO> list=null;
		
		try {
			list=surveyDAO.list(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		assertEquals(list.size(), 5);
		
	}
	
	@Ignore
	@Test
	public void testOneToOneList() {
		
		List list = null;
		try{
			list = surveyDAO.oneToOneList(sqlMapper);
		}catch(Exception e){
			System.out.println(e);
		}
		assertEquals(list.size(), 5);
		
	}
	

}
