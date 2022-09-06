package pack.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pack.admin.AdminBean;
import pack.admin.AdminInter;
import pack.shopmember.ShopmemberBean;
import pack.shopmember.ShopmemberDao;
import pack.shopmember.ShopmemberInter;
import pack.shopmember.ShopmemberDto;

@Controller
public class ShopAdminjoinController {

	@Autowired
	private AdminInter sainter;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value = "admininsert", method = RequestMethod.GET) 
	public String pinsert() {
		return "admininsert";
	}
	
	//중복체크
	@RequestMapping(value="adminidCheck", method=RequestMethod.POST)
	@ResponseBody
	public int idCheck(@RequestParam("admin_id") String admin_id){
	      int cnt = sainter.idCheck(admin_id);
	      System.out.println("cnt: " + cnt);
	      return cnt;
	   }
	
	//이메일 인증
	@RequestMapping(value= "mailCheck", method=RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email){
		
		// 난수 생성 (이메일 발송 용)
		Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111; //111111~999999
        
        /* 이메일 보내기 */
        String setFrom = "bada8111@naver.com";
        String toMail = email;
        String title = "Andrea Cho Shop 회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        
        try {
        	
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        System.out.println("first data : " + num);
        
        return num;
        
	}
		
	// 가입
	@RequestMapping(value = "insertAdmin", method = RequestMethod.POST)
	public String writeAdmin(Model model, AdminBean sabean, HttpSession session) {
		String rawPw = "";            // 인코딩 전 비밀번호
        String encodePw = "";        // 인코딩 후 비밀번호
        
        rawPw =sabean.getAdmin_pw(); // 비밀번호 데이터 얻음
        encodePw = pwEncoder.encode(rawPw);        // 비밀번호 인코딩
        sabean.setAdmin_pw(encodePw);  // 인코딩된 비밀번호 member객체에 다시 저장
        
		if(sainter.insAdmin(sabean)){
			return "redirect:adminlogin";
		}else {
			return "error";
		}
	}

}
