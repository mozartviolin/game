package spring.sts.game;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.bbs.BbsDAO;
import spring.model.bbs.BbsDTO;
import spring.model.breply.BreplyDAO;
import spring.model.breply.BreplyDTO;
import spring.model.member.MemberDAO;
import spring.model.member.MemberDTO;
import spring.utility.game.Utility;

@Controller
public class BbsController {
	
	@Autowired
	private BbsDAO bbsDAO;
	@Autowired
	private BreplyDAO breplyDAO;
	
	
	@RequestMapping("/bbs/rdelete")
	public String rdelete(int bbsno, int nPage, String nowPage, String col,
			String word, Model model, int breplyno) {
		
		int total = breplyDAO.total(bbsno);
		int totalPage = (int)(Math.ceil((double)total/3));
		
		boolean flag = false;
		try {
			flag = breplyDAO.delete(breplyno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(flag) {
			if(nPage!=1 && nPage==totalPage && total%3==1) {
				nPage = nPage - 1;
			}
			
			model.addAttribute("bbsno", bbsno);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("nPage", nPage);
			
			return "redirect:read";
			
		}else {
			
			return "/error/error";
		}
		
	}
	
	@RequestMapping("/bbs/rupdate")
	public String rupdate(BreplyDTO breplyDTO, Model model, String nowPage, String col, 
			String word, String nPage) {
		
		boolean flag = false;
		try {
			flag = breplyDAO.update(breplyDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(flag) {
			
			model.addAttribute("bbsno", breplyDTO.getBbsno());
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("nPage", nPage);
			
			return "redirect:read";
		}else {
			
			return "/error/error";
		}
	}
	
	@RequestMapping("/bbs/rcreate")
	public String rcreate(BreplyDTO breplyDTO, Model model, String nowPage, String col, 
			String word, HttpSession session) {
		
		boolean flag = false;
		
		try {
			flag = breplyDAO.create(breplyDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		breplyDTO.setNicname((String)session.getAttribute("nicname"));
		
		if(flag) {
			model.addAttribute("bbsno", breplyDTO.getBbsno());
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			
			return "redirect:read";
		}else {
			
			return "/error/error";
		}
	}
	
	@RequestMapping(value="/bbs/delete", method=RequestMethod.GET)
	public String delete() {
		
		return "/bbs/delete";
	}
	
	@RequestMapping(value="/bbs/delete", method=RequestMethod.POST)
	public String delete(int bbsno, String passwd, Model model, HttpServletRequest request, String oldfile,
			String col, String word, int nowPage) {
		
		String upDir = request.getRealPath("bbs/storage");
		
		Map map = new HashMap();
		map.put("bbsno", bbsno);
		map.put("passwd", passwd);
		map.put("col", col);
		map.put("word", word);
		
		String url = "";
		
		int total = 0;
		
		try {
			total = bbsDAO.total(map);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 
		int totalPage = (int)(Math.ceil((double)total/10));
		
		boolean pflag = bbsDAO.checkPW(map);
		
		if(pflag) {
			
			try {
				if(bbsDAO.delete(bbsno)) {
					
					if(nowPage!=1 && nowPage==totalPage && total%10==1) {
						nowPage = nowPage - 1;
					}
					
					Utility.deleteFile(upDir, oldfile);
					
					model.addAttribute("col", col);
					model.addAttribute("word", word);
					model.addAttribute("nowPage", nowPage);
					
					url = "redirect:/bbs/list";
				}else {
					
					url = "/error/error";
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			
			url = "/error/passwdError";
		}
		
		return url;
	}
	
	@RequestMapping(value="/bbs/update", method=RequestMethod.GET)
	public String update(int bbsno, Model model) {
		
		BbsDTO bbsDTO = null;
		
		try {
			bbsDTO = (BbsDTO) bbsDAO.read(bbsno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("bbsDTO", bbsDTO);
		return "/bbs/update";
	}
	
	@RequestMapping(value="/bbs/update", method=RequestMethod.POST)
	public String update(BbsDTO bbsDTO, HttpServletRequest request, Model model, String oldfile) {
		
		String upDir = request.getRealPath("bbs/storage");
		
		Map map = new HashMap();
		map.put("bbsno", bbsDTO.getBbsno());
		map.put("passwd", bbsDTO.getPasswd());
		
		int filesize = (int)bbsDTO.getFilenameMF().getSize();
		String filename = "";
		String url = "";
		
		boolean pflag = bbsDAO.checkPW(map);
		
		if(pflag) {
			if(filesize>0) {
				if(oldfile != null) {
					
					Utility.deleteFile(upDir, oldfile);
					filename = Utility.saveFileSpring(bbsDTO.getFilenameMF(), upDir);
				
				}
			}else {
				
				filename = oldfile;
			}
			
			bbsDTO.setFilename(filename);
			
			try {
				if(bbsDAO.update(bbsDTO)) {
					
					model.addAttribute("col", request.getParameter("col"));
					model.addAttribute("word", request.getParameter("word"));
					model.addAttribute("nowPage", request.getParameter("nowPage"));
					
					url = "redirect:/bbs/list";
				}else {
					
					url = "/error/error";
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			
			url = "/error/passwdError";
		}
		
		return url;
		
	}
	
	@RequestMapping("/bbs/read")
	public String read(int bbsno, Model model, HttpServletRequest request) {
		
		bbsDAO.upViewcnt(bbsno);
		BbsDTO bbsDTO = null;
		try {
			bbsDTO = (BbsDTO) bbsDAO.read(bbsno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String img = ""; 
		
		if(bbsDTO.getFilename()!=null) {
		
			String end = bbsDTO.getFilename();
			
			if(end.substring(end.length()-3, end.length()).equals("jpg") ||
					end.substring(end.length()-3, end.length()).equals("png") ||
					end.substring(end.length()-3, end.length()).equals("gif")) {
				
				img = bbsDTO.getFilename();
			}else {
				
				img = "";
			}
			model.addAttribute("img", img);
		}
		
		model.addAttribute("bbsDTO", bbsDTO);
		model.addAttribute("content", bbsDTO.getContent().replaceAll("\r\n","<br>"));
		
		
		/*댓글*/
		String url = "read";
		int nPage = 1;
		if(request.getParameter("nPage")!=null) {
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}
		
		int recordPerPage = 3;
		int sno = ((nPage - 1) * recordPerPage) + 1;
		int eno = nPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("bbsno", bbsno);
		
		List<BreplyDTO> rlist = null;
		
		try {
			rlist = breplyDAO.list(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int total = breplyDAO.total(bbsno);
		int nowPage = Integer.parseInt(request.getParameter("nowPage"));
		String col = request.getParameter("col");
		String word = request.getParameter("word");
		
		String paging = Utility.rpaging3(total, nowPage, recordPerPage, col, word, bbsno, nPage, url);
		
		model.addAttribute("rlist", rlist);
		model.addAttribute("nPage", nPage);
		model.addAttribute("paging", paging);
		
		return "/bbs/read";
	}
	
	@RequestMapping(value="/bbs/create", method=RequestMethod.GET)
	public String create(String id, HttpSession session, Model model,
			HttpServletRequest request) {
		
		if(session.getAttribute("id")==null) {
			return "/member/login";
			
		}else {
			return "/bbs/create";
		}
	}
	
	@RequestMapping(value="/bbs/create", method=RequestMethod.POST)
	public String create(BbsDTO bbsDTO, HttpServletRequest request,HttpSession session) {
		
		String upDir = request.getRealPath("/bbs/storage");
		String filename = "";
		
		if(filename!=null)
			filename = Utility.saveFileSpring(bbsDTO.getFilenameMF(), upDir);
		
		bbsDTO.setFilename(filename);
		bbsDTO.setNicname((String)session.getAttribute("nicname"));
		boolean flag = false;
		
		try {
			flag = bbsDAO.create(bbsDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		if(flag) {
				
			return "redirect:/bbs/list";
		}else {
			Utility.deleteFile(upDir, filename);
				
			return "/error/error";
		}
					
	}
	
	@RequestMapping("/bbs/list")
	public String list(HttpServletRequest request, Model model) {
		
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		if(col.equals("total")) word = "";
		
		int nowPage = 1;
		int recordPerPage = 10;
		if(request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		int sno = ((nowPage - 1) * recordPerPage) + 1; 
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		List<BbsDTO> list = null;
		
		try {
			list = bbsDAO.list(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int totalRecord = 0;
		
		try {
			totalRecord = bbsDAO.total(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("breplyDAO", breplyDAO);
		
		return "/bbs/list";
	}

}