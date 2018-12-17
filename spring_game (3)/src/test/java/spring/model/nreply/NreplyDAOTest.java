package spring.model.nreply;

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

import spring.model.message.MessageDAO;


public class NreplyDAOTest {
	
	private static NreplyDAO nreplyDAO;
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
		nreplyDAO = (NreplyDAO)beans.getBean("nreply");
	}

	@After
	public void tearDown() throws Exception {
	}
	
	@Ignore
	@Test
	public void testCreate() {
		NreplyDTO nreplyDTO = new NreplyDTO();
		
		nreplyDTO.setNreplyno(3);
		nreplyDTO.setContent("내용1");
		nreplyDTO.setNicname("닉네임1");
		nreplyDTO.setN_no(2);
		
		try {
			assertTrue(nreplyDAO.create(nreplyDTO));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	@Test
	public void testList() {
		Map map = new HashMap();
		map.put("n_no",2);
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<NreplyDTO> list = null;
		try {
			list = nreplyDAO.list(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		assertEquals(list.size(),1);
	}
	
	@Ignore
	@Test
	public void testRead() {
		NreplyDTO nreplyDTO = null;
		try {
			nreplyDTO = (NreplyDTO)nreplyDAO.read(2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		assertNotNull(nreplyDTO);
	}
	
	@Ignore
	@Test
	public void testUpdate() {
		NreplyDTO nreplyDTO = null;
		
		try {
			nreplyDTO = (NreplyDTO) nreplyDAO.read(2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		nreplyDTO.setContent("zzzzz");
		
		try {
			assertTrue(nreplyDAO.update(nreplyDTO));
		} catch (Exception e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Ignore
	@Test
	public void testDelete() {
		try {
			assertTrue(nreplyDAO.delete(3));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
