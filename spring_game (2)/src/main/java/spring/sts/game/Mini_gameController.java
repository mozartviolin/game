package spring.sts.game;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Mini_gameController {

	
	
	@RequestMapping("/game/baseball")
	public String baseball() {
		return "/game/baseball";
	}
	
	@RequestMapping("/game/brick")
	public String brick() {
		System.out.print("확인");
		return "/game/brick";
	}
	
	@RequestMapping("/game/rgbbomb")
	public String rgbbomb() {
		return "/game/rgbbomb";
	}

	
	@RequestMapping("/ticTacToe/omok_index")
		public String omok(String id, HttpSession session) {
		
		 return "/ticTacToe/omok_index";
		}
	
	
}
