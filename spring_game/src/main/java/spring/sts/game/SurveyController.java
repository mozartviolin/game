package spring.sts.game;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.answer.AnswerDAO;
import spring.model.answer.AnswerDTO;
import spring.model.survey.SurveyDTO;

@Controller
public class SurveyController {

	@Autowired
	AnswerDAO answerDAO;
	
	
	
	
	@RequestMapping(value="/survey/result", method=RequestMethod.GET)
	public String result(Model model, HttpServletRequest request) throws Exception{
				
		int choise1 = answerDAO.result1View(1);
		int choise2 = answerDAO.result2View(1);
		int choise3 = answerDAO.result3View(1);
		
		model.addAttribute("choise1", choise1);
		model.addAttribute("choise2", choise2);
		model.addAttribute("choise3", choise3);
		
		return "/survey/result";
		
		}
	
	@RequestMapping(value="/survey/survey", method=RequestMethod.GET)
	public String vote() throws Exception{
		
		return "/survey/survey";
		
		}
	
	@RequestMapping(value="/survey/updatepoll", method=RequestMethod.POST)
	public String updatepoll(AnswerDTO answerDTO, Model model, HttpServletRequest request) throws Exception{
		Map map = new HashMap();
		map.put("sno", answerDTO.getSno());
		map.put("choise", answerDTO.getChoise());		
		
		boolean flag = false;		
			flag = answerDAO.updatepoll(map);	
		
		if(flag) {
			return "redirect:/survey/result";
		}else {
			return "error/error";
		}
		
		}
}
