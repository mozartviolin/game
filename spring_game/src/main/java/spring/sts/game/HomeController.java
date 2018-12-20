package spring.sts.game;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.apache.tiles.template.AddAttributeModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.member.MemberDAO;
import spring.model.member.MemberDTO;
import spring.model.user.UserDAO;
import spring.model.user.UserDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private UserDAO udao;
	@Autowired
	private MemberDAO memberDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws IOException 
	 * @throws Exception 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, MemberDTO memberDTO,
			UserDTO userDTO, HttpServletRequest request, HttpSession session, 
			HttpServletResponse response) throws IOException{
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
				
		List<UserDTO> list =udao.list();
		
		/*		if(session.getAttribute("nicname")!=null) {
			mList.add("nicnames");
			}*/
/*		System.out.println("mList : " + mList);*/
				
/*		// 33
		
				String session_name= ""; 

				//session_name은 세션의 이름으로 저장할 변수다.

				String session_value= "";

				//session_value는 세션의 내용으로 저장할 변수다.	 

				Enumeration enum_01 = session.getAttributeNames(); 
				
				세션에 모든 이름들을 Enumeration에 하나씩 저장한다.

				   Enumeration 순서를 가진 배열의 종류 이놈의 제일 중요한건 바로 커서!!

				  나중에 커서에대해서 자세히 포스팅하기로 

				int i=0;

				while(enum_01.hasMoreElements()){ 

				//hasMoreElements 0부터 시작 값이 있으면 true의 의미

				 i++;

				 session_name= enum_01.nextElement().toString(); 

				//해당 Enumeration 에서 세션이름을 꺼내고

				 session_value= session.getAttribute(session_name).toString(); 

				//해당이름을 가지고 세션 밸류를 꺼낸다.	 

				System.out.println("SESSION NAME[ " + session_name +" ] SESSION VALUE [ " + session_value + " ]");
				System.out.println("========================================");   
				
								  
				}*/ 

		Enumeration enum_01 = session.getAttributeNames(); 
		
		int i=0;

		while(enum_01.hasMoreElements()){ 

		//hasMoreElements 0부터 시작 값이 있으면 true의 의미

		 i++;

		String session_name= enum_01.nextElement().toString(); 
		
		//해당 Enumeration 에서 세션이름을 꺼내고

		String session_value= session.getAttribute(session_name).toString(); 

		//해당이름을 가지고 세션 밸류를 꺼낸다.

		System.out.println("SESSION NAME[ " + session_name +" ] SESSION VALUE [ " + session_value + " ]");
		System.out.println("========================================");   
		}
			
		
		String nicn = (String) session.getAttribute("nicname");
		System.out.println("nicname : " + nicn);
		
/*		System.out.println("닉네임들: " + session.getAttribute("nicname"));
		System.out.println("닉네임들getvalue: " + session.getValue("nicname"));*/
		
		
		model.addAttribute("list",list);
		model.addAttribute("serverTime", formattedDate );
		
		return "/home";
	}

}

