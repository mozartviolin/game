package spring.sts.game;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.qabbs.QabbsDAO;
import spring.model.qabbs.QabbsDTO;
import spring.utility.game.Utility;

@Controller
public class QabbsController {

	@Autowired
	private QabbsDAO qabbsDAO;
	
	@RequestMapping(value="/qabbs/create", method=RequestMethod.POST)
	public String create(QabbsDTO qabbsDTO, Model model, HttpServletRequest request) throws Exception{
		boolean flag = false;		
		flag = qabbsDAO.create(qabbsDTO);	
		
		if(flag) {
			return "redirect:/qabbs/list";
		}else {
			return "error/error";
		}
		
		}
	
	@RequestMapping(value="/qabbs/create", method=RequestMethod.GET)
	public String create() {
		
		return "/qabbs/create";
	}
	
	@RequestMapping(value="/qabbs/read")
	public String read(int qano, Model model, HttpServletRequest request) throws Exception {
		
		qabbsDAO.upViewcount(qano);
		QabbsDTO qabbsDTO = (QabbsDTO) qabbsDAO.read(qano);		
		
		model.addAttribute("qabbsDTO", qabbsDTO);
		model.addAttribute("content", qabbsDTO.getContent().replaceAll("\r\n","<br>"));
		
		return "/qabbs/read";
	}
	
	@RequestMapping(value="/qabbs/update", method=RequestMethod.POST)
	public String update(QabbsDTO qabbsDTO, HttpServletRequest request, Model model) throws Exception  {
		
		Map map = new HashMap();
		map.put("qano", qabbsDTO.getQano());
		map.put("passwd", qabbsDTO.getPasswd());
		
		boolean pflag = qabbsDAO.passCheck(map);	
		boolean flag = false;		
		String str = null;
		
		if(pflag) {
			flag= qabbsDAO.update(qabbsDTO);
				if(flag) {
					model.addAttribute("col", request.getParameter("col"));
					model.addAttribute("word", request.getParameter("word"));
					model.addAttribute("nowPage", request.getParameter("nowPage"));
					str = "redirect:/qabbs/list";
					}
				else {
					str = "error/Error";
				}
			} else {
				str = "error/passwdError";
			}
			
		return str;
		
	}
	
	@RequestMapping(value="/qabbs/update", method=RequestMethod.GET)
	public String update(int qano, Model model) throws Exception {
		QabbsDTO qabbsDTO = (QabbsDTO) qabbsDAO.read(qano);
		
		model.addAttribute("qabbsDTO", qabbsDTO);
		
		return "/qabbs/update";
		
	}
	
	@RequestMapping(value="/qabbs/delete", method=RequestMethod.POST)
	public String delete(QabbsDTO qabbsDTO, HttpServletRequest request, Model model) {
		Map map = new HashMap();
		map.put("qano", qabbsDTO.getQano());
		map.put("passwd", qabbsDTO.getPasswd());
		
		boolean pflag = qabbsDAO.passCheck(map);
		if(pflag){
			try {
				qabbsDAO.delete(qabbsDTO.getQano());				
				model.addAttribute("col", request.getParameter("col"));
				model.addAttribute("word", request.getParameter("word"));
				model.addAttribute("nowPage", request.getParameter("nowPage"));
				return "redirect:/qabbs/list";
			}catch(Exception e) {
				e.printStackTrace();
				return "/error/error";
				}
		}else{
			return "/error/passwdError";
		}
	}
	
	@RequestMapping(value="/qabbs/delete", method=RequestMethod.GET)
	public String delete(int qano, Model model) throws Exception {
				
		QabbsDTO qabbsDTO = (QabbsDTO) qabbsDAO.read(qano);
		
		boolean flag = qabbsDAO.checkRefnum(qano);
		
		model.addAttribute("qabbsDTO", qabbsDTO);
		model.addAttribute("flag", flag);		
		
		return "/qabbs/delete";
	}
	
	@RequestMapping(value="/qabbs/list")
	public String list(HttpServletRequest request, Model model) throws Exception {
		
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		
		if(col.equals("total")) word="";
		
		int nowPage= 1;
		int recordPerPage = 10;
		
		if(request.getParameter("nowPage")!=null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		// DB에서 가져올 순번
		int sno = ((nowPage-1)*recordPerPage) +1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		List<QabbsDTO> list = qabbsDAO.list(map);
		
		int totalRecord = qabbsDAO.total(map); 
		
		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("totalRecord", totalRecord);
	
	return "/qabbs/list";
		
	}
	
	@RequestMapping(value="qabbs/reply",method=RequestMethod.POST)
	public String reply(QabbsDTO qabbsDTO, HttpServletRequest request, Model model) {
		boolean flag = false;
		try {
			flag = qabbsDAO.replyCreate(qabbsDTO);
			if(flag) {
						
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			
				return "redirect:/qabbs/list";
			}else {
				return "error/error";
			}			
		}catch(Exception e) {
			
			e.printStackTrace();
						
			return "/error/error";
		}
	}
	
	@RequestMapping(value="qabbs/reply",method=RequestMethod.GET)
	public String reply(int qano, Model model) {
		QabbsDTO qabbsDTO = qabbsDAO.replyRead(qano);
		
		model.addAttribute("qabbsDTO", qabbsDTO);
		
		return "/qabbs/reply";
	}
	
	
	
}
