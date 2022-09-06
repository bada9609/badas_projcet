package pack.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import pack.shopmember.ShopmemberBean;

public interface AdminInter {
	
	// 홈페이지 관리자회원가입
	boolean insAdmin(AdminBean sabean);

	// 아이디 중복 방지
	public int idCheck(String admin_id);
	
	// 로그인
	List<AdminDto> AdminList();
	AdminDto getLoginInfo(String admin_id);
	
	// 로그아웃
	void salogout(HttpSession session);


}
