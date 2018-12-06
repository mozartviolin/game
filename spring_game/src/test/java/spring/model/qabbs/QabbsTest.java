package spring.model.qabbs;

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

public class QabbsTest {
	
	private static QabbsDAO qabbsDAO;
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
		qabbsDAO=(QabbsDAO)beans.getBean("qabbs");
	}

	@After
	public void tearDown() throws Exception {
	}
	
	@Ignore
	@Test
	public void testCreate() {
		QabbsDTO dto=new QabbsDTO();
		dto.setNicname("송은");
		dto.setCategory("문의");
		dto.setSubject("제목");
		dto.setContent("문의사항");
		dto.setPasswd("1234");
		
		try {
			assertTrue(qabbsDAO.create(dto));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Ignore
	@Test
	public void testDelete() {
		try {
			assertTrue(qabbsDAO.delete(31));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Ignore
	@Test
	public void testUpdate() {
		QabbsDTO dto=new QabbsDTO();
		dto.setCategory("신고");
		dto.setSubject("제목수정");
		dto.setContent("내용수정");
		dto.setQano(31);
		
		try {
			assertTrue(qabbsDAO.update(dto));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Ignore
	@Test
	public void testRead() {
		QabbsDTO qabbsDTO=null;
		try {
			qabbsDTO=(QabbsDTO)qabbsDAO.read(31);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		assertNotNull(qabbsDTO);
		
	}
	
	@Ignore
	@Test
	public void testList() {
		Map map=new HashMap();
		map.put("col", "");
		map.put("word","");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<QabbsDTO> list=null;
		
		try {
			list=qabbsDAO.list(map);
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
			total=qabbsDAO.total(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		assertEquals(total, 30);
	}
	
	@Ignore
	@Test
	public void testPassCheck() {	
		
		Map map = new HashMap();
		map.put("qano", 2);
		map.put("passwd", "1234");	
		
		try {
			assertTrue(qabbsDAO.passCheck(map));	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Ignore
	@Test
	public void testCheckRefnum() {
		try {
		assertTrue(qabbsDAO.checkRefnum(3));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Ignore
	@Test
	public void testReplyRead() {
		QabbsDTO qabbsDTO=null;
		try {
			qabbsDTO=(QabbsDTO)qabbsDAO.replyRead(22);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		assertNotNull(qabbsDTO);
	}
	
	@Ignore
	@Test
	public void testReplyCreate() {
		
		QabbsDTO qabbsDTO = qabbsDAO.replyRead(3);
		
		qabbsDTO.setNicname("aaa");
		qabbsDTO.setCategory("신고");
		qabbsDTO.setSubject("신고3합니다.");
		qabbsDTO.setContent("게임 신고염33");
		qabbsDTO.setPasswd("1234");
		
		Map map = new HashMap();
		map.put("grpno", qabbsDTO.getGrpno());
		map.put("ansnum", qabbsDTO.getAnsnum());		
		
		qabbsDAO.upAnsnum(map);
				
		try {
			assertTrue(qabbsDAO.replyCreate(qabbsDTO));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
