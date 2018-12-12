package spring.model.answer;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import spring.model.survey.SurveyDAO;
import spring.model.survey.SurveyDTO;

public class AnswerTest {
	
	private static AnswerDAO answerDAO;
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
		answerDAO=(AnswerDAO)beans.getBean("answer");
	}

	@After
	public void tearDown() throws Exception {
	}
	
	@Ignore
	@Test
	public void testCreate() {
		AnswerDTO answerDTO=new AnswerDTO();
		answerDTO.setChoise(1);
		answerDTO.setContent("만족");
		answerDTO.setChoise(2);
		answerDTO.setContent("보통");
		answerDTO.setChoise(3);
		answerDTO.setContent("불만족");
		try {
			assertTrue(answerDAO.create(answerDTO));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Ignore
	@Test
	public void testDelete() {
		try {
			assertTrue(answerDAO.delete(31));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Ignore
	@Test
	public void testUpdate() {
		AnswerDTO answerDTO=new AnswerDTO();		
		answerDTO.setChoise(1);
		
		try {
			assertTrue(answerDAO.update(answerDTO));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Ignore
	@Test
	public void testRead() {
		AnswerDTO answerDTO =null;
		try {
			answerDTO =(AnswerDTO)answerDAO.read(31);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		assertNotNull(answerDTO);
		
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
			list=answerDAO.list(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		assertEquals(list.size(), 5);
		
	}
	
	@Ignore
	@Test
	public void testTotal() {
		Map map=new HashMap();
		map.put("col", "");
		map.put("word","");
		
		int total=0;
		
		try {
			total=answerDAO.total(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		assertEquals(total, 30);
	}
	
	@Ignore
	@Test
	public void testUpdatepoll() {
		Map map = new HashMap();
		map.put("choise", 3);
		map.put("sno", 1);
		try {
		assertTrue(answerDAO.updatepoll(map));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
