package spring.sts.game;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.member.MemberDAO;
import spring.model.user.UserDTO;

public class UserController {

	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private UserDTO udto;
	
	@RequestMapping(value="/")
	public String userlist(HttpSession session,String id, String passwd,Model model) {
		List<String> user;
		Map map = new HashMap();
		map.put("id", id);
		map.put("passwd", passwd);

		
		boolean flag = dao.loginCheck(map);
		List<String> userid = new ArrayList<String>();
		if(flag){
			userid.add(id);
			System.out.println(id);
		}
		
		model.addAttribute("userid", userid);
		model.addAttribute("udto", udto);
		return "redirect:/";
	}
	
	@RequestMapping(value="")
	public String du_list() {
		
		return "redirect:/";
	}
}
