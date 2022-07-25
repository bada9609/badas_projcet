package pack.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.doctor.DoctorDto;
import pack.model.AdminDaoInter;
import pack.model.AdminDto;
import pack.model.DoctorDaoInter;
import pack.model.PatientDaoInter;
import pack.model.PatientDto;

@Controller
public class ALoginController {
	
	@Autowired
	private AdminDaoInter ainter;
	
	@RequestMapping(value="aloginform", method = RequestMethod.GET)
	public String dlogin() {
		return "aloginform";
	}
	
	@RequestMapping(value="alogin", method = RequestMethod.GET)
	public String goALogin(HttpSession session) {
		session.invalidate();
		return "aloginform";
	}
	

	@RequestMapping(value="alogin", method = RequestMethod.POST)
	public ModelAndView submitLogin(ModelAndView mv, HttpSession session,  
	@RequestParam("a_id") String a_id, @RequestParam("a_pw") String a_pw) {
		
		AdminDto adto = ainter.getAdminData(a_id);
		if(adto != null) {
			String retPass = adto.getA_pw();
			//System.out.println(retPass + " " + p_pw);
			if(retPass.equals(a_pw)) {
				session.setAttribute("a_id", a_id);
				session.setAttribute("a_pw", a_pw);
				mv.setViewName("amain");
				return mv;
			}else if(adto != null || !retPass.equals(a_pw)) {
				mv.addObject("url", "aloginform");
				mv.addObject("msg", "비밀번호가 일치하지 않습니다!");
				mv.setViewName("loginerr");
					return mv;
			}
		}else{
			mv.addObject("url", "aloginform");
			mv.addObject("msg", "존재하지 않는 아이디입니다!");
			mv.setViewName("loginerr");
				return mv;
			}
		return mv;
	}

	
	// 로그아웃
		@RequestMapping("alogout")
	    public ModelAndView logout(HttpSession session) {
			ainter.alogout(session);
			ModelAndView mv = new ModelAndView();
			mv.setViewName("aloginform");
			return mv;
	    }


	
	
	

}
