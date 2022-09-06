package pack.shopmember;

import java.util.List;

import javax.servlet.http.HttpSession;


public interface ShopmemberInter {
	// 홈페이지 일반회원가입
	boolean insShopmember(ShopmemberBean smbean);

	// 아이디 중복 방지
	public int idCheck(String member_id);
	
	// 로그인
	List<ShopmemberDto> shopmemberList();
	ShopmemberDto getLoginInfo(String member_id);
	
	// 로그아웃
	void smlogout(HttpSession session);

}
