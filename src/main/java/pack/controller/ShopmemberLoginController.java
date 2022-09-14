package pack.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.shopmember.ShopmemberDto;
import pack.shopmember.ShopmemberInter;

@Controller
public class ShopmemberLoginController {
	
	@Autowired
	private ShopmemberInter sminter;
	
	@Autowired //(비밀번호 인코팅용)
	private BCryptPasswordEncoder pwEncoder;
	
	//로그인 호출
	@RequestMapping(value="shopmemberloginform", method = RequestMethod.GET)
	public String login() {
		return "shopmemberloginform";
	}
	
	//로그인 호출
	@RequestMapping(value="shopmemberlogin", method = RequestMethod.GET)
	public String goLogin(HttpSession session) {
		session.invalidate();
		return "shopmemberloginform";
	}
	

	@RequestMapping(value="shopmemberlogin", method = RequestMethod.POST)
	public ModelAndView submitLogin(ModelAndView mv, HttpSession session, 
			@RequestParam("member_id") String member_id, 
			@RequestParam("member_pw") String member_pw) {
		
		// 암호화된 비밀번호를 호출하기 위해 생성
		String rawPw = "";
	    String encodePw = "";
	    
	    // 우선 입력한 아이디 값이 동일한지 체크
		ShopmemberDto smdto = sminter.getLoginInfo(member_id);
		
		//아이디가 있을 경우
		if(smdto != null) {
			rawPw = member_pw; // 사용자가 입력한 비밀번호 호출
			encodePw = smdto.getMember_pw();        // 데이터베이스에 저장한 인코딩된 비밀번호 불러오기
			
			if(true == pwEncoder.matches(rawPw, encodePw)) { // 비밀번호가 맞는지 체크
				smdto.setMember_pw(""); // 비밀번호가 동일하니 보안을 위해 인코딩된 비밀번호는 삭제 
				// 세션에 데이터 정보 저장
				// session.setAttribute("smbean", smdto); 
				//-> 이렇게 할경우 requestParam(입력 파라미터 호출)대신 bean을 호출해서 사용 
				session.setAttribute("member_id", member_id);
				session.setAttribute("member_pw", member_pw);
				mv.setViewName("main");
				return mv; //(모델뷰 타입으로 던지기, 페이지 안에 데이터를 넣기위해서 이리함, 걍 view 페이지로 던저도 무방)
				
			}else{
				mv.addObject("url", "shopmemberloginform");
				mv.addObject("msg", "비밀번호가 일치하지 않습니다!");
				mv.setViewName("shopmemberloginerr");
				return mv;
			}
		}else{
			mv.addObject("url", "shopmemberloginform");
			mv.addObject("msg", "존재하지 않는 아이디입니다!");
			mv.setViewName("shopmemberloginerr");
				return mv;
			}
	}

	
	// 로그아웃
		@RequestMapping("shopmemberlogout")
	    public ModelAndView logout(HttpSession session) {
			sminter.smlogout(session);
			//session.invalidate();
			ModelAndView mv = new ModelAndView();
			mv.setViewName("shopmemberlogout");
			return mv; //(모델뷰 타입으로 던지기, 페이지 안에 데이터를 넣기위해서 이리함, 걍 view 페이지로 던저도 무방)
	    }


	
	
	

}
