package pack.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pack.shopmember.ShopmemberBean;
import pack.shopmember.ShopmemberDao;
import pack.shopmember.ShopmemberInter;
import pack.shopmember.ShopmemberDto;

@Controller
public class ShopmemberjoinController {

	@Autowired
	private ShopmemberInter sminter;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	@RequestMapping(value = "insertsm", method = RequestMethod.GET) 
	public String pinsert() {
		return "shopmemberinsert";
	}
	
	//중복체크
	@RequestMapping(value="idCheck", method=RequestMethod.POST)
	@ResponseBody
	public int idCheck(@RequestParam("member_id") String member_id){
	      int cnt = sminter.idCheck(member_id);
	      System.out.println("cnt: " + cnt);
	      return cnt;
	   }
	
	// 가입
	@RequestMapping(value = "insertShopMember", method = RequestMethod.POST)
	public String writeShopmember(Model model, ShopmemberBean smbean, HttpSession session) {
		String rawPw = "";            // 인코딩 전 비밀번호
        String encodePw = "";        // 인코딩 후 비밀번호
        
        rawPw =smbean.getMember_pw(); // 비밀번호 데이터 얻음
        encodePw = pwEncoder.encode(rawPw);        // 비밀번호 인코딩
        smbean.setMember_pw(encodePw);  // 인코딩된 비밀번호 member객체에 다시 저장
        
		if(sminter.insShopmember(smbean)){
			return "redirect:/shopmemberloginform";
		}else {
			return "error";
		}
	}

}
