package pack.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pack.admin.AdminDto;
import pack.admin.AdminInter;

@Controller
public class ShopAdminLoginController {
	
	@Autowired
	private AdminInter admininter;
	
	@Autowired //(비밀번호 인코팅용)
	private BCryptPasswordEncoder pwEncoder;
	
	//로그인 호출
	@RequestMapping(value="adminlogin", method = RequestMethod.GET)
	public String login() {
		return "adminlogin";
	}
	
	//로그인 호출
	@RequestMapping(value="adminloginerr", method = RequestMethod.GET)
	public String goLogin(HttpSession session) {
		session.invalidate();
		return "adminlogin";
	}
	
	//로그인 진행
	@RequestMapping(value="adminloginaction", method = RequestMethod.POST)
	public ModelAndView submitLogin(ModelAndView mv, HttpSession session, 
			@RequestParam("admin_id") String admin_id, 
			@RequestParam("admin_pw") String admin_pw) {
		
		// 암호화된 비밀번호를 호출하기 위해 생성
		String rawPw = "";
	    String encodePw = "";
	    
	    // 우선 입력한 아이디 값이 동일한지 체크
		AdminDto sadto = admininter.getLoginInfo(admin_id);
		
		//아이디가 있을 경우
		if(sadto != null) {
			rawPw = admin_pw; // 사용자가 입력한 비밀번호 호출
			encodePw = sadto.getAdmin_pw();        // 데이터베이스에 저장한 인코딩된 비밀번호 불러오기
			
			if(true == pwEncoder.matches(rawPw, encodePw)) { // 비밀번호가 맞는지 체크
				sadto.setAdmin_pw(""); // 비밀번호가 동일하니 보안을 위해 인코딩된 비밀번호는 삭제 
				// 세션에 데이터 정보 저장
				// session.setAttribute("smbean", smdto); 
				//-> 이렇게 할경우 requestParam(입력 파라미터 호출)대신 bean을 호출해서 사용 
				session.setAttribute("admin_id", admin_id);
				session.setAttribute("admin_pw", admin_pw);
				mv.setViewName("/admin/amain");
				return mv; //(모델뷰 타입으로 던지기, 페이지 안에 데이터를 넣기위해서 이리함, 걍 view 페이지로 던저도 무방)
				
			}else{
				mv.addObject("url", "adminlogin");
				mv.addObject("msg", "비밀번호가 일치하지 않습니다!");
				mv.setViewName("adminloginerr");
				return mv;
			}
		}else{
			mv.addObject("url", "adminlogin");
			mv.addObject("msg", "존재하지 않는 아이디입니다! 관리자에게 문의하세요.");
			mv.setViewName("adminloginerr");
				return mv;
			}
	}

	
	// 로그아웃
		@RequestMapping("adminlogout")
	    public ModelAndView logout(HttpSession session) {
			admininter.salogout(session);
			//session.invalidate();
			ModelAndView mv = new ModelAndView();
			mv.setViewName("adminlogin");
			return mv; //(모델뷰 타입으로 던지기, 페이지 안에 데이터를 넣기위해서 이리함, 걍 view 페이지로 던저도 무방)
	    }


	
	
	

}
