package spring.sts.game;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

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

import spring.model.member.MemberDAO;
import spring.model.member.MemberDTO;


public class MemberDAOTest {
	
	private static MemberDAO memberDAO;
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
		memberDAO = (MemberDAO)beans.getBean("member");
	}

	@After
	public void tearDown() throws Exception {
	}
	
	@Test
	public void testDelete() {
		try {
			assertTrue(memberDAO.delete("ccc"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Ignore
	@Test
	public void testDupliID() {
		
		assertTrue(memberDAO.dupliID("ccc"));
	}
	@Ignore
	@Test
	public void testDupliNic() {
		
		assertTrue(memberDAO.dupliNic("cca"));
	}
	@Ignore
	@Test
	public void testLoginCheck() {
		
		Map map = new HashMap();
		map.put("id", "ccc");
		map.put("passwd", "1234");
		
		assertNotNull(memberDAO.loginCheck(map));
		
	}
	@Ignore
	@Test
	public void testSearchID() {
		
		Map map = new HashMap();
		map.put("mname", "아로미");
		map.put("nicname", "cca");
		
		assertNotNull(memberDAO.searchID(map));
	}
	@Ignore
	@Test
	public void testSearchPW() {
		
		Map map = new HashMap();
		map.put("mname", "아로미");
		map.put("id", "ccc");
		
		assertNotNull(memberDAO.searchPW(map));
		
	}
	
	@Ignore
	@Test
	public void testUpdate() {
		
		MemberDTO memberDTO = null;
		
		try {
			memberDTO = (MemberDTO) memberDAO.read("ccc");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		memberDTO.setNicname("cca");
		memberDTO.setPasswd("1234");
		
		try {
			assertTrue(memberDAO.update(memberDTO));
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
			total = memberDAO.total(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		assertEquals(total, 3);
	}
	
	@Ignore
	@Test
	public void testList() {
		
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 10);
		
		List<MemberDTO> list = null;
		
		try {
			list = memberDAO.list(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		assertEquals(list.size(), 3);
	}
	

	@Ignore
	@Test
	public void testRead() {
	
		MemberDTO memberDTO = null;
		try {
			memberDTO = (MemberDTO)memberDAO.read("ccc");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		assertNotNull(memberDTO);
	}
	
	@Ignore
	@Test
	public void testCreate() {
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO.setId("ccc");
		memberDTO.setNicname("ccc");
		memberDTO.setMname("아로미");
		memberDTO.setPasswd("123");
		try {
			assertTrue(memberDAO.create(memberDTO));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
