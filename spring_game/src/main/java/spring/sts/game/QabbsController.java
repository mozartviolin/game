package spring.sts.game;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.qabbs.QReplyDAO;
import spring.model.qabbs.QReplyDTO;
import spring.model.qabbs.QabbsDAO;
import spring.model.qabbs.QabbsDTO;
import spring.utility.game.Utility;

@Controller
public class QabbsController {

	@Autowired
	private QabbsDAO qabbsDAO;
	
	@Autowired
	private QReplyDAO qreplyDAO;
	
	
	@RequestMapping(value="/qabbs/create", method=RequestMethod.POST)
	public String create(QabbsDTO qabbsDTO, Model model, HttpServletRequest request) throws Exception{
		boolean flag = false;		
		flag = qabbsDAO.create(qabbsDTO);	
		
		if(flag) {
			return "redirect:/qabbs/list";
		}else {
			return "/error/error";
		}
		
		}
	
	@RequestMapping(value="/qabbs/create", method=RequestMethod.GET)
	public String create(String id, HttpSession session, Model model,
			HttpServletRequest request) {
		
		if(session.getAttribute("id")==null) {
			return "/member/login";			
		}else {
			return "/qabbs/create";
		}
		
	}
	
	@RequestMapping(value="/qabbs/read")
	public String read(int qano, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
					
		QabbsDTO qabbsDTO = (QabbsDTO) qabbsDAO.read(qano);          
		qabbsDAO.upViewcount(qano);
		
        //조회수 cookie 처리 1일
        int oldviewcount = qabbsDTO.getViewcount();        
        int c_viewcount_val = 0; 
               
        Cookie[] cookies = request.getCookies(); 
        Cookie cookie=null;    
        
        cookie = new Cookie("c_viewcount_val", String.valueOf(oldviewcount)); // 조회수 값 저장 쿠키  
        cookie.setMaxAge(60*60*24);          // 1일 
        response.addCookie(cookie);          // 쿠키 기록  
        
        if (cookies != null){ 
         for (int i = 0; i < cookies.length; i++) { 
           cookie = cookies[i];            
         
         if(cookie.getName().equals("c_viewcount_val")){ 
             c_viewcount_val = Integer.parseInt(cookie.getValue()); // 쿠키 저장
            } 
          } 
        }    
    
        if(c_viewcount_val != 0) {        
            qabbsDAO.mViewcount(qano);
            }else{            
            }
                
        // 댓글 처리 begin
        int nPage = 1;
        if(request.getParameter("nPage")!=null) {
            nPage = Integer.parseInt(request.getParameter("nPage"));
        }
        
        int recordPerPage = 3;
        int sno = ((nPage-1)*recordPerPage) + 1;
        int eno = nPage * recordPerPage;
        
        Map map = new HashMap();
        map.put("sno", sno);
        map.put("eno", eno);
        map.put("qano", qano);
        
        List<QReplyDTO> qrlist = qreplyDAO.list(map);
        int total = qreplyDAO.qrtotal(qano);
        
        int nowPage = Integer.parseInt(request.getParameter("nowPage"));
        String col = request.getParameter("col");
        String word = request.getParameter("word");
        
        String url = "read?col="+col+"&word="+word+"&qano="+qano;
        String paging = Utility.rpaging(total, nowPage, recordPerPage, nPage, url);
    
        model.addAttribute("qrlist", qrlist);
        model.addAttribute("paging", paging);
        model.addAttribute("nPage", nPage);
        
        // 댓글처리 end 

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
					str = "/error/error";
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
		
		List<QabbsDTO> list = null;
		
		try {
			list = qabbsDAO.list(map);
		
			} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		
		int totalRecord = 0;
		
		try {
			totalRecord = qabbsDAO.total(map); 
			}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		
		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("totalRecord", totalRecord);		
		
		model.addAttribute("qreplyDAO", qreplyDAO);
		
	
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
				return "/error/error";
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
	
	//댓글
	@RequestMapping("/qabbs/rdelete")
	public String rdelete(int rnum, int qano, String nowPage, String col, 
				String word, int nPage, Model model) throws Exception {
		
		int total = qreplyDAO.qrtotal(qano);
		int totalPage = (int)(Math.ceil((double)total/3)); // 올림		
		
		if(qreplyDAO.delete(rnum)) {
			if(nPage!=1 &&  nPage==totalPage && (total%3)==1) 
				nPage=nPage-1;
			model.addAttribute("qano", qano);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nPage", nPage);
			return "redirect:/qabbs/read";
		}else {
			return "/error/error";
		}
	}
	
	//댓글 수정
	@RequestMapping(value="/qabbs/rupdate", method=RequestMethod.POST)
	public String rupdate(QReplyDTO qreplyDTO, Model model, String col, String word, String nowPage, 
			String nPage) throws Exception {
		
		if(qreplyDAO.update(qreplyDTO)) {
			model.addAttribute("qano", qreplyDTO.getQano());
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nPage", nPage);
			return "redirect:/qabbs/read";
		}else {
			return "/error/error";
		}		
		
	}
	
	//댓글 작성
	@RequestMapping(value="/qabbs/rcreate", method=RequestMethod.POST)
	public String rcreate(QReplyDTO qreplyDTO, Model model, String col, String word, String nowPage) 
			throws Exception {
		boolean flag = false;
		flag = qreplyDAO.create(qreplyDTO);
		if(flag) {
			model.addAttribute("qano", qreplyDTO.getQano());
			model.addAttribute("nPage", 1);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			return "redirect:/qabbs/read";
			
		}else {
			return "/error/error";
		}			
	}
		
	
	
}
