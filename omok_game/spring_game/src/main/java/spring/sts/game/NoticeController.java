package spring.sts.game;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.notice.NoticeDAO;
import spring.model.notice.NoticeDTO;
import spring.model.nreply.NreplyDAO;
import spring.model.nreply.NreplyDTO;
import spring.utility.game.Utility;


@Controller
public class NoticeController {
	

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private NreplyDAO nreplyDAO;
	
	@RequestMapping("/notice/rdelete")
	public String rdelete(int nreplyno,int n_no, Model model, String nowPage,String col,
			String word, int nPage) {
		
		int total = 0;
		try {
			total = nreplyDAO.total(n_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int totalPage = (int) Math.ceil((double)total/3);
		
		
		try {
			if(nreplyDAO.delete(nreplyno)) {
				if(nPage!=1 && nPage==totalPage && total%3==1) {
					nPage =nPage-1;
				}
				model.addAttribute("n_no", n_no);
				model.addAttribute("nowPage",nowPage);
				model.addAttribute("col",col);
				model.addAttribute("word",word);
				model.addAttribute("nPage",nPage);
				return "redirect:/notice/read";
			}else {
				return "/error/error";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/notice/read";
	}
	
	@RequestMapping("/notice/rupdate")
	public String rupdate(NreplyDTO nreplyDTO, Model model, String nowPage,String col,
			String word, String nPage) {
		
		try {
			if(nreplyDAO.update(nreplyDTO)) {
				model.addAttribute("n_no", nreplyDTO.getN_no());
				model.addAttribute("nowPage",nowPage);
				model.addAttribute("col",col);
				model.addAttribute("word",word);
				model.addAttribute("nPage",nPage);
				return "redirect:/notice/read";	
			}else {
				return "/error/error";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/notice/read";
	}
	
	
	@RequestMapping("/notice/rcreate")
	public String rcreate(NreplyDTO nreplyDTO,Model model,
			String nowPage, String col, String word) {
		
		try {
			if(nreplyDAO.create(nreplyDTO)) {
				model.addAttribute("n_no",nreplyDTO.getN_no());
				model.addAttribute("nowPage",nowPage);
				model.addAttribute("col",col);
				model.addAttribute("word",word);
				return "redirect:/notice/read";	
			}else {
				return "/error/error";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/notice/read";
	}
	
//------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/notice/delete", method = RequestMethod.GET)
	public String delete(int n_no, HttpServletRequest request) {

		return "/notice/delete";
	}

	@RequestMapping(value = "/notice/delete", method = RequestMethod.POST)
	public String delete(int n_no,HttpServletRequest request, String oldfile, Model model) {

		String basePath = request.getRealPath("/notice/storage");
					
			try {
				if (noticeDAO.delete(n_no)) {
					Utility.deleteFile(basePath, oldfile);
					model.addAttribute("nowPage", request.getParameter("nowPage"));
					model.addAttribute("col", request.getParameter("col"));
					model.addAttribute("word", request.getParameter("word"));
					model.addAttribute("oldfile", request.getParameter("oldfile"));
					
					return "redirect:/notice/list";
				} else {
					return "/error/error";
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "/notice/list";

		} 

	@RequestMapping(value = "/notice/update", method = RequestMethod.GET)
	public String update(int n_no, Model model) {

		NoticeDTO noticeDTO = null;
		
		try {
			noticeDTO = (NoticeDTO) noticeDAO.read(n_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addAttribute("noticeDTO", noticeDTO);

		return "/notice/update";
	}

	@RequestMapping(value = "/notice/update", method = RequestMethod.POST)
	public String update(NoticeDTO noticeDTO, HttpServletRequest request, String oldfile,Model model) {

		String basePath = request.getRealPath("/notice/storage");

		String filename = "";
		int filesize = (int)noticeDTO.getFilenameMF().getSize();
		
		if(filesize>0) {
				if (oldfile != null)
					Utility.deleteFile(basePath, oldfile);
				filename = Utility.saveFileSpring(noticeDTO.getFilenameMF(), basePath);
			}

			noticeDTO.setFilename(filename);
			noticeDTO.setFilesize(filesize);

			try {
				if (noticeDAO.update(noticeDTO)) {
					model.addAttribute("nowPage", request.getParameter("nowPage"));
					model.addAttribute("col", request.getParameter("col"));
					model.addAttribute("word", request.getParameter("word"));
					model.addAttribute("oldfile", request.getParameter("filename"));
					return "redirect:/notice/list";
				} else {
					return "/error/error";
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "/notice/list";
		}

	@RequestMapping("/notice/read")
	public String read(int n_no, Model model,HttpServletRequest request) {

		noticeDAO.upviewcnt(n_no);

		NoticeDTO noticeDTO = null;
		try {
			noticeDTO = (NoticeDTO) noticeDAO.read(n_no);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
//		noticeDTO.setContent(content);

		model.addAttribute("dto", noticeDTO);
		model.addAttribute("content", noticeDTO.getContent().replaceAll("\r\n", "<br>"));
		
		// 댓글 처리
				String url = "read"; //댓글페이지에 매개변수
				int nPage = 1;
				if(request.getParameter("nPage")!=null) {
					nPage=Integer.parseInt(request.getParameter("nPage"));
				}
				int recordPerPage=3;
				int sno = ((nPage-1)*recordPerPage)+1;
				int eno = nPage*recordPerPage;
				
				Map map = new HashMap();
				map.put("sno", sno);
				map.put("eno", eno);
				map.put("n_no", n_no);
				
				List<NreplyDTO> rlist = null;
				try {
					rlist = nreplyDAO.list(map);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				int total = 0;
				try {
					total = nreplyDAO.total(n_no);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				  
				int nowPage= Integer.parseInt
						(request.getParameter("nowPage"));
				String col = request.getParameter("col");
				String word = request.getParameter("word");
				String paging = Utility.rpaging3(total, nowPage, recordPerPage, col, word, 
						n_no, nPage, url);
				
				model.addAttribute("rlist",rlist);
				model.addAttribute("paging",paging);
				model.addAttribute("nPage",nPage);
				model.addAttribute("col", col);
				model.addAttribute("word", word);
			

		return "/notice/read";
	}

	@RequestMapping(value = "/notice/create", method = RequestMethod.POST)
	public String create(NoticeDTO noticeDTO, HttpServletRequest request) {

		String basePath = request.getRealPath("/notice/storage");
		int filesize = (int) noticeDTO.getFilenameMF().getSize();
		String filename = "";

		if (filesize > 0)
			filename=Utility.saveFileSpring(noticeDTO.getFilenameMF(), basePath);

		noticeDTO.setFilesize(filesize);
		noticeDTO.setFilename(filename);

		boolean flag = false;
		try {
			flag = noticeDAO.create(noticeDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (flag) {
			return "redirect:/notice/list";

		} else {
			if (!filename.equals(""))
				Utility.deleteFile(basePath, filename);
			return "error/error";
		}
	}

	@RequestMapping(value = "/notice/create", method = RequestMethod.GET)
	public String create() {
		
		return "/notice/create";
	}

	@RequestMapping("/notice/list")
	public String list(HttpServletRequest request, Model model) {

		// 검색관련 처리
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total"))
			word = "";

		// 페이징 관련
		int nowPage = 1;
		int recordPerPage = 5;

		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
			// 넘버포맷익셉션이 일어날 수 있음. 널 값일 때 불러올 수 있기 때문
		}

		// DB에서 가져올 레코드 순번
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		List<NoticeDTO> list = null;
		try {
			list = noticeDAO.list(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 전체 레코드 갯수의 필요한 매개변수(col,word). 비교해야함
		int totalRecord = 0;
		try {
			totalRecord = noticeDAO.total(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nreplyDAO", nreplyDAO);

		return "/notice/list";
	}

}
