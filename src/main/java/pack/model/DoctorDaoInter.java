package pack.model;

import java.util.List;

import javax.servlet.http.HttpSession;

import pack.controller.DoctorBean;
import pack.doctor.DoctorDto;

public interface DoctorDaoInter {

	// 로그인
	DoctorDto getLoginInfo(String d_id);

	// 의사 리스트 출력
	List<DoctorDto> doctorList();

	// 의사 개인정보 가져오기
	DoctorDto dmydata(String d_id);
	DoctorDto selectDoctor(String d_number);
	
	// 의사 정보 수정
	boolean updateDoctor(DoctorBean dbean);
	
	//관리자 의사 추가
	boolean insDoctor(DoctorBean dbean);
	
	// 아이디 중복 방지
	DoctorDto checkdid(String d_id);

	// 로그아웃
	void dlogout(HttpSession session);

}
