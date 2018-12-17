package spring.model.notice;

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

public class NoticeDAOTest {
	
	private static NoticeDAO noticeDAO;
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
		noticeDAO = (NoticeDAO)beans.getBean("notice");
	}
	
	@After
	public void tearDown() throws Exception {
	}
	
	@Ignore
	@Test
	public void testCreate() {
		NoticeDTO noticeDTO = new NoticeDTO();
		
		noticeDTO.setSubject("공지사항1");
		noticeDTO.setContent("공지내용1");
		noticeDTO.setFilename("파일1");
		noticeDTO.setNicname("작성자1");
		
		try {
			assertTrue(noticeDAO.create(noticeDTO));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Ignore
	@Test
	public void testList() {
		Map map = new HashMap();
		map.put("col", "subject");
		map.put("word", "회원");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<NoticeDTO>list = null;
		try {
			list = noticeDAO.list(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		assertEquals(list.size(), 2);
	}
	@Ignore
	@Test
	public void testRead() {
		NoticeDTO noticeDTO = null;
		try {
			noticeDTO = (NoticeDTO)noticeDAO.read(2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		assertNotNull(noticeDTO);
	}
	
	@Ignore
	@Test
	public void testUpdate() {
		NoticeDTO noticeDTO = null;
		
		try {
			noticeDTO = (NoticeDTO)noticeDAO.read(2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		noticeDTO.setSubject("공지제목수정1");
		noticeDTO.setContent("공지내용수정1");
		noticeDTO.setFilename("공지파일수정1");
		
		try {
			assertTrue(noticeDAO.update(noticeDTO));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Ignore
	@Test
	public void testDelete() {
		try {
			assertTrue(noticeDAO.delete(6));
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
			total = noticeDAO.total(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		assertEquals(total, 3);
	}
	
	@Ignore
	@Test
	public void testUpviewcnt() {
		noticeDAO.upviewcnt(2);
	}

}
