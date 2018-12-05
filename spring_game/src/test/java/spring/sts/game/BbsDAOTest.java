package spring.sts.game;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

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

import spring.model.bbs.BbsDAO;
import spring.model.bbs.BbsDTO;

public class BbsDAOTest {
	
	private static BbsDAO bbsDAO;
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
		bbsDAO = (BbsDAO)beans.getBean("bbs");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Ignore
	@Test
	public void testCreate() {
		
		BbsDTO bbsDTO = new BbsDTO();
		bbsDTO.setContent("내용ㅇㅇㅇ");
		bbsDTO.setSubject("제모모목");
		bbsDTO.setFilename("fil.txt");
		bbsDTO.setPasswd("123");
		bbsDTO.setNicname("cca");
		
		try {
			assertTrue(bbsDAO.create(bbsDTO));
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
		
		List<BbsDTO> list = null;
		try {
			list = bbsDAO.list(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		assertEquals(list.size(), 3);
	}

	@Ignore
	@Test
	public void testRead() {
		
		BbsDTO bbsDTO = null;
		
		try {
			bbsDTO = (BbsDTO)bbsDAO.read(1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		assertNotNull(bbsDTO);
	}

	@Ignore
	@Test
	public void testUpdate() {
		
		BbsDTO bbsDTO = null;
		
		try {
			bbsDTO = (BbsDTO) bbsDAO.read(2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		bbsDTO.setContent("바꾸기");
		bbsDTO.setSubject("제모모모목");
		bbsDTO.setFilename("text.txt");
		
		try {
			assertTrue(bbsDAO.update(bbsDTO));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void testDelete() {
		
		try {
			assertTrue(bbsDAO.delete(3));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Ignore
	@Test
	public void testTotal() {
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		
		int total = 0;
		
		try {
			total = bbsDAO.total(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		assertEquals(total, 3);
	}

	
	@Test
	public void testCheckPW() {
		
		Map map = new HashMap();
		map.put("nicname", "bb");
		map.put("passwd", "123");
		
		assertNotNull(bbsDAO.checkPW(map));
	}

}
