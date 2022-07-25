package pack.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PmBuserController {

	// 진료과
	// 이비인후과 buser_n
	@RequestMapping("buser_n")
	public String buser_n() {
		return "buser_n";
	}

	// 내과 buser_i
	@RequestMapping("buser_i")
	public String buser_i() {
		return "buser_i";
	}

	// 소아과 buser_c
	@RequestMapping("buser_c")
	public String buser_c() {
		return "buser_c";
	}

	// 신경외과 buser_s
	@RequestMapping("buser_s")
	public String buser_s() {
		return "buser_s";
	}

	// 특성화센터 buser_u
	@RequestMapping("buser_u")
	public String buser_u() {
		return "buser_u";
	}

	// 협진센터 buser_co
	@RequestMapping("buser_co")
	public String buser_co() {
		return "buser_co";
	}

//--------------------------------------------의료진 소개
	// 이빈후과_의료진소개
	@RequestMapping("buser_n_doctor")
	public String buser_n_doctor() {
		return "buser_n_doctor";
	}

	// 내과_의료진소개
	@RequestMapping("buser_i_doctor")
	public String buser_i_doctor() {
		return "buser_i_doctor";
	}

	// 소아과_의료진소개
	@RequestMapping("buser_c_doctor")
	public String buser_c_doctor() {
		return "buser_c_doctor";
	}

	// 신경외과_의료진소개
	@RequestMapping("buser_s_doctor")
	public String buser_s_doctor() {
		return "buser_s_doctor";
	}

	// 특성화센터_의료진소개
	@RequestMapping("buser_u_doctor")
	public String buser_u_doctor() {
		return "buser_u_doctor";
	}

	// 협진센터_의료진소개
	@RequestMapping("buser_co_doctor")
	public String buser_co_doctor() {
		return "buser_co_doctor";
	}

//---------------------------------------- faq

	// 이비인후과_건강FAQ
	@RequestMapping("buser_n_faq")
	public String buser_n_faq() {
		return "buser_n_faq";
	}

	// 내과_건강FAQ
	@RequestMapping("buser_i_faq")
	public String buser_i_faq() {
		return "buser_i_faq";
	}

	// 소아과_건강FAQ
	@RequestMapping("buser_c_faq")
	public String buser_c_faq() {
		return "buser_c_faq";
	}

	// 신경외과_건강FAQ
	@RequestMapping("buser_s_faq")
	public String buser_s_faq() {
		return "buser_s_faq";
	}

	// 특성화센터_건강FAQ
	@RequestMapping("buser_u_faq")
	public String buser_u_faq() {
		return "buser_u_faq";
	}

	// 협진센터_건강FAQ
	@RequestMapping("buser_co_faq")
	public String buser_co_faq() {
		return "buser_co_faq";
	}

}
