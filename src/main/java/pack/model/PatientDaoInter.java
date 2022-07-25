package pack.model;

import java.util.List;

import javax.servlet.http.HttpSession;

import pack.controller.PatientBean;

public interface PatientDaoInter {
	public void patientJoinMethod(PatientDto pdto);

	// 로그인
	List<PatientDto> patientList();

	PatientDto getLoginInfo(String p_id);

	// 개인정보 가져오기
	PatientDto mydata(String p_id);

	// 로그아웃
	void logout(HttpSession session);

	// 환자 번호
	List<PatientDto> patientnum(String p_id);

	// 회원가입
	boolean insert(PatientDto pdto);
	
	// 아이디 중복 방지
	PatientDto idcheck(String p_id);

	List<PatientDto> getDataAll();

	PatientDto selectPart(String p_number);

	boolean p_upData(PatientBean p_bean);

	boolean p_delData(String p_id);
}
