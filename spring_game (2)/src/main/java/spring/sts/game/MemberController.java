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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.member.MemberDAO;
import spring.model.member.MemberDTO;
import spring.model.user.UserDAO;
import spring.utility.game.Utility;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private UserDAO udao;

	
	
	@RequestMapping("/member/callback")
	public String callback() {
		
		return "/member/callback";
	}
	
	@RequestMapping(value="/member/delete", method=RequestMethod.GET)
	public String delete(String id, HttpSession session, Model model) {
		
		if(id==null) {
			id = (String)session.getAttribute("id");
		}
		
		model.addAttribute("id", id);
		
		return "/member/delete";
	}
	
	@RequestMapping(value="/member/delete", method=RequestMethod.POST)
	public String delete(String id, HttpServletRequest request, Model model, HttpSession session,
			@RequestParam Map<String,String> map) {
		
		String sid = (String)session.getAttribute("id");
		String grade = (String)request.getSession().getAttribute("grade");
		
		boolean flag = false;
		boolean pflag = memberDAO.loginCheck(map);
		
		if(pflag) {
			if(sid != null && !grade.equals("1")) {
				try {
					flag = memberDAO.delete(id);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				session.invalidate();
				
				return "redirect:/";
			}else {
				model.addAttribute("col", request.getParameter("col"));
				model.addAttribute("word", request.getParameter("word"));
				model.addAttribute("nowPage", request.getParameter("nowPage"));
				
				return "redirect:/admin/list";
			}
		}else {
			
			return "/error/passwdError";
		}
	}
	
	
	@RequestMapping(value = "/member/update", method=RequestMethod.GET)
	public String update(String id, Model model) {
		
		MemberDTO memberDTO = null;
		
		try {
			memberDTO = (MemberDTO) memberDAO.read(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("memberDTO", memberDTO);
		
		return "/member/update";
	}
	
	@RequestMapping(value="/member/update", method=RequestMethod.POST)
	public String update(MemberDTO memberDTO, HttpSession session, Model model,
			HttpServletRequest request) {

		boolean flag = false;
		
		try {
			flag = memberDAO.update(memberDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(flag) {
			if(session.getAttribute("id")!=null && session.getAttribute("grade").equals("1")) {
				
				model.addAttribute("col", request.getParameter("col"));
				model.addAttribute("word", request.getParameter("word"));
				model.addAttribute("nowPage", request.getParameter("nowPage"));
				
				return "redirect:/admin/list";
			}else {
				return "redirect:/";
			}
		}else {
			
			return "error/error";
		}
		
	}
	
	
	@RequestMapping(value="/member/read", method=RequestMethod.GET)
	public String read(String id, Model model, HttpServletRequest request) {
		
		if(id == null) {
			id = (String)request.getSession().getAttribute("id");
		}
		
		MemberDTO memberDTO = null;
		try {
			memberDTO = (MemberDTO) memberDAO.read(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("memberDTO", memberDTO);
		return "/member/read";
	}
	
	@RequestMapping("member/read")
	public String read(MemberDTO memberDTO, Model model) {
		
		
		float per = 0;
		
		if(memberDTO.getPlaynum() !=0 && memberDTO.getWin() !=0) {
			per = (memberDTO.getWin()/memberDTO.getPlaynum())*100;
		}
		
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("per", per);
		
		return "/member/read";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/member/pwfind", method=RequestMethod.GET, produces="text/plain;charset=utf-8")
	public String pwfind(@RequestParam Map<String, String> map) {
		
		String pw = memberDAO.searchPW(map);
		String str = null;
		
		if(pw!=null) {
			str = "찾으시는 비밀번호는 " + pw + "입니다.";
		}else {
			str = "존재하지 않거나 잘못 입력하였습니다.";
		}
		
		return str;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/member/idfind",method=RequestMethod.GET, produces="text/plain;charset=utf-8")
	public String idfind(@RequestParam Map<String, String> map) {
		
		String id = memberDAO.searchID(map);
		String str = null;
		
		if(id!=null) {
			str = "찾으시는 아이디는 "+ id + "입니다.";
		}else {
			str = "존재하지 않거나 잘못 입력하였습니다.";
		}
		
		return str;
	}
	
	
	
	@RequestMapping("/member/idpwfind")
	public String idpwfind() {
		
		return "/member/idpwfind";
	}
	
	@ResponseBody
	@RequestMapping(value="/member/idCheck", method=RequestMethod.GET, produces="text/plain;charset=utf-8")
	public String idCheck(String id) {
		
		boolean flag = memberDAO.dupliID(id);
		String str = null;
		
		if(flag) {
			str = "중복된 아이디입니다.";
			
		}else {
			str = "사용 가능합니다.";
		}
		
		return str;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/member/nicCheck", method=RequestMethod.GET, produces="text/plain;charset=utf-8")
	public String nicCheck(String nicname) {
		
		boolean flag = memberDAO.dupliNic(nicname);
		String str = null;
		
		if(flag) {
			str = "중복된 닉네임입니다.";
					
		}else {
			str = "사용 가능합니다.";
		}
		
		return str;
	}
	
	@RequestMapping("/member/createProc")
	public String pcreate(Model model, HttpServletRequest request, MemberDTO memberDTO) {
		
		String str = null;
		String url = "/member/pcreate";
		
		if(memberDAO.dupliID(memberDTO.getId())) {
			str = "아이디 중복확인을 하세요.";
			model.addAttribute("str", str);
			
		}else if(memberDAO.dupliNic(memberDTO.getNicname())) {
			str = "닉네임 중복확인을 하세요.";
			model.addAttribute("str", str);
			
		}else {
			
			boolean flag = false;
			
			try {
				flag = memberDAO.create(memberDTO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			model.addAttribute("flag", flag);
			url = "/member/createProc";
		}
		
		return url;
	}
	
	
	@RequestMapping("/member/create")
	public String create() {
		
		return "/member/create";
	}
	
	
	@RequestMapping("/member/agree")
	public String agree() {
		
		return "/member/agree";
	}
	
	
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		String sessionNicname=(String)session.getAttribute("nicname");
		udao.delete(sessionNicname);
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public String login(HttpServletRequest request) {
		
		String c_id = "";
		String c_id_val = "";
		
		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;
		
		if(cookies != null) {
			for(int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];
				
				if(cookie.getName().equals("c_id")) {
					c_id = cookie.getValue();
				}else if(cookie.getName().equals("c_id_val")){
					c_id_val = cookie.getValue();
				}
			}
		}
		
		request.setAttribute("c_id", c_id);
		request.setAttribute("c_id_val", c_id_val);
		
		return "/member/login";
	}
	
	@RequestMapping("/member/loginc")
	public String login(@RequestParam Map<String,String> map, String c_id, HttpSession session, HttpServletResponse response,
			Model model, HttpServletRequest request) {
		
		String uniqId = request.getParameter("uniqId");
		String nickName = request.getParameter("nickName"); 
		//System.out.println("1번 : "+nickName);
		
		
		if(uniqId != null && nickName != null) {
			
			session.setAttribute("id", uniqId);
			session.setAttribute("grade", "0");
			session.setAttribute("nicname", nickName);
			String sessionNicname=(String)session.getAttribute("nicname");
			udao.create(sessionNicname);
			
			
			
			
			return "redirect:/";
		}
		
		//System.out.println("2번 : "+session.getAttribute("nicname"));
		
		String id = (String)map.get("id");
		boolean flag = memberDAO.loginCheck(map);
		
		String url = "/error/passwdError";
				
		if(flag ) {
			Map gmap = memberDAO.getGradeAnicname(id);
			
			//System.out.println("3번 : "+nickName);
			session.setAttribute("id", id);
			session.setAttribute("grade", gmap.get("GRADE"));
			session.setAttribute("nicname", gmap.get("NICNAME"));
			
			
			String sessionNicname=(String)session.getAttribute("nicname");
			udao.create(sessionNicname);
			
//			if(nickName != null) {
//				System.out.println("sksksk");
//				System.out.println(nickName);
//				udao.create(nickName);
//				
//			}else if(session.getAttribute("nicname") != null) {
//				System.out.println(session.getAttribute("nicname"));
//				String sessionNicname=(String)session.getAttribute("nicname");
//				udao.create(sessionNicname);
//			}
//			
//			
			Cookie cookie = null;
			
			if(c_id != null) {
				cookie = new Cookie("c_id", "Y");
				cookie.setMaxAge(120);
				response.addCookie(cookie);
				
				cookie = new Cookie("c_id_val", id);
				cookie.setMaxAge(120);
				response.addCookie(cookie);
						
			}else {
				cookie = new Cookie("c_id", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				
				cookie = new Cookie("c_id_val", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			
			url = "redirect:/";
			
			
			/*댓글쓰기 페이지로 돌아가기*/
			
			String rflag = request.getParameter("flag");
			String nPage = request.getParameter("nPage");
			String bbsno = request.getParameter("bbsno");
			String breplyno = request.getParameter("breplyno");
			String col = request.getParameter("col");
			String word = request.getParameter("word");
			String nowPage = request.getParameter("nowPage");
			
			if(rflag != null && !rflag.equals("")) {
				url = "redirect:" + rflag;
				model.addAttribute("bbsno", bbsno);
				model.addAttribute("breplyno", breplyno);
				model.addAttribute("nPage", nPage);
				model.addAttribute("col", col);
				model.addAttribute("word", word);
				model.addAttribute("nowPage", nowPage);
			}
		}
		
		return url;
	}

	@RequestMapping("/admin/list")
	public String list(HttpServletRequest request, Model model) {
		
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		if(col.equals("total")) word = "";
		
		int nowPage = 1;
		int recordPerPage = 5;
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
		
	
		List<MemberDTO> list = null;
		
		try {
			list = memberDAO.list(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int totalRecord = 0;
		
		try {
			totalRecord = memberDAO.total(map);
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
		
		return "/admin/list";
	}
}
