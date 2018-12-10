package spring.sts.game;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.message.MessageDAO;
import spring.model.message.MessageDTO;
import spring.utility.game.Utility;

@Controller
public class MessageController {
	
	@Autowired
	private MessageDAO messageDAO;


	@RequestMapping(value = "/message/delete", method = RequestMethod.GET)
	public String delete(int mno, HttpServletRequest request) {

		return "/message/delete";
	}

	@RequestMapping(value = "/message/delete", method = RequestMethod.POST)
	public String delete(int mno, HttpServletRequest request, Model model) {


			try {
				if (messageDAO.delete(mno)) {
					model.addAttribute("nowPAge", request.getParameter("nowPage"));
					model.addAttribute("col", request.getParameter("col"));
					model.addAttribute("word", request.getParameter("word"));
					return "redirect:/message/list";
				} else {
					return "/error/error";
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "/message/list";

		} 	

	@RequestMapping(value = "/message/update", method = RequestMethod.GET)
	public String update(int mno, Model model) {

		MessageDTO messageDTO = null;
		try {
			messageDTO = (MessageDTO)messageDAO.read(mno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addAttribute("dto", messageDTO);

		return "/message/update";
	}

	@RequestMapping(value = "/message/update", method = RequestMethod.POST)
	public String update(MessageDTO messageDTO, HttpServletRequest request, Model model) {

			try {
				if (messageDAO.update(messageDTO)) {
					model.addAttribute("nowPage", request.getParameter("nowPage"));
					model.addAttribute("col", request.getParameter("col"));
					model.addAttribute("word", request.getParameter("word"));
					return "redirect:/message/list";
				} else {
					return "/error/error";
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "/message/list";
		}

	@RequestMapping("/message/read")
	public String read(int mno, Model model,HttpServletRequest request) {

		messageDAO.upviewcnt(mno);

		MessageDTO messageDTO = null;
		try {
			messageDTO = (MessageDTO)messageDAO.read(mno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String content = messageDTO.getContent();
		content = content.replace("\r\n", "<br>");

		messageDTO.setContent(content);

		model.addAttribute("dto", messageDTO);

		
		return "/message/read";
	}

	@RequestMapping(value = "/message/create", method = RequestMethod.POST)
	public String create(MessageDTO messageDTO, HttpServletRequest request) {

		boolean flag = false;
		try {
			flag = messageDAO.create(messageDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (flag) {
			return "redirect:/message/list";

		} else {
			return "/error/error";
		}
	}

	@RequestMapping(value = "/message/create", method = RequestMethod.GET)
	public String create() {
		return "/message/create";
	}

	@RequestMapping("/message/list")
	public String list(HttpServletRequest request, Model model,HttpSession session) {

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
		map.put("nicname", session.getAttribute("nicname"));
		
		System.out.println("nicname"+session.getAttribute("nicname"));

		List<MessageDTO> list = null;
		try {
			list = messageDAO.list(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 전체 레코드 갯수의 필요한 매개변수(col,word). 비교해야함
		int totalRecord = 0;
		try {
			totalRecord = messageDAO.total(map);
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

		return "/message/list";
	}

}
