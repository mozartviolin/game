package spring.sts.game;

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

}
