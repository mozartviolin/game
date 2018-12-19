package spring.sts.game;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Mini_gameController {

	
	
	@RequestMapping("/mini_game/baseball")
	public String baseball() {
		return "/mini_game/baseball";
	}
	
	@RequestMapping("/mini_game/brick")
	public String brick() {
		System.out.print("확인");
		return "/mini_game/brick";
	}
	
	@RequestMapping("mini_game/rgbbomb")
	public String rgbbomb() {
		return "/mini_game/rgbbomb";
	}
	
	@RequestMapping("mini_game/dung")
	public String dung() {
		return "/mini_game/dung";
	}

	
	@RequestMapping("/ticTacToe/omok_index")
		public String omok(String id, HttpSession session) {
		
		 return "/ticTacToe/omok_index";
		}
	
	@RequestMapping("/ticTacToe/list")
	public String omoklist(String id, HttpSession session) {
	
	 return "/ticTacToe/list";
	}
	
	/*@RequestMapping("/ticTacToe/game")
	public String omokgame(String id, HttpSession session) {
		
		return "/ticTacToe/game";
	}*/
	
	
}
