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

import spring.model.breply.BreplyDAO;
import spring.model.breply.BreplyDTO;

public class BreplyDAOTest {
	
	private static BreplyDAO breplyDAO;
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
		breplyDAO = (BreplyDAO)beans.getBean("breply");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Ignore
	@Test
	public void testCreate() {
		
		BreplyDTO breplyDTO = new BreplyDTO();
		
		breplyDTO.setBbsno(1);
		breplyDTO.setContent("댓내용");
		breplyDTO.setNicname("cca");
		
		try {
			assertTrue(breplyDAO.create(breplyDTO));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Ignore
	@Test
	public void testList() {
		Map map = new HashMap();
		
		map.put("bbsno", 1);
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<BreplyDTO> list = null;
		try {
			list = breplyDAO.list(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		assertEquals(list.size(), 2);
	}

	@Ignore
	@Test
	public void testRead() {
		BreplyDTO breplyDTO = null;
		
		try {
			breplyDTO = (BreplyDTO)breplyDAO.read(1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		assertNotNull(breplyDTO);
	}

	@Ignore
	@Test
	public void testUpdate() {
		BreplyDTO breplyDTO = null;
		
		try {
			breplyDTO = (BreplyDTO) breplyDAO.read(1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		breplyDTO.setContent("변경");
		
		try {
			assertTrue(breplyDAO.update(breplyDTO));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Ignore
	@Test
	public void testDelete() {
		try {
			assertTrue(breplyDAO.delete(1));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Ignore
	@Test
	public void testTotal() {
		
		int total = 0;
		
		try {
			total = breplyDAO.total(1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		assertEquals(total, 2);
	}

	@Test
	public void testBdelete() {
		assertTrue(breplyDAO.bdelete(1));
	}

}
