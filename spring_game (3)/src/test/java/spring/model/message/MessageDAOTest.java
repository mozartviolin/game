package spring.model.message;

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


public class MessageDAOTest {
	
	private static MessageDAO messageDAO;
	private static BeanFactory beans;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("daoTest.xml");
		beans = new XmlBeanFactory(resource);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception { 
		messageDAO = (MessageDAO)beans.getBean("message");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Ignore
	@Test
	public void testCreate() {
		MessageDTO messageDTO = new MessageDTO();
		
		messageDTO.setMefrom("이이경2");
		messageDTO.setMeto("한세경2");
		messageDTO.setSubject("제목12");
		messageDTO.setContent("내용12");
		
		try {
			assertTrue(messageDAO.create(messageDTO));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
	
	@Ignore
	@Test
	public void testList() {
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 10);
		
		List<MessageDTO> list = null;
		try {
			list = messageDAO.list(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		assertEquals(list.size(), 5);
	}

	@Ignore
	@Test
	public void testRead() {
		MessageDTO messageDTO = null;
		try {
			messageDTO = (MessageDTO) messageDAO.read(2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		assertNotNull(messageDTO);
	}

	@Ignore
	@Test
	public void testUpviewcnt() {
		messageDAO.upviewcnt(2);
	}


	@Ignore
	@Test
	public void testDelete() {
		try {
			assertTrue(messageDAO.delete(5));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


}
