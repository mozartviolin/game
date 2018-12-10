package spring.sts.game;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.answer.AnswerDAO;
import spring.model.answer.AnswerDTO;
import spring.model.survey.SurveyDAO;

@Controller
public class SurveyController {

	@Autowired
	AnswerDAO answerDAO;
	
	@Autowired
	SurveyDAO surveyDAO;
	
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
	
	@RequestMapping(value="/survey/result2", method=RequestMethod.GET)
	public String result2(Model model, HttpServletRequest request) throws Exception{
		
		int choise1 = answerDAO.result1View(2);
		int choise2 = answerDAO.result2View(2);
		int choise3 = answerDAO.result3View(2);
		
		model.addAttribute("choise1", choise1);
		model.addAttribute("choise2", choise2);
		model.addAttribute("choise3", choise3);
		
		return "/survey/result2";
		
	}
	
	@RequestMapping(value="/survey/survey", method=RequestMethod.GET)
	public String vote() throws Exception{
		
		return "/survey/survey";
		
		}
	
	@RequestMapping(value="/survey/updatepoll2", method=RequestMethod.POST)
	public String updatepoll2(Model model, HttpServletRequest request, 
			HttpServletResponse response) throws Exception{
		
		Map map2 = new HashMap();
		map2.put("sno", request.getParameter("sno"));
		map2.put("choise", request.getParameter("choise"));
		
		AnswerDTO answerDTO = (AnswerDTO) answerDAO.resultread(map2);
				
		int oldcount2 = answerDTO.getCount();	
        int c_count2_val = 0; 
        
        Cookie[] cookies = request.getCookies(); 
        Cookie cookie=null;            
             
        cookie = new Cookie("c_count2_val", String.valueOf(oldcount2)); 
        cookie.setMaxAge(60*60*24);         
        response.addCookie(cookie);      
        
         
        if (cookies != null){ 
         for (int i = 0; i < cookies.length; i++) { 
           cookie = cookies[i];            
         
         if(cookie.getName().equals("c_count2_val")){ 
             c_count2_val = Integer.parseInt(cookie.getValue()); 
             } 
          } 
        }
     
		
        Map map = new HashMap();
		map.put("sno", answerDTO.getSno());
		map.put("choise", answerDTO.getChoise());
        
		String str = "redirect:/survey/result2";
		
        if(c_count2_val == 0) {	
			if(answerDAO.updatepoll(map)) {
				return str;	
				}		
        	}
        	return str;	
		}
	
	
	@RequestMapping(value="/survey/updatepoll", method=RequestMethod.POST)
	public String updatepoll(Model model, HttpServletRequest request, 
			HttpServletResponse response) throws Exception{
		
		Map map2 = new HashMap();
		map2.put("sno", request.getParameter("sno"));
		map2.put("choise", request.getParameter("choise"));
		
		AnswerDTO answerDTO = (AnswerDTO) answerDAO.resultread(map2);
				
		int oldcount = answerDTO.getCount();	
        int c_count_val = 0; 
        
        Cookie[] cookies = request.getCookies(); 
        Cookie cookie=null;    
        
        cookie = new Cookie("c_count_val", String.valueOf(oldcount)); 
        cookie.setMaxAge(60*60*24);         
        response.addCookie(cookie);      
        
         
        if (cookies != null){ 
         for (int i = 0; i < cookies.length; i++) { 
           cookie = cookies[i];            
         
         if(cookie.getName().equals("c_count_val")){ 
             c_count_val = Integer.parseInt(cookie.getValue()); 
             } 
          } 
        }
        		
        Map map = new HashMap();
		map.put("sno", answerDTO.getSno());
		map.put("choise", answerDTO.getChoise());
        
		String str = "redirect:/survey/result";
		
        if(c_count_val == 0) {	
			if(answerDAO.updatepoll(map)) {
				return str;	
				}		
        	}
        	return str;	
		}
}

